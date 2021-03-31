module stream_mux(

	input logic			en,
	
	input logic			tvalid_camera,
	input logic			tvalid_SA,
	input logic [7:0]	tdata_camera,
	input logic [15:0]	tdata_SA,

	output logic		tvalid_out,
	output logic [15:0]	tdata_out
);
	
	always_comb
	 begin
		case(en)
			1'b0:
			 begin
				tvalid_out = tvalid_camera;
				tdata_out = {8'h00,tdata_camera};
			 end
			 
			1'b1:
			 begin
				tvalid_out = tvalid_SA;
				tdata_out = tdata_SA;
			 end
		endcase
	 end
	
 endmodule