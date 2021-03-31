`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2021 15:38:15
// Design Name: 
// Module Name: stream_aligner
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stream_aligner(
	input wire			tuser_new,
	input wire			tuser_ref,
	input wire			tvalid_new,
	input wire			tvalid_ref,
	input wire			treadyOut_new,
	input wire			treadyOut_ref,
	input wire [7:0]	tdata_new,
	input wire [7:0]	tdata_ref,
	input wire          enable,
	
	output reg		   tready_new,
	output reg		   tready_ref,
	output reg		   tvalidOut_new,
	output reg		   tvalidOut_ref,
	output reg [7:0]  tdataOut_new,
	output reg [7:0]  tdataOut_ref
	
);

	always @(*) begin
	if(enable)
	 begin
	   if (tuser_new && !tuser_ref) begin
		  // Waiting for stream 1 to catch up. Block stream 0, discard data from stream 1.
		  tready_new = 1'b0;	// Block stream 0.
		  tready_ref = 1'b1;   // Read from stream 1 and discard data.
		  tdataOut_new = 8'b0;	// Output zero data.
		  tdataOut_ref = 8'b0;	// Output zero data.
		  tvalidOut_new = 1'b0;	// Output is invalid.
		  tvalidOut_ref = 1'b0;	// Output is invalid.
	   end else if (tuser_ref && !tuser_new) begin
		  // Waiting for stream 0 to catch up. Block stream 1, discard data from stream 0.
		  tready_new = 1'b1;	// Read from stream 0 and discard data.
		  tready_ref = 1'b0;	// Block stream 1.
		  tdataOut_new = 8'b0;	// Output zero data.
		  tdataOut_ref = 8'b0;	// Output zero data.
		  tvalidOut_new = 1'b0;	// Output is invalid.
		  tvalidOut_ref = 1'b0;	// Output is invalid.
	   end else begin
		  tready_new = treadyOut_new && treadyOut_ref;
		  tready_ref = treadyOut_new && treadyOut_ref;
		  tdataOut_new = tdata_new;
		  tdataOut_ref = tdata_ref;
		  tvalidOut_new = tvalid_new;
		  tvalidOut_ref = tvalid_ref;
	   end
	end
	else
	 begin
	      tready_new = treadyOut_new;
		  tready_ref = 1'b0;
		  tdataOut_new = tdata_new;
		  tdataOut_ref = tdata_ref;
		  tvalidOut_new = tvalid_new;
		  tvalidOut_ref = 1'b0;
	 end
end

 endmodule