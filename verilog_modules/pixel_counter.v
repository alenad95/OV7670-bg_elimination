`timescale 1ns / 1ps

module pixel_counter
(
	input wire clk, 
	input wire resetn, 
	input wire tvalid, 
	output reg frame_start,
	output reg tuser_new
);

reg end_count;
reg [18:0] count_value;

always@(posedge clk, negedge resetn)
begin
	if (resetn==1'b0 || end_count==1'b1)
		count_value<=19'b0;
	else
	begin
		if (tvalid==1'b1)
			count_value<=count_value+19'b1;
		else
			count_value<=count_value;	
	end
end

always@(*)
begin
	if (count_value==19'h4afff)
		end_count=1'b1;
	else
		end_count=1'b0;
end

always@(posedge clk)
begin
    if (end_count==1'b1 && tvalid==1'b1)
       begin
        frame_start<=1'b1;
        tuser_new <= 1'b1;
       end
    else if(tvalid==1'b1)
       begin
        frame_start<=1'b0;
        tuser_new <= 1'b1;
       end
    else
       begin   
        tuser_new <= 1'b0;
        frame_start<=1'b0;
       end
end

endmodule