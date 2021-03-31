module stream_aligner_new (
	input wire 			clk,
	input wire 			resetn,
	input wire 			frame_start_new, 
	input wire 			frame_start_ref,
	input wire 			control_new, 
	input wire 			control_ref,
	input wire 			enable,
	input wire 			tvalid_new,
	input wire 			tvalid_ref,
	input wire 			treadyOut_new,
	input wire 			treadyOut_ref,
	output reg		   	tready_new,
	output reg		   	tready_ref,
	output reg		   	tvalidOut_new,
	output reg		   	tvalidOut_ref
	);
	
parameter [1:0] idle=2'd0, sync_with_ref=2'd1, sync_with_new=2'd2, synchronized=2'd3;
reg [1:0] cs;
reg [1:0] ns;


// Sequential FSM
always@(posedge clk, negedge resetn)
begin
	if (resetn==1'b0)
		cs<=idle;
	else
		cs<=ns;
end

// Combinational FSM
always@(*)
begin
	case (cs)
		
		/* In the idle state the stream from the camera is let through regardless of the enable signal.
		Then, the enable signal is checked and triggers the synchronization procedure when equal to 1. */
		
		idle:
		begin
		    tvalidOut_new = tvalid_new;
		    tready_new = treadyOut_new;
			tready_ref = treadyOut_ref;
			tvalidOut_ref = tvalid_ref;
			if (enable==1'b0)
			 begin
				ns=cs;
			 end	
			else
			begin
				case ({frame_start_new, frame_start_ref})

					2'b00:
						ns=cs;
			
					2'b10:
						ns=sync_with_ref;
				
					2'b01:
						ns=sync_with_new;
			
					2'b11:
						ns=synchronized;
				
					default:
						ns=idle;
				endcase
			end
		end
		
		/* This state is reached when the SOF from the camera occurs --> the camera stream stops and the reference one
		is read until the SOF occurs. At that point the streams are synchronized. */
		
		sync_with_ref:
		begin
			tready_new = 1'b1;	// Passing stream from the camera. 
			tready_ref = 1'b0;   // Read from the reference stream and discard data until the SOF is reached.
			tvalidOut_new = tvalid_new;	// Camera output is valid according to its tvlaid signal
			tvalidOut_ref = 1'b0;	// the reference is invalid for the background eraser
			if (control_new==1'b1)
			begin	
				if (frame_start_new==1'b1 && frame_start_ref==1'b1)
					ns=synchronized;
				else	
					ns=idle;
			end
			else
				ns=idle;
		end
		
		/* This state is reached when the SOF from the reference stream occurs --> the reference stream stops and the one coming from the camera
		is read until the SOF occurs. At that point the streams are synchronized. */
		
		sync_with_new:
		begin
			tready_new = 1'b1;	// Read from stream 0 and discard data.
			tready_ref = 1'b0;	// Block stream 1.
			tvalidOut_new = 1'b0;	// Output is invalid.
			tvalidOut_ref = 1'b0;	// Output is invalid.
			if (control_ref==1'b1)
			begin	
				if (frame_start_new==1'b1 && frame_start_ref==1'b1)
					ns=synchronized;
				else	
					ns=cs;
			end
			else
				ns=idle;
		end
		
		/* This state is reached when the two streams are synchronized --> they are transmitted until one of them stops. 
		Then, they need to be synchronized again. */
		
		synchronized:
		begin
			tready_new = treadyOut_new && treadyOut_ref;
			tready_ref = treadyOut_new && treadyOut_ref;
			tvalidOut_new = tvalid_new;
			tvalidOut_ref = tvalid_ref;
			if (control_new==1'b0 || control_ref==1'b0)
				ns=idle;
			else
				ns=cs;
		end
		
		default:
			ns=idle;
	
	endcase
end

endmodule