// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="pattern_generator,hls_ip_2015_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.328000,HLS_SYN_LAT=62,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=210,HLS_SYN_LUT=253}" *)

module pattern_generator (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        outputStream_V_TDATA,
        outputStream_V_TVALID,
        outputStream_V_TREADY
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_st1_fsm_0 = 4'b1;
parameter    ap_ST_st2_fsm_1 = 4'b10;
parameter    ap_ST_st3_fsm_2 = 4'b100;
parameter    ap_ST_st4_fsm_3 = 4'b1000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv3_0 = 3'b000;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv8_3F = 8'b111111;
parameter    ap_const_lv8_CF = 8'b11001111;
parameter    ap_const_lv3_6 = 3'b110;
parameter    ap_const_lv3_1 = 3'b1;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv4_8 = 4'b1000;
parameter    ap_const_lv4_1 = 4'b1;
parameter    ap_const_lv32_FFFFFFFF = 32'b11111111111111111111111111111111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [7:0] outputStream_V_TDATA;
output   outputStream_V_TVALID;
input   outputStream_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[7:0] outputStream_V_TDATA;
reg outputStream_V_TVALID;
reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_22;
reg   [31:0] lineX = 32'b00000000000000000000000000000000;
reg   [31:0] lineY = 32'b00000000000000000000000000000000;
reg   [31:0] modeX = 32'b1;
reg   [31:0] modeY = 32'b1;
reg   [31:0] lineX_load_reg_270;
reg   [31:0] lineY_load_reg_278;
wire   [2:0] y_1_fu_129_p2;
reg   [2:0] y_1_reg_289;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_50;
wire   [0:0] tmp_4_fu_135_p2;
reg   [0:0] tmp_4_reg_294;
wire   [0:0] exitcond5_fu_123_p2;
wire   [3:0] x_1_fu_194_p2;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_bdd_65;
wire   [0:0] exitcond_fu_188_p2;
wire   [0:0] or_cond_fu_205_p2;
reg    ap_sig_ioackin_outputStream_V_TREADY;
reg   [2:0] y_reg_67;
reg   [31:0] tmp_5_reg_78;
wire   [0:0] tmp_fu_140_p2;
reg   [3:0] x_reg_89;
reg   [31:0] tmp_s_reg_100;
wire   [0:0] tmp_6_fu_162_p2;
wire   [31:0] storemerge_fu_228_p2;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_bdd_115;
wire   [31:0] storemerge4_fu_258_p2;
wire   [0:0] tmp_1_fu_145_p2;
wire   [0:0] tmp_9_fu_167_p2;
reg    ap_reg_ioackin_outputStream_V_TREADY = 1'b0;
wire   [31:0] y_cast2_fu_119_p1;
wire   [31:0] x_cast1_fu_184_p1;
wire   [0:0] tmp_3_fu_200_p2;
wire   [0:0] tmp_8_fu_214_p2;
wire   [31:0] storemerge_v_cast_cast_fu_220_p3;
wire   [0:0] tmp_2_fu_244_p2;
wire   [31:0] storemerge4_v_cast_cast_fu_250_p3;
reg   [3:0] ap_NS_fsm;
reg    ap_sig_bdd_239;
reg    ap_sig_bdd_209;
reg    ap_sig_bdd_242;
reg    ap_sig_bdd_244;




always @ (posedge ap_clk) begin : ap_ret_ap_CS_fsm
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin : ap_ret_ap_reg_ioackin_outputStream_V_TREADY
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_outputStream_V_TREADY <= ap_const_logic_0;
    end else begin
        if ((((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & ~(((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond_fu_205_p2)))) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_188_p2) & ~(ap_const_lv1_0 == or_cond_fu_205_p2) & ~(((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond_fu_205_p2)))))) begin
            ap_reg_ioackin_outputStream_V_TREADY <= ap_const_logic_0;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_1 == outputStream_V_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_188_p2) & ~(ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_1 == outputStream_V_TREADY)))) begin
            ap_reg_ioackin_outputStream_V_TREADY <= ap_const_logic_1;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_lineX
    if (ap_rst_n_inv == 1'b1) begin
        lineX <= ap_const_lv32_0;
    end else begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
            lineX <= storemerge_fu_228_p2;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_lineY
    if (ap_rst_n_inv == 1'b1) begin
        lineY <= ap_const_lv32_0;
    end else begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
            lineY <= storemerge4_fu_258_p2;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_modeX
    if (ap_rst_n_inv == 1'b1) begin
        modeX[0] <= 1'b1;
    end else begin
        if (ap_sig_bdd_209) begin
            if (~(ap_const_lv1_0 == tmp_fu_140_p2)) begin
                modeX[0] <= 1'b1;
            end else if (ap_sig_bdd_239) begin
                modeX[0] <= 1'b0;
            end
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_modeY
    if (ap_rst_n_inv == 1'b1) begin
        modeY[0] <= 1'b1;
    end else begin
        if (ap_sig_bdd_209) begin
            if (~(ap_const_lv1_0 == tmp_6_fu_162_p2)) begin
                modeY[0] <= 1'b1;
            end else if (ap_sig_bdd_242) begin
                modeY[0] <= 1'b0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_sig_bdd_209) begin
        if (~(ap_const_lv1_0 == tmp_fu_140_p2)) begin
            tmp_5_reg_78 <= ap_const_lv32_0;
        end else if ((ap_const_lv1_0 == tmp_fu_140_p2)) begin
            tmp_5_reg_78 <= lineX_load_reg_270;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_sig_bdd_209) begin
        if (~(ap_const_lv1_0 == tmp_6_fu_162_p2)) begin
            tmp_s_reg_100 <= ap_const_lv32_0;
        end else if ((ap_const_lv1_0 == tmp_6_fu_162_p2)) begin
            tmp_s_reg_100 <= lineY_load_reg_278;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_123_p2 == ap_const_lv1_0))) begin
        x_reg_89 <= ap_const_lv4_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_188_p2) & ~(((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond_fu_205_p2))))) begin
        x_reg_89 <= x_1_fu_194_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & ~(((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond_fu_205_p2))) & ~(ap_const_lv1_0 == exitcond_fu_188_p2))) begin
        y_reg_67 <= y_1_reg_289;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        y_reg_67 <= ap_const_lv3_0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == ap_const_logic_0))) begin
        lineX_load_reg_270 <= lineX;
        lineY_load_reg_278 <= lineY;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_123_p2 == ap_const_lv1_0))) begin
        tmp_4_reg_294 <= tmp_4_fu_135_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        y_1_reg_289 <= y_1_fu_129_p2;
    end
end

always @ (ap_sig_cseq_ST_st4_fsm_3) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

always @ (ap_start or ap_sig_cseq_ST_st1_fsm_0) begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

always @ (ap_sig_cseq_ST_st4_fsm_3) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_22) begin
    if (ap_sig_bdd_22) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_50) begin
    if (ap_sig_bdd_50) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_65) begin
    if (ap_sig_bdd_65) begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_115) begin
    if (ap_sig_bdd_115) begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_0;
    end
end

always @ (outputStream_V_TREADY or ap_reg_ioackin_outputStream_V_TREADY) begin
    if ((ap_const_logic_0 == ap_reg_ioackin_outputStream_V_TREADY)) begin
        ap_sig_ioackin_outputStream_V_TREADY = outputStream_V_TREADY;
    end else begin
        ap_sig_ioackin_outputStream_V_TREADY = ap_const_logic_1;
    end
end

always @ (or_cond_fu_205_p2 or ap_sig_bdd_244) begin
    if (ap_sig_bdd_244) begin
        if (~(ap_const_lv1_0 == or_cond_fu_205_p2)) begin
            outputStream_V_TDATA = ap_const_lv8_CF;
        end else if ((ap_const_lv1_0 == or_cond_fu_205_p2)) begin
            outputStream_V_TDATA = ap_const_lv8_3F;
        end else begin
            outputStream_V_TDATA = 'bx;
        end
    end else begin
        outputStream_V_TDATA = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st3_fsm_2 or exitcond_fu_188_p2 or or_cond_fu_205_p2 or ap_reg_ioackin_outputStream_V_TREADY) begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_0 == ap_reg_ioackin_outputStream_V_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_188_p2) & ~(ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_0 == ap_reg_ioackin_outputStream_V_TREADY)))) begin
        outputStream_V_TVALID = ap_const_logic_1;
    end else begin
        outputStream_V_TVALID = ap_const_logic_0;
    end
end
always @ (ap_start or ap_CS_fsm or exitcond5_fu_123_p2 or exitcond_fu_188_p2 or or_cond_fu_205_p2 or ap_sig_ioackin_outputStream_V_TREADY) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            if (~(ap_start == ap_const_logic_0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(exitcond5_fu_123_p2 == ap_const_lv1_0)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : 
        begin
            if (((ap_const_lv1_0 == exitcond_fu_188_p2) & ~(((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond_fu_205_p2))))) begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end else if ((~(((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_lv1_0 == or_cond_fu_205_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_188_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond_fu_205_p2))) & ~(ap_const_lv1_0 == exitcond_fu_188_p2))) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st4_fsm_3 : 
        begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end



always @ (ap_rst_n) begin
    ap_rst_n_inv = ~ap_rst_n;
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_115 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end


always @ (ap_sig_cseq_ST_st2_fsm_1 or exitcond5_fu_123_p2) begin
    ap_sig_bdd_209 = ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond5_fu_123_p2 == ap_const_lv1_0));
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_22 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (tmp_fu_140_p2 or tmp_1_fu_145_p2) begin
    ap_sig_bdd_239 = ((ap_const_lv1_0 == tmp_fu_140_p2) & ~(ap_const_lv1_0 == tmp_1_fu_145_p2));
end


always @ (tmp_6_fu_162_p2 or tmp_9_fu_167_p2) begin
    ap_sig_bdd_242 = ((ap_const_lv1_0 == tmp_6_fu_162_p2) & ~(ap_const_lv1_0 == tmp_9_fu_167_p2));
end


always @ (ap_sig_cseq_ST_st3_fsm_2 or exitcond_fu_188_p2) begin
    ap_sig_bdd_244 = ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_188_p2));
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_50 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_65 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end

assign exitcond5_fu_123_p2 = (y_reg_67 == ap_const_lv3_6? 1'b1: 1'b0);

assign exitcond_fu_188_p2 = (x_reg_89 == ap_const_lv4_8? 1'b1: 1'b0);

assign or_cond_fu_205_p2 = (tmp_3_fu_200_p2 | tmp_4_reg_294);

assign storemerge4_fu_258_p2 = (tmp_s_reg_100 + storemerge4_v_cast_cast_fu_250_p3);

assign storemerge4_v_cast_cast_fu_250_p3 = ((tmp_2_fu_244_p2[0:0] === 1'b1) ? ap_const_lv32_1 : ap_const_lv32_FFFFFFFF);

assign storemerge_fu_228_p2 = (tmp_5_reg_78 + storemerge_v_cast_cast_fu_220_p3);

assign storemerge_v_cast_cast_fu_220_p3 = ((tmp_8_fu_214_p2[0:0] === 1'b1) ? ap_const_lv32_1 : ap_const_lv32_FFFFFFFF);

assign tmp_1_fu_145_p2 = (lineX_load_reg_270 == ap_const_lv32_7? 1'b1: 1'b0);

assign tmp_2_fu_244_p2 = (modeY == ap_const_lv32_1? 1'b1: 1'b0);

assign tmp_3_fu_200_p2 = (x_cast1_fu_184_p1 == lineX_load_reg_270? 1'b1: 1'b0);

assign tmp_4_fu_135_p2 = (y_cast2_fu_119_p1 == lineY_load_reg_278? 1'b1: 1'b0);

assign tmp_6_fu_162_p2 = (lineY_load_reg_278 == ap_const_lv32_0? 1'b1: 1'b0);

assign tmp_8_fu_214_p2 = (modeX == ap_const_lv32_1? 1'b1: 1'b0);

assign tmp_9_fu_167_p2 = (lineY_load_reg_278 == ap_const_lv32_5? 1'b1: 1'b0);

assign tmp_fu_140_p2 = (lineX_load_reg_270 == ap_const_lv32_0? 1'b1: 1'b0);

assign x_1_fu_194_p2 = (x_reg_89 + ap_const_lv4_1);

assign x_cast1_fu_184_p1 = x_reg_89;

assign y_1_fu_129_p2 = (y_reg_67 + ap_const_lv3_1);

assign y_cast2_fu_119_p1 = y_reg_67;
always @ (posedge ap_clk) begin
    modeX[31:1] <= 31'b0000000000000000000000000000000;
    modeY[31:1] <= 31'b0000000000000000000000000000000;
end



endmodule //pattern_generator

