// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Background_subtractor,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.398750,HLS_SYN_LAT=615361,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=106,HLS_SYN_LUT=353,HLS_VERSION=2019_1}" *)

module Background_subtractor (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        stream_new_V_TDATA,
        stream_new_V_TVALID,
        stream_new_V_TREADY,
        stream_ref_V_TDATA,
        stream_ref_V_TVALID,
        stream_ref_V_TREADY,
        enable,
        threshold_V,
        pixel_done,
        stream_out_V_TDATA,
        stream_out_V_TVALID,
        stream_out_V_TREADY
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] stream_new_V_TDATA;
input   stream_new_V_TVALID;
output   stream_new_V_TREADY;
input  [7:0] stream_ref_V_TDATA;
input   stream_ref_V_TVALID;
output   stream_ref_V_TREADY;
input   enable;
input  [7:0] threshold_V;
output   pixel_done;
output  [7:0] stream_out_V_TDATA;
output   stream_out_V_TVALID;
input   stream_out_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg pixel_done;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [7:0] stream_new_V_0_data_out;
wire    stream_new_V_0_vld_in;
wire    stream_new_V_0_vld_out;
wire    stream_new_V_0_ack_in;
reg    stream_new_V_0_ack_out;
reg   [7:0] stream_new_V_0_payload_A;
reg   [7:0] stream_new_V_0_payload_B;
reg    stream_new_V_0_sel_rd;
reg    stream_new_V_0_sel_wr;
wire    stream_new_V_0_sel;
wire    stream_new_V_0_load_A;
wire    stream_new_V_0_load_B;
reg   [1:0] stream_new_V_0_state;
wire    stream_new_V_0_state_cmp_full;
reg   [7:0] stream_ref_V_0_data_out;
wire    stream_ref_V_0_vld_in;
wire    stream_ref_V_0_vld_out;
wire    stream_ref_V_0_ack_in;
reg    stream_ref_V_0_ack_out;
reg   [7:0] stream_ref_V_0_payload_A;
reg   [7:0] stream_ref_V_0_payload_B;
reg    stream_ref_V_0_sel_rd;
reg    stream_ref_V_0_sel_wr;
wire    stream_ref_V_0_sel;
wire    stream_ref_V_0_load_A;
wire    stream_ref_V_0_load_B;
reg   [1:0] stream_ref_V_0_state;
wire    stream_ref_V_0_state_cmp_full;
reg   [7:0] stream_out_V_1_data_in;
reg   [7:0] stream_out_V_1_data_out;
reg    stream_out_V_1_vld_in;
wire    stream_out_V_1_vld_out;
wire    stream_out_V_1_ack_in;
wire    stream_out_V_1_ack_out;
reg   [7:0] stream_out_V_1_payload_A;
reg   [7:0] stream_out_V_1_payload_B;
reg    stream_out_V_1_sel_rd;
reg    stream_out_V_1_sel_wr;
wire    stream_out_V_1_sel;
wire    stream_out_V_1_load_A;
wire    stream_out_V_1_load_B;
reg   [1:0] stream_out_V_1_state;
wire    stream_out_V_1_state_cmp_full;
reg    stream_new_V_TDATA_blk_n;
wire    ap_CS_fsm_state3;
wire   [0:0] icmp_ln22_fu_151_p2;
reg    stream_ref_V_TDATA_blk_n;
reg    stream_out_V_TDATA_blk_n;
wire   [0:0] enable_read_read_fu_76_p2;
wire   [0:0] icmp_ln887_fu_201_p2;
wire    ap_CS_fsm_state4;
reg   [0:0] enable_read_reg_234;
reg   [0:0] icmp_ln887_reg_238;
wire   [8:0] j_fu_145_p2;
reg   [8:0] j_reg_216;
wire    ap_CS_fsm_state2;
reg    ap_block_state2;
wire   [9:0] i_fu_157_p2;
reg   [9:0] i_reg_224;
reg    ap_block_state3;
reg    ap_predicate_op36_write_state3;
reg    ap_predicate_op47_write_state3;
reg    ap_predicate_op48_write_state3;
reg    ap_block_state3_io;
wire   [0:0] xor_ln22_fu_207_p2;
reg    ap_predicate_op52_write_state4;
reg    ap_predicate_op54_write_state4;
reg    ap_block_state4_io;
reg   [8:0] j_0_reg_104;
reg   [9:0] i_0_reg_115;
wire   [0:0] icmp_ln21_fu_139_p2;
reg   [0:0] phi_ln47_reg_126;
reg    pixel_done_preg;
wire   [8:0] lhs_V_fu_163_p1;
wire   [8:0] rhs_V_fu_167_p1;
wire   [8:0] ret_V_fu_171_p2;
wire   [0:0] abscond_fu_183_p2;
wire   [8:0] neg_fu_177_p2;
wire   [8:0] i_op_assign_fu_189_p3;
wire   [8:0] zext_ln887_fu_197_p1;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 stream_new_V_0_sel_rd = 1'b0;
#0 stream_new_V_0_sel_wr = 1'b0;
#0 stream_new_V_0_state = 2'd0;
#0 stream_ref_V_0_sel_rd = 1'b0;
#0 stream_ref_V_0_sel_wr = 1'b0;
#0 stream_ref_V_0_state = 2'd0;
#0 stream_out_V_1_sel_rd = 1'b0;
#0 stream_out_V_1_sel_wr = 1'b0;
#0 stream_out_V_1_state = 2'd0;
#0 pixel_done_preg = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        pixel_done_preg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            pixel_done_preg <= phi_ln47_reg_126;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_new_V_0_sel_rd <= 1'b0;
    end else begin
        if (((stream_new_V_0_ack_out == 1'b1) & (stream_new_V_0_vld_out == 1'b1))) begin
            stream_new_V_0_sel_rd <= ~stream_new_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_new_V_0_sel_wr <= 1'b0;
    end else begin
        if (((stream_new_V_0_ack_in == 1'b1) & (stream_new_V_0_vld_in == 1'b1))) begin
            stream_new_V_0_sel_wr <= ~stream_new_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_new_V_0_state <= 2'd0;
    end else begin
        if ((((stream_new_V_0_state == 2'd2) & (stream_new_V_0_vld_in == 1'b0)) | ((stream_new_V_0_state == 2'd3) & (stream_new_V_0_vld_in == 1'b0) & (stream_new_V_0_ack_out == 1'b1)))) begin
            stream_new_V_0_state <= 2'd2;
        end else if ((((stream_new_V_0_state == 2'd1) & (stream_new_V_0_ack_out == 1'b0)) | ((stream_new_V_0_state == 2'd3) & (stream_new_V_0_ack_out == 1'b0) & (stream_new_V_0_vld_in == 1'b1)))) begin
            stream_new_V_0_state <= 2'd1;
        end else if (((~((stream_new_V_0_vld_in == 1'b0) & (stream_new_V_0_ack_out == 1'b1)) & ~((stream_new_V_0_ack_out == 1'b0) & (stream_new_V_0_vld_in == 1'b1)) & (stream_new_V_0_state == 2'd3)) | ((stream_new_V_0_state == 2'd1) & (stream_new_V_0_ack_out == 1'b1)) | ((stream_new_V_0_state == 2'd2) & (stream_new_V_0_vld_in == 1'b1)))) begin
            stream_new_V_0_state <= 2'd3;
        end else begin
            stream_new_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_out_V_1_sel_rd <= 1'b0;
    end else begin
        if (((stream_out_V_1_ack_out == 1'b1) & (stream_out_V_1_vld_out == 1'b1))) begin
            stream_out_V_1_sel_rd <= ~stream_out_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_out_V_1_sel_wr <= 1'b0;
    end else begin
        if (((stream_out_V_1_ack_in == 1'b1) & (stream_out_V_1_vld_in == 1'b1))) begin
            stream_out_V_1_sel_wr <= ~stream_out_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_out_V_1_state <= 2'd0;
    end else begin
        if ((((stream_out_V_1_state == 2'd2) & (stream_out_V_1_vld_in == 1'b0)) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_1_vld_in == 1'b0) & (stream_out_V_1_ack_out == 1'b1)))) begin
            stream_out_V_1_state <= 2'd2;
        end else if ((((stream_out_V_1_state == 2'd1) & (stream_out_V_TREADY == 1'b0)) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0) & (stream_out_V_1_vld_in == 1'b1)))) begin
            stream_out_V_1_state <= 2'd1;
        end else if (((~((stream_out_V_1_vld_in == 1'b0) & (stream_out_V_1_ack_out == 1'b1)) & ~((stream_out_V_TREADY == 1'b0) & (stream_out_V_1_vld_in == 1'b1)) & (stream_out_V_1_state == 2'd3)) | ((stream_out_V_1_state == 2'd1) & (stream_out_V_1_ack_out == 1'b1)) | ((stream_out_V_1_state == 2'd2) & (stream_out_V_1_vld_in == 1'b1)))) begin
            stream_out_V_1_state <= 2'd3;
        end else begin
            stream_out_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_ref_V_0_sel_rd <= 1'b0;
    end else begin
        if (((stream_ref_V_0_ack_out == 1'b1) & (stream_ref_V_0_vld_out == 1'b1))) begin
            stream_ref_V_0_sel_rd <= ~stream_ref_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_ref_V_0_sel_wr <= 1'b0;
    end else begin
        if (((stream_ref_V_0_vld_in == 1'b1) & (stream_ref_V_0_ack_in == 1'b1))) begin
            stream_ref_V_0_sel_wr <= ~stream_ref_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        stream_ref_V_0_state <= 2'd0;
    end else begin
        if ((((stream_ref_V_0_state == 2'd2) & (stream_ref_V_0_vld_in == 1'b0)) | ((stream_ref_V_0_state == 2'd3) & (stream_ref_V_0_vld_in == 1'b0) & (stream_ref_V_0_ack_out == 1'b1)))) begin
            stream_ref_V_0_state <= 2'd2;
        end else if ((((stream_ref_V_0_state == 2'd1) & (stream_ref_V_0_ack_out == 1'b0)) | ((stream_ref_V_0_state == 2'd3) & (stream_ref_V_0_ack_out == 1'b0) & (stream_ref_V_0_vld_in == 1'b1)))) begin
            stream_ref_V_0_state <= 2'd1;
        end else if (((~((stream_ref_V_0_vld_in == 1'b0) & (stream_ref_V_0_ack_out == 1'b1)) & ~((stream_ref_V_0_ack_out == 1'b0) & (stream_ref_V_0_vld_in == 1'b1)) & (stream_ref_V_0_state == 2'd3)) | ((stream_ref_V_0_state == 2'd1) & (stream_ref_V_0_ack_out == 1'b1)) | ((stream_ref_V_0_state == 2'd2) & (stream_ref_V_0_vld_in == 1'b1)))) begin
            stream_ref_V_0_state <= 2'd3;
        end else begin
            stream_ref_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((stream_out_V_1_state == 2'd1) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0))) & (icmp_ln21_fu_139_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        i_0_reg_115 <= 10'd0;
    end else if (((1'b0 == ap_block_state4_io) & (1'b1 == ap_CS_fsm_state4))) begin
        i_0_reg_115 <= i_reg_224;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (icmp_ln22_fu_151_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        j_0_reg_104 <= j_reg_216;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        j_0_reg_104 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((~((stream_out_V_1_state == 2'd1) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0))) & (icmp_ln21_fu_139_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        phi_ln47_reg_126 <= 1'd1;
    end else if (((1'b0 == ap_block_state4_io) & (1'b1 == ap_CS_fsm_state4))) begin
        phi_ln47_reg_126 <= xor_ln22_fu_207_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        enable_read_reg_234 <= enable;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (1'b1 == ap_CS_fsm_state3))) begin
        i_reg_224 <= i_fu_157_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (enable_read_read_fu_76_p2 == 1'd1) & (icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        icmp_ln887_reg_238 <= icmp_ln887_fu_201_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((stream_out_V_1_state == 2'd1) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0))) & (1'b1 == ap_CS_fsm_state2))) begin
        j_reg_216 <= j_fu_145_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((stream_new_V_0_load_A == 1'b1)) begin
        stream_new_V_0_payload_A <= stream_new_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((stream_new_V_0_load_B == 1'b1)) begin
        stream_new_V_0_payload_B <= stream_new_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((stream_out_V_1_load_A == 1'b1)) begin
        stream_out_V_1_payload_A <= stream_out_V_1_data_in;
    end
end

always @ (posedge ap_clk) begin
    if ((stream_out_V_1_load_B == 1'b1)) begin
        stream_out_V_1_payload_B <= stream_out_V_1_data_in;
    end
end

always @ (posedge ap_clk) begin
    if ((stream_ref_V_0_load_A == 1'b1)) begin
        stream_ref_V_0_payload_A <= stream_ref_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((stream_ref_V_0_load_B == 1'b1)) begin
        stream_ref_V_0_payload_B <= stream_ref_V_TDATA;
    end
end

always @ (*) begin
    if ((~((stream_out_V_1_state == 2'd1) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0))) & (icmp_ln21_fu_139_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((stream_out_V_1_state == 2'd1) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0))) & (icmp_ln21_fu_139_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        pixel_done = phi_ln47_reg_126;
    end else begin
        pixel_done = pixel_done_preg;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        stream_new_V_0_ack_out = 1'b1;
    end else begin
        stream_new_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((stream_new_V_0_sel == 1'b1)) begin
        stream_new_V_0_data_out = stream_new_V_0_payload_B;
    end else begin
        stream_new_V_0_data_out = stream_new_V_0_payload_A;
    end
end

always @ (*) begin
    if (((icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        stream_new_V_TDATA_blk_n = stream_new_V_0_state[1'd0];
    end else begin
        stream_new_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~(((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (ap_predicate_op48_write_state3 == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
        stream_out_V_1_data_in = 8'd255;
    end else if (((~(((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (ap_predicate_op47_write_state3 == 1'b1) & (1'b1 == ap_CS_fsm_state3)) | (~(((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (ap_predicate_op36_write_state3 == 1'b1) & (1'b1 == ap_CS_fsm_state3)))) begin
        stream_out_V_1_data_in = stream_new_V_0_data_out;
    end else begin
        stream_out_V_1_data_in = 'bx;
    end
end

always @ (*) begin
    if ((stream_out_V_1_sel == 1'b1)) begin
        stream_out_V_1_data_out = stream_out_V_1_payload_B;
    end else begin
        stream_out_V_1_data_out = stream_out_V_1_payload_A;
    end
end

always @ (*) begin
    if (((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (ap_predicate_op48_write_state3 == 1'b1) & (1'b1 == ap_CS_fsm_state3)) | (~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (ap_predicate_op47_write_state3 == 1'b1) & (1'b1 == ap_CS_fsm_state3)) | (~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (ap_predicate_op36_write_state3 == 1'b1) & (1'b1 == ap_CS_fsm_state3)))) begin
        stream_out_V_1_vld_in = 1'b1;
    end else begin
        stream_out_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((enable_read_reg_234 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) | ((enable_read_reg_234 == 1'd1) & (icmp_ln887_reg_238 == 1'd0) & (1'b1 == ap_CS_fsm_state4)) | ((icmp_ln887_reg_238 == 1'd1) & (enable_read_reg_234 == 1'd1) & (1'b1 == ap_CS_fsm_state4)) | ((enable_read_read_fu_76_p2 == 1'd0) & (icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((enable_read_read_fu_76_p2 == 1'd1) & (icmp_ln887_fu_201_p2 == 1'd0) & (icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((icmp_ln887_fu_201_p2 == 1'd1) & (enable_read_read_fu_76_p2 == 1'd1) & (icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3)))) begin
        stream_out_V_TDATA_blk_n = stream_out_V_1_state[1'd1];
    end else begin
        stream_out_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        stream_ref_V_0_ack_out = 1'b1;
    end else begin
        stream_ref_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((stream_ref_V_0_sel == 1'b1)) begin
        stream_ref_V_0_data_out = stream_ref_V_0_payload_B;
    end else begin
        stream_ref_V_0_data_out = stream_ref_V_0_payload_A;
    end
end

always @ (*) begin
    if (((icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        stream_ref_V_TDATA_blk_n = stream_ref_V_0_state[1'd0];
    end else begin
        stream_ref_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((stream_out_V_1_state == 2'd1) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0))) & (icmp_ln21_fu_139_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((stream_out_V_1_state == 2'd1) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0))) & (icmp_ln21_fu_139_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (icmp_ln22_fu_151_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~((1'b1 == ap_block_state3_io) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0))) & (icmp_ln22_fu_151_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if (((1'b0 == ap_block_state4_io) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign abscond_fu_183_p2 = (($signed(ret_V_fu_171_p2) > $signed(9'd0)) ? 1'b1 : 1'b0);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state2 = ((stream_out_V_1_state == 2'd1) | ((stream_out_V_1_state == 2'd3) & (stream_out_V_TREADY == 1'b0)));
end

always @ (*) begin
    ap_block_state3 = (((icmp_ln22_fu_151_p2 == 1'd0) & (stream_ref_V_0_vld_out == 1'b0)) | ((icmp_ln22_fu_151_p2 == 1'd0) & (stream_new_V_0_vld_out == 1'b0)));
end

always @ (*) begin
    ap_block_state3_io = (((stream_out_V_1_ack_in == 1'b0) & (ap_predicate_op48_write_state3 == 1'b1)) | ((stream_out_V_1_ack_in == 1'b0) & (ap_predicate_op47_write_state3 == 1'b1)) | ((stream_out_V_1_ack_in == 1'b0) & (ap_predicate_op36_write_state3 == 1'b1)));
end

always @ (*) begin
    ap_block_state4_io = (((stream_out_V_1_ack_in == 1'b0) & (ap_predicate_op54_write_state4 == 1'b1)) | ((stream_out_V_1_ack_in == 1'b0) & (ap_predicate_op52_write_state4 == 1'b1)) | ((enable_read_reg_234 == 1'd0) & (stream_out_V_1_ack_in == 1'b0)));
end

always @ (*) begin
    ap_predicate_op36_write_state3 = ((enable_read_read_fu_76_p2 == 1'd0) & (icmp_ln22_fu_151_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op47_write_state3 = ((enable_read_read_fu_76_p2 == 1'd1) & (icmp_ln887_fu_201_p2 == 1'd0) & (icmp_ln22_fu_151_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op48_write_state3 = ((icmp_ln887_fu_201_p2 == 1'd1) & (enable_read_read_fu_76_p2 == 1'd1) & (icmp_ln22_fu_151_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op52_write_state4 = ((enable_read_reg_234 == 1'd1) & (icmp_ln887_reg_238 == 1'd0));
end

always @ (*) begin
    ap_predicate_op54_write_state4 = ((icmp_ln887_reg_238 == 1'd1) & (enable_read_reg_234 == 1'd1));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign enable_read_read_fu_76_p2 = enable;

assign i_fu_157_p2 = (i_0_reg_115 + 10'd1);

assign i_op_assign_fu_189_p3 = ((abscond_fu_183_p2[0:0] === 1'b1) ? ret_V_fu_171_p2 : neg_fu_177_p2);

assign icmp_ln21_fu_139_p2 = ((j_0_reg_104 == 9'd480) ? 1'b1 : 1'b0);

assign icmp_ln22_fu_151_p2 = ((i_0_reg_115 == 10'd640) ? 1'b1 : 1'b0);

assign icmp_ln887_fu_201_p2 = (($signed(i_op_assign_fu_189_p3) < $signed(zext_ln887_fu_197_p1)) ? 1'b1 : 1'b0);

assign j_fu_145_p2 = (j_0_reg_104 + 9'd1);

assign lhs_V_fu_163_p1 = stream_new_V_0_data_out;

assign neg_fu_177_p2 = (9'd0 - ret_V_fu_171_p2);

assign ret_V_fu_171_p2 = (lhs_V_fu_163_p1 - rhs_V_fu_167_p1);

assign rhs_V_fu_167_p1 = stream_ref_V_0_data_out;

assign stream_new_V_0_ack_in = stream_new_V_0_state[1'd1];

assign stream_new_V_0_load_A = (stream_new_V_0_state_cmp_full & ~stream_new_V_0_sel_wr);

assign stream_new_V_0_load_B = (stream_new_V_0_state_cmp_full & stream_new_V_0_sel_wr);

assign stream_new_V_0_sel = stream_new_V_0_sel_rd;

assign stream_new_V_0_state_cmp_full = ((stream_new_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign stream_new_V_0_vld_in = stream_new_V_TVALID;

assign stream_new_V_0_vld_out = stream_new_V_0_state[1'd0];

assign stream_new_V_TREADY = stream_new_V_0_state[1'd1];

assign stream_out_V_1_ack_in = stream_out_V_1_state[1'd1];

assign stream_out_V_1_ack_out = stream_out_V_TREADY;

assign stream_out_V_1_load_A = (stream_out_V_1_state_cmp_full & ~stream_out_V_1_sel_wr);

assign stream_out_V_1_load_B = (stream_out_V_1_state_cmp_full & stream_out_V_1_sel_wr);

assign stream_out_V_1_sel = stream_out_V_1_sel_rd;

assign stream_out_V_1_state_cmp_full = ((stream_out_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign stream_out_V_1_vld_out = stream_out_V_1_state[1'd0];

assign stream_out_V_TDATA = stream_out_V_1_data_out;

assign stream_out_V_TVALID = stream_out_V_1_state[1'd0];

assign stream_ref_V_0_ack_in = stream_ref_V_0_state[1'd1];

assign stream_ref_V_0_load_A = (stream_ref_V_0_state_cmp_full & ~stream_ref_V_0_sel_wr);

assign stream_ref_V_0_load_B = (stream_ref_V_0_state_cmp_full & stream_ref_V_0_sel_wr);

assign stream_ref_V_0_sel = stream_ref_V_0_sel_rd;

assign stream_ref_V_0_state_cmp_full = ((stream_ref_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign stream_ref_V_0_vld_in = stream_ref_V_TVALID;

assign stream_ref_V_0_vld_out = stream_ref_V_0_state[1'd0];

assign stream_ref_V_TREADY = stream_ref_V_0_state[1'd1];

assign xor_ln22_fu_207_p2 = (phi_ln47_reg_126 ^ 1'd1);

assign zext_ln887_fu_197_p1 = threshold_V;

endmodule //Background_subtractor
