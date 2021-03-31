`timescale 1ns/1ps

module stream_aligner_tb();

	logic			tuser_new;
	logic			tuser_ref;
	logic			tvalid_new;
	logic			tvalid_ref;
	logic			treadyOut;
	logic [7:0]		tdata_new;
	logic [7:0]		tdata_ref;
	
	logic			tready_new;
	logic			tready_ref;
	logic			tvalidOut;
	logic [15:0]	tdataOut;
	
	stream_aligner UUT(tuser_new, tuser_ref, tvalid_new, tvalid_ref, treadyOut, tdata_new, tdata_ref, tready_new, tready_ref, tvalidOut, tdataOut);
	
	
	initial
	 begin
		#5
		tdata_new = 8'h11;
		tdata_ref = 8'h00;
		treadyOut = 1'b1;
		tuser_new = 1'b1;
		tuser_ref = 1'b0;
		
		#5
		tuser_new = 1'b0;
		tuser_ref = 1'b1;
		
		#5
		tuser_new = 1'b1;
		tuser_ref = 1'b1;
		tvalid_new = 1'b1;
		tvalid_ref = 1'b1;
		
		#5
		tvalid_new = 1'b0;
		tvalid_ref = 1'b1;
		
		#5
		tvalid_new = 1'b1;
		tvalid_ref = 1'b0;
		
		#5
		treadyOut = 1'b0;
		
		#20
		
		$stop;
		
	 end
	 
endmodule