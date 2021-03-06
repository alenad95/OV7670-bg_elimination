// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1 ns / 1 ps

`define TV_IN_inStream_V_V_TDATA "../tv/cdatafile/c.ov7670_grayscale.autotvin_inStream_V_V.dat"
`define INGRESS_STATUS_inStream_V_V_TDATA "../tv/stream_size/stream_ingress_status_inStream_V_V.dat"

`define AUTOTB_TRANSACTION_NUM 10

module AESL_axi_s_inStream_V_V (
	input clk,
	input reset,
	output [8 - 1:0] TRAN_inStream_V_V_TDATA,
	output TRAN_inStream_V_V_TVALID,
	input TRAN_inStream_V_V_TREADY,
	input ready,
	input done,
	output [31:0] transaction);
	
	wire inStream_V_V_TDATA_full;
	wire inStream_V_V_TDATA_empty;
	reg inStream_V_V_TDATA_write_en;
	reg [8 - 1:0] inStream_V_V_TDATA_write_data;
	reg inStream_V_V_TDATA_read_en;
	wire [8 - 1:0] inStream_V_V_TDATA_read_data;
	
	fifo #(1, 8) fifo_inStream_V_V_TDATA (
		.reset(1'b0),
		.write_clock(clk),
		.write_en(inStream_V_V_TDATA_write_en),
		.write_data(inStream_V_V_TDATA_write_data),
		.read_clock(clk),
		.read_en(inStream_V_V_TDATA_read_en),
		.read_data(inStream_V_V_TDATA_read_data),
		.full(inStream_V_V_TDATA_full),
		.empty(inStream_V_V_TDATA_empty));
	
	always @ (*) begin
		inStream_V_V_TDATA_write_en <= 0;
		inStream_V_V_TDATA_read_en <= TRAN_inStream_V_V_TREADY;
	end
	
	assign TRAN_inStream_V_V_TDATA = inStream_V_V_TDATA_read_data;
	
	reg inStream_V_V_TDATA_valid = 0; // ingress buffer indicator: inStream_V_V_TDATA
	
	assign TRAN_inStream_V_V_TVALID = ~(inStream_V_V_TDATA_empty) || (inStream_V_V_TDATA_valid) || (transaction > `AUTOTB_TRANSACTION_NUM);
	
	function is_blank_char(input [7:0] char);
		if (char == " " || char == "\011" || char == "\012" || char == "\015") begin
			is_blank_char = 1;
		end else begin
			is_blank_char = 0;
		end
	endfunction
	
	function [183:0] read_token(input integer fp);
		reg [7:0] char;
		begin
			read_token = "";
			char = " ";
			while (is_blank_char(char) && char != 8'hff) begin
				char = $fgetc(fp);
			end
			while (~is_blank_char(char) && char != 8'hff) begin
				read_token = {read_token[183 - 8:0], char[7:0]};
				char = $fgetc(fp);
			end
		end
	endfunction
	
	function [183:0] rm_0x(input [183:0] token);
		reg [183:0] token_tmp;
		integer i;
		begin
			token_tmp = "";
			for (i = 0; token[15:0] != "0x"; token = token >> 8) begin
				token_tmp = (token[7:0] << (8 * i)) | token_tmp;
				i = i + 1;
			end
			rm_0x = token_tmp;
		end
	endfunction
	
	reg [31:0] transaction_load_inStream_V_V_TDATA;
	
	assign transaction = transaction_load_inStream_V_V_TDATA;
	
	initial begin : AXI_stream_driver_inStream_V_V_TDATA
		integer fp;
		reg [183:0] token;
		reg [8 - 1:0] data;
		integer fp_ingress_status;
		reg [183:0] token_ingress_status;
		reg [31:0] ingress_status;
		reg [8 * 5:1] str;
		integer ret;
		
		transaction_load_inStream_V_V_TDATA = 0;
		fifo_inStream_V_V_TDATA.clear();
		wait (reset === 1);
		fp = $fopen(`TV_IN_inStream_V_V_TDATA, "r");
		if (fp == 0) begin // Failed to open file
			$display("ERROR: Failed to open file \"%s\"!", `TV_IN_inStream_V_V_TDATA);
			$finish;
		end
		fp_ingress_status = $fopen(`INGRESS_STATUS_inStream_V_V_TDATA, "r");
		if (fp_ingress_status == 0) begin // Failed to open file
			$display("ERROR: Failed to open file \"%s\"!", `INGRESS_STATUS_inStream_V_V_TDATA);
			$finish;
		end
		token = read_token(fp);
		token_ingress_status = read_token(fp_ingress_status);
		if (token != "[[[runtime]]]") begin
			$display("ERROR: token %s != [[[runtime]]]", token);
			$finish;
		end
		token = read_token(fp); // read 1st "[[transaction]]"
		token_ingress_status = read_token(fp_ingress_status);
		forever begin
			@ (negedge clk);
			if (ready == 1) begin
				if (token != "[[[/runtime]]]") begin
					if (token != "[[transaction]]") begin
						$display("ERROR: token %s != [[[transaction]]]", token);
						$finish;
					end
					token = read_token(fp); // skip transaction number
					token_ingress_status = read_token(fp_ingress_status); // skip transaction number
					token_ingress_status = read_token(fp_ingress_status); // load ingress status at beginning of transaction
					fifo_inStream_V_V_TDATA.clear();
					token = read_token(fp);
					ret = $sscanf(token_ingress_status, "%d", ingress_status);
					token_ingress_status = read_token(fp_ingress_status);
					while (token != "[[/transaction]]") begin
						if (fifo_inStream_V_V_TDATA.full) begin
							$display("ERROR: FIFO is full");
							$finish;
						end
						ret = $sscanf(rm_0x(token), "%x", data);
						fifo_inStream_V_V_TDATA.push(data);
						token = read_token(fp);
						ret = $sscanf(token_ingress_status, "%d", ingress_status);
						token_ingress_status = read_token(fp_ingress_status);
					end
					inStream_V_V_TDATA_valid = (ingress_status > 0);
					token = read_token(fp);
					token_ingress_status = read_token(fp_ingress_status);
				end else begin
					if (fp != 0) begin
					    $fclose(fp);
					    fp = 0;
					end
					if (fp_ingress_status != 0) begin
						$fclose(fp_ingress_status);
						fp_ingress_status = 0;
					end
				end
				transaction_load_inStream_V_V_TDATA = transaction_load_inStream_V_V_TDATA + 1;
			end
		end
	end

endmodule
