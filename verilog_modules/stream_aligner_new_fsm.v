/* Con l'enable a zero possiamo lasciare passare entrambi gli stream senza preoccuparci della loro sincronizzazione. */

module stream_aligner_new_fsm (
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
	output reg		   	tvalidOut_ref,
	output reg          sync_rst
	);
	
parameter [1:0] idle=2'd0, wait_for_sync=2'd1, synchronized=2'd2;
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
    sync_rst=1'b0;
    
	case (cs)
			
		/* In the idle state the stream from the camera is let through regardless of the enable signal.
		Then, the enable signal is checked and triggers the synchronization procedure when equal to 1. */
		
		idle:
		begin
			tready_new = treadyOut_new;
			tready_ref = treadyOut_ref;
			tvalidOut_new = tvalid_new;
			tvalidOut_ref = tvalid_ref;
			if (enable==1'b0)
				ns=cs;
			else
			begin
				if (frame_start_ref==1'b1)
				begin
					if (frame_start_new==1'b1)
					 begin
						ns=synchronized;
					 end	
					else
						ns=wait_for_sync;
				end
				else 
					ns=cs;
			end
		end
		
		/* This state is reached when the SOF from the reference occurs --> the reference stream is stopped and we wait for the 
			SOF from the camera to occur. */
		
		wait_for_sync:
		begin
			tready_new = treadyOut_new;	// The stream from the camera is let through. 
			tvalidOut_new = 1'b1;	// Output is valid.
			tvalidOut_ref = 1'b0;	// Output is invalid.
			if (frame_start_new==1'b1)
			begin
				ns=synchronized;	// The camera SOF has arrived --> the two streams can now be let through.
				tready_ref = treadyOut_ref;
				sync_rst = 1'b1;
			end
			else if(enable==1'b0)
			begin
			    ns=idle;
			    tready_ref=treadyOut_ref;
			end
			else
			begin
				ns=cs;				// We are still waiting for the reference SOF to arrive. 
				tready_ref = 1'b0;   // Stop the reference stream and wait for the camera SOF to arrive.
			end
		end
		
		/* This state is reached when the two streams are synchronized --> they are transmitted until one of them stops. 
		Then, they need to be synchronized again. */
		
		synchronized:
		begin
			tready_new = treadyOut_new;
			tready_ref = treadyOut_ref;
			tvalidOut_new = tvalid_new;
			tvalidOut_ref = tvalid_ref;
			if (control_new==1'b0 || control_ref==1'b0)
				ns=idle;
			else if(enable==1'b0)
			    ns=idle;
			else
				ns=cs;
		end
		
		default:
		begin
			ns=idle;
			tready_new = treadyOut_new;
			tready_ref = treadyOut_ref;
			tvalidOut_new = tvalid_new;
			tvalidOut_ref = tvalid_ref;
		end	
	
	endcase
end

endmodule