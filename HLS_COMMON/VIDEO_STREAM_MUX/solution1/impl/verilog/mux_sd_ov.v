// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="mux_sd_ov,hls_ip_2016_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.000000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=39,HLS_SYN_LUT=56}" *)

module mux_sd_ov (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        data_in_sd_V_V_TDATA,
        data_in_sd_V_V_TVALID,
        data_in_sd_V_V_TREADY,
        data_in_ov7670_V_V_TDATA,
        data_in_ov7670_V_V_TVALID,
        data_in_ov7670_V_V_TREADY,
        outputStream_V_V_TDATA,
        outputStream_V_V_TVALID,
        outputStream_V_V_TREADY,
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP
);

parameter    ap_ST_st1_fsm_0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
parameter    ap_const_int64_8 = 8;
parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 5;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_AXILITES_WSTRB_WIDTH = (C_S_AXI_AXILITES_DATA_WIDTH / ap_const_int64_8);
parameter C_S_AXI_WSTRB_WIDTH = (C_S_AXI_DATA_WIDTH / ap_const_int64_8);

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] data_in_sd_V_V_TDATA;
input   data_in_sd_V_V_TVALID;
output   data_in_sd_V_V_TREADY;
input  [7:0] data_in_ov7670_V_V_TDATA;
input   data_in_ov7670_V_V_TVALID;
output   data_in_ov7670_V_V_TREADY;
output  [7:0] outputStream_V_V_TDATA;
output   outputStream_V_V_TVALID;
input   outputStream_V_V_TREADY;
input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1 : 0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1 : 0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1 : 0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1 : 0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1 : 0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg data_in_sd_V_V_TREADY;
reg data_in_ov7670_V_V_TREADY;
reg[7:0] outputStream_V_V_TDATA;
reg outputStream_V_V_TVALID;

reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_18;
wire    switch_stream;
reg    data_in_sd_V_V_TDATA_blk_n;
wire   [0:0] switch_stream_read_read_fu_30_p2;
reg    data_in_ov7670_V_V_TDATA_blk_n;
reg    outputStream_V_V_TDATA_blk_n;
reg    ap_sig_87;
reg    ap_sig_ioackin_outputStream_V_V_TREADY;
reg    ap_reg_ioackin_outputStream_V_V_TREADY;
reg   [0:0] ap_NS_fsm;
reg    ap_sig_100;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'b1;
#0 ap_reg_ioackin_outputStream_V_V_TREADY = 1'b0;
end

mux_sd_ov_AXILiteS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITES_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITES_DATA_WIDTH ))
mux_sd_ov_AXILiteS_s_axi_U(
    .AWVALID(s_axi_AXILiteS_AWVALID),
    .AWREADY(s_axi_AXILiteS_AWREADY),
    .AWADDR(s_axi_AXILiteS_AWADDR),
    .WVALID(s_axi_AXILiteS_WVALID),
    .WREADY(s_axi_AXILiteS_WREADY),
    .WDATA(s_axi_AXILiteS_WDATA),
    .WSTRB(s_axi_AXILiteS_WSTRB),
    .ARVALID(s_axi_AXILiteS_ARVALID),
    .ARREADY(s_axi_AXILiteS_ARREADY),
    .ARADDR(s_axi_AXILiteS_ARADDR),
    .RVALID(s_axi_AXILiteS_RVALID),
    .RREADY(s_axi_AXILiteS_RREADY),
    .RDATA(s_axi_AXILiteS_RDATA),
    .RRESP(s_axi_AXILiteS_RRESP),
    .BVALID(s_axi_AXILiteS_BVALID),
    .BREADY(s_axi_AXILiteS_BREADY),
    .BRESP(s_axi_AXILiteS_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .switch_stream(switch_stream)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_outputStream_V_V_TREADY <= 1'b0;
    end else begin
        if ((((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & (switch_stream_read_read_fu_30_p2 == 1'b0) & ~(ap_sig_87 | ((switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY)) | (~(switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY)))) | ((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(switch_stream_read_read_fu_30_p2 == 1'b0) & ~(ap_sig_87 | ((switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY)) | (~(switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY)))))) begin
            ap_reg_ioackin_outputStream_V_V_TREADY <= 1'b0;
        end else if ((((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & (switch_stream_read_read_fu_30_p2 == 1'b0) & ~ap_sig_87 & (1'b1 == outputStream_V_V_TREADY)) | ((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(switch_stream_read_read_fu_30_p2 == 1'b0) & ~ap_sig_87 & (1'b1 == outputStream_V_V_TREADY)))) begin
            ap_reg_ioackin_outputStream_V_V_TREADY <= 1'b1;
        end
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_sig_87 | ((switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY)) | (~(switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY))))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_sig_87 | ((switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY)) | (~(switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY))))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_18) begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_reg_ioackin_outputStream_V_V_TREADY)) begin
        ap_sig_ioackin_outputStream_V_V_TREADY = outputStream_V_V_TREADY;
    end else begin
        ap_sig_ioackin_outputStream_V_V_TREADY = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & (switch_stream_read_read_fu_30_p2 == 1'b0))) begin
        data_in_ov7670_V_V_TDATA_blk_n = data_in_ov7670_V_V_TVALID;
    end else begin
        data_in_ov7670_V_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & (switch_stream_read_read_fu_30_p2 == 1'b0) & ~(ap_sig_87 | ((switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY)) | (~(switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY))))) begin
        data_in_ov7670_V_V_TREADY = 1'b1;
    end else begin
        data_in_ov7670_V_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(switch_stream_read_read_fu_30_p2 == 1'b0))) begin
        data_in_sd_V_V_TDATA_blk_n = data_in_sd_V_V_TVALID;
    end else begin
        data_in_sd_V_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(switch_stream_read_read_fu_30_p2 == 1'b0) & ~(ap_sig_87 | ((switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY)) | (~(switch_stream_read_read_fu_30_p2 == 1'b0) & (1'b0 == ap_sig_ioackin_outputStream_V_V_TREADY))))) begin
        data_in_sd_V_V_TREADY = 1'b1;
    end else begin
        data_in_sd_V_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_100) begin
        if (~(switch_stream_read_read_fu_30_p2 == 1'b0)) begin
            outputStream_V_V_TDATA = data_in_sd_V_V_TDATA;
        end else if ((switch_stream_read_read_fu_30_p2 == 1'b0)) begin
            outputStream_V_V_TDATA = data_in_ov7670_V_V_TDATA;
        end else begin
            outputStream_V_V_TDATA = 'bx;
        end
    end else begin
        outputStream_V_V_TDATA = 'bx;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(switch_stream_read_read_fu_30_p2 == 1'b0)) | ((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & (switch_stream_read_read_fu_30_p2 == 1'b0)))) begin
        outputStream_V_V_TDATA_blk_n = outputStream_V_V_TREADY;
    end else begin
        outputStream_V_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & (switch_stream_read_read_fu_30_p2 == 1'b0) & ~ap_sig_87 & (1'b0 == ap_reg_ioackin_outputStream_V_V_TREADY)) | ((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(switch_stream_read_read_fu_30_p2 == 1'b0) & ~ap_sig_87 & (1'b0 == ap_reg_ioackin_outputStream_V_V_TREADY)))) begin
        outputStream_V_V_TVALID = 1'b1;
    end else begin
        outputStream_V_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

always @ (*) begin
    ap_sig_100 = ((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_87);
end

always @ (*) begin
    ap_sig_18 = (ap_CS_fsm[ap_const_lv32_0] == 1'b1);
end

always @ (*) begin
    ap_sig_87 = (((switch_stream_read_read_fu_30_p2 == 1'b0) & (data_in_ov7670_V_V_TVALID == 1'b0)) | (~(switch_stream_read_read_fu_30_p2 == 1'b0) & (data_in_sd_V_V_TVALID == 1'b0)) | (ap_start == 1'b0));
end

assign switch_stream_read_read_fu_30_p2 = switch_stream;

endmodule //mux_sd_ov
