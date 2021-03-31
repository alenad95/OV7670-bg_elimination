`timescale 1ns / 1ps

module pixel_counter_v1
(
	input wire clk, 
	input wire resetn,
	input wire sync_rst, 
	input wire tvalid, 
	output reg frame_start,
	output reg control
);

reg end_count,flag;
reg [18:0] count_value;
reg en_count;

// State variables
parameter [1:0] idle=2'd0, count=2'd1, frame_sync=2'd2; 
reg [1:0] cs;
reg [1:0] ns;

always@(posedge clk, posedge end_count, negedge resetn, posedge sync_rst)
begin
	if (resetn==1'b0 || end_count==1'b1 || sync_rst==1'b1)
		count_value<=19'b0;
	else
	begin
		if (en_count==1'b1)
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
frame_start=1'b0;
en_count=1'b0;

    case (cs)
    
    idle: 
    begin
        flag=1'b0;
        if (tvalid==1'b1)
            ns=count;
        else
            ns=cs;
    end
    
    count: 
    begin
        if (tvalid==1'b0)
            ns=idle;
        else
        begin
            en_count=1'b1;
            if (end_count==1'b0)
                ns=cs;
            else
                ns=frame_sync;
        end
    end
    
    frame_sync:
    begin
        flag=1'b1;
        frame_start=1'b1;
        if (tvalid==1'b1)
        begin
            ns=count;
            en_count=1'b1;
        end    
        else
        begin
            ns=idle;
            en_count=1'b0;
        end    
    end
    
    default:
    begin
        ns=idle;
        flag=1'b0;
        en_count=1'b0;
    end    
    
    endcase
end

always@(*)
begin
    if (flag==1'b1)
    begin
        if (tvalid==1'b1)
            control=1'b1;
        else
            control=1'b0;
    end
    else
        control = 1'b0;
end

endmodule