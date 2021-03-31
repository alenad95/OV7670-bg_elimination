module stream_aligner_comb(
			input wire tvalid_camera,
			input wire tvalid_ref,
			input wire camera_sof,
			input wire ref_sof,
			input wire enable,
			
			output reg tready_camera,
			output reg tready_ref
);

 begin
	
	always @(*)
	 begin
	 
		tready_camera = 1'b1;
	 
		if(ref_sof)
		 begin
			if(camera_sof)
				tready_ref = 1'b1;
			else
				tready_ref = 1'b0;
		 end
		else
		 begin
			tready_ref=1'b1;
		 end
	 end

 endmodule