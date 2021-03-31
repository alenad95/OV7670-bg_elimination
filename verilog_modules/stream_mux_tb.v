`timescale 1ns/1ps

module stream_mux_tb();

	logic			en;
	
	logic			tvalid_camera;
	logic			tvalid_SA;
	logic [7:0]		tdata_camera;
	logic [15:0]	tdata_SA;

	logic			tvalid_out;
	logic [15:0]	tdata_out;
	
	stream_mux UUT(en, tvalid_camera, tvalid_SA, tdata_camera, tdata_SA, tvalid_out, tdata_out);
	
	initial
	 begin
		#5
		tvalid_camera = 1'b1;
		tvalid_SA = 1'b1;
		tdata_camera = 8'he0;
		tdata_SA = 16'h00ff;
		
		#5
		en = 1'b1;
		
		#5
		tvalid_camera = 1'b0;
		tvalid_SA = 1'b0;
		
		#5
		tdata_camera = 8'h00;
		tdata_SA = 16'he0ff;
		
		#5
		en = 1'b0;
		
		$stop;
		
	 end

endmodule