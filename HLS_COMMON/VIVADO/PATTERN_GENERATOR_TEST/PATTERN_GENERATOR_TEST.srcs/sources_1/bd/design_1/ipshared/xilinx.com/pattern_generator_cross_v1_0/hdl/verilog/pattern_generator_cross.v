// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="pattern_generator_cross,hls_ip_2015_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.888000,HLS_SYN_LAT=368222,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=229,HLS_SYN_LUT=266}" *)

module pattern_generator_cross (
        ap_clk,
        ap_rst_n,
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
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv9_0 = 9'b000000000;
parameter    ap_const_lv10_0 = 10'b0000000000;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv8_3E = 8'b111110;
parameter    ap_const_lv8_C1 = 8'b11000001;
parameter    ap_const_lv9_1FE = 9'b111111110;
parameter    ap_const_lv9_1 = 9'b1;
parameter    ap_const_lv9_1E0 = 9'b111100000;
parameter    ap_const_lv32_27F = 32'b1001111111;
parameter    ap_const_lv32_1DF = 32'b111011111;
parameter    ap_const_lv10_2D0 = 10'b1011010000;
parameter    ap_const_lv10_1 = 10'b1;
parameter    ap_const_lv10_280 = 10'b1010000000;
parameter    ap_const_lv32_FFFFFFFF = 32'b11111111111111111111111111111111;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst_n;
output  [7:0] outputStream_V_TDATA;
output   outputStream_V_TVALID;
input   outputStream_V_TREADY;

reg[7:0] outputStream_V_TDATA;
reg outputStream_V_TVALID;
reg    ap_rst_n_inv;
reg   [31:0] lineX = 32'b00000000000000000000000000000000;
reg   [31:0] lineY = 32'b00000000000000000000000000000000;
reg   [0:0] dirX = 1'b0;
reg   [0:0] dirY = 1'b0;
reg   [31:0] lineX_load_reg_285;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm = 4'b1;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_bdd_29;
reg   [31:0] lineY_load_reg_293;
wire   [8:0] y_1_fu_139_p2;
reg   [8:0] y_1_reg_304;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_bdd_41;
wire   [0:0] tmp_3_fu_145_p2;
reg   [0:0] tmp_3_reg_309;
wire   [0:0] exitcond5_fu_133_p2;
wire   [0:0] tmp_s_fu_151_p2;
reg   [0:0] tmp_s_reg_314;
wire   [9:0] x_1_fu_210_p2;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_bdd_57;
wire   [0:0] exitcond_fu_204_p2;
wire   [0:0] or_cond_fu_222_p2;
wire   [0:0] or_cond7_fu_232_p2;
reg    ap_sig_ioackin_outputStream_V_TREADY;
reg   [8:0] y_reg_77;
reg   [31:0] tmp_7_reg_88;
wire   [0:0] tmp_2_fu_156_p2;
reg   [9:0] x_reg_99;
reg   [31:0] tmp_5_reg_110;
wire   [0:0] tmp_8_fu_178_p2;
wire   [31:0] storemerge_fu_249_p2;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_bdd_111;
wire   [31:0] storemerge4_fu_273_p2;
wire   [0:0] tmp_4_fu_161_p2;
wire   [0:0] tmp_1_fu_183_p2;
reg    ap_reg_ioackin_outputStream_V_TREADY = 1'b0;
wire   [31:0] y_cast2_fu_129_p1;
wire   [0:0] tmp_6_fu_216_p2;
wire   [31:0] x_cast1_fu_200_p1;
wire   [0:0] tmp_9_fu_227_p2;
wire   [31:0] storemerge_v_cast_cast_fu_241_p3;
wire   [31:0] storemerge4_v_cast_cast_fu_265_p3;
reg   [3:0] ap_NS_fsm;
reg    ap_sig_bdd_239;
reg    ap_sig_bdd_209;
reg    ap_sig_bdd_242;
reg    ap_sig_bdd_245;




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
        if ((((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & ~(((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2)))) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2) & ~(((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2)))))) begin
            ap_reg_ioackin_outputStream_V_TREADY <= ap_const_logic_0;
        end else if ((((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_1 == outputStream_V_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_1 == outputStream_V_TREADY)))) begin
            ap_reg_ioackin_outputStream_V_TREADY <= ap_const_logic_1;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_dirX
    if (ap_rst_n_inv == 1'b1) begin
        dirX <= ap_const_lv1_0;
    end else begin
        if (ap_sig_bdd_209) begin
            if (~(ap_const_lv1_0 == tmp_2_fu_156_p2)) begin
                dirX <= ap_const_lv1_0;
            end else if (ap_sig_bdd_239) begin
                dirX <= ap_const_lv1_1;
            end
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_dirY
    if (ap_rst_n_inv == 1'b1) begin
        dirY <= ap_const_lv1_0;
    end else begin
        if (ap_sig_bdd_209) begin
            if (~(ap_const_lv1_0 == tmp_8_fu_178_p2)) begin
                dirY <= ap_const_lv1_0;
            end else if (ap_sig_bdd_242) begin
                dirY <= ap_const_lv1_1;
            end
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_lineX
    if (ap_rst_n_inv == 1'b1) begin
        lineX <= ap_const_lv32_0;
    end else begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
            lineX <= storemerge_fu_249_p2;
        end
    end
end

always @ (posedge ap_clk) begin : ap_ret_lineY
    if (ap_rst_n_inv == 1'b1) begin
        lineY <= ap_const_lv32_0;
    end else begin
        if ((ap_const_logic_1 == ap_sig_cseq_ST_st4_fsm_3)) begin
            lineY <= storemerge4_fu_273_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_sig_bdd_209) begin
        if (~(ap_const_lv1_0 == tmp_8_fu_178_p2)) begin
            tmp_5_reg_110 <= ap_const_lv32_0;
        end else if ((ap_const_lv1_0 == tmp_8_fu_178_p2)) begin
            tmp_5_reg_110 <= lineY_load_reg_293;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_sig_bdd_209) begin
        if (~(ap_const_lv1_0 == tmp_2_fu_156_p2)) begin
            tmp_7_reg_88 <= ap_const_lv32_0;
        end else if ((ap_const_lv1_0 == tmp_2_fu_156_p2)) begin
            tmp_7_reg_88 <= lineX_load_reg_285;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (ap_const_lv1_0 == exitcond5_fu_133_p2))) begin
        x_reg_99 <= ap_const_lv10_0;
    end else if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_204_p2) & ~(((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2))))) begin
        x_reg_99 <= x_1_fu_210_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & ~(((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2))) & ~(ap_const_lv1_0 == exitcond_fu_204_p2))) begin
        y_reg_77 <= y_1_reg_304;
    end else if ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        y_reg_77 <= ap_const_lv9_0;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        lineX_load_reg_285 <= lineX;
        lineY_load_reg_293 <= lineY;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & (ap_const_lv1_0 == exitcond5_fu_133_p2))) begin
        tmp_3_reg_309 <= tmp_3_fu_145_p2;
        tmp_s_reg_314 <= tmp_s_fu_151_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        y_1_reg_304 <= y_1_fu_139_p2;
    end
end

always @ (ap_sig_bdd_29) begin
    if (ap_sig_bdd_29) begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_41) begin
    if (ap_sig_bdd_41) begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_57) begin
    if (ap_sig_bdd_57) begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    end
end

always @ (ap_sig_bdd_111) begin
    if (ap_sig_bdd_111) begin
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

always @ (or_cond7_fu_232_p2 or ap_sig_bdd_245) begin
    if (ap_sig_bdd_245) begin
        if (~(ap_const_lv1_0 == or_cond7_fu_232_p2)) begin
            outputStream_V_TDATA = ap_const_lv8_C1;
        end else if ((ap_const_lv1_0 == or_cond7_fu_232_p2)) begin
            outputStream_V_TDATA = ap_const_lv8_3E;
        end else begin
            outputStream_V_TDATA = 'bx;
        end
    end else begin
        outputStream_V_TDATA = 'bx;
    end
end

always @ (ap_sig_cseq_ST_st3_fsm_2 or exitcond_fu_204_p2 or or_cond_fu_222_p2 or or_cond7_fu_232_p2 or ap_reg_ioackin_outputStream_V_TREADY) begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_0 == ap_reg_ioackin_outputStream_V_TREADY)) | ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_0 == ap_reg_ioackin_outputStream_V_TREADY)))) begin
        outputStream_V_TVALID = ap_const_logic_1;
    end else begin
        outputStream_V_TVALID = ap_const_logic_0;
    end
end
always @ (ap_CS_fsm or exitcond5_fu_133_p2 or exitcond_fu_204_p2 or or_cond_fu_222_p2 or or_cond7_fu_232_p2 or ap_sig_ioackin_outputStream_V_TREADY) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : 
        begin
            ap_NS_fsm = ap_ST_st2_fsm_1;
        end
        ap_ST_st2_fsm_1 : 
        begin
            if (~(ap_const_lv1_0 == exitcond5_fu_133_p2)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : 
        begin
            if (((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2))))) begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end else if ((~(((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_lv1_0 == or_cond7_fu_232_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY)) | ((ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2) & (ap_const_logic_0 == ap_sig_ioackin_outputStream_V_TREADY) & ~(ap_const_lv1_0 == or_cond7_fu_232_p2))) & ~(ap_const_lv1_0 == exitcond_fu_204_p2))) begin
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
    ap_sig_bdd_111 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_3]);
end


always @ (ap_sig_cseq_ST_st2_fsm_1 or exitcond5_fu_133_p2) begin
    ap_sig_bdd_209 = ((ap_const_logic_1 == ap_sig_cseq_ST_st2_fsm_1) & ~(ap_const_lv1_0 == exitcond5_fu_133_p2));
end


always @ (tmp_2_fu_156_p2 or tmp_4_fu_161_p2) begin
    ap_sig_bdd_239 = ((ap_const_lv1_0 == tmp_2_fu_156_p2) & ~(ap_const_lv1_0 == tmp_4_fu_161_p2));
end


always @ (tmp_8_fu_178_p2 or tmp_1_fu_183_p2) begin
    ap_sig_bdd_242 = ((ap_const_lv1_0 == tmp_8_fu_178_p2) & ~(ap_const_lv1_0 == tmp_1_fu_183_p2));
end


always @ (ap_sig_cseq_ST_st3_fsm_2 or exitcond_fu_204_p2 or or_cond_fu_222_p2) begin
    ap_sig_bdd_245 = ((ap_const_logic_1 == ap_sig_cseq_ST_st3_fsm_2) & (ap_const_lv1_0 == exitcond_fu_204_p2) & ~(ap_const_lv1_0 == or_cond_fu_222_p2));
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_29 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_41 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_1]);
end


always @ (ap_CS_fsm) begin
    ap_sig_bdd_57 = (ap_const_lv1_1 == ap_CS_fsm[ap_const_lv32_2]);
end

assign exitcond5_fu_133_p2 = (y_reg_77 == ap_const_lv9_1FE? 1'b1: 1'b0);

assign exitcond_fu_204_p2 = (x_reg_99 == ap_const_lv10_2D0? 1'b1: 1'b0);

assign or_cond7_fu_232_p2 = (tmp_9_fu_227_p2 | tmp_s_reg_314);

assign or_cond_fu_222_p2 = (tmp_3_reg_309 & tmp_6_fu_216_p2);

assign storemerge4_fu_273_p2 = (tmp_5_reg_110 + storemerge4_v_cast_cast_fu_265_p3);

assign storemerge4_v_cast_cast_fu_265_p3 = ((dirY[0:0] === 1'b1) ? ap_const_lv32_FFFFFFFF : ap_const_lv32_1);

assign storemerge_fu_249_p2 = (tmp_7_reg_88 + storemerge_v_cast_cast_fu_241_p3);

assign storemerge_v_cast_cast_fu_241_p3 = ((dirX[0:0] === 1'b1) ? ap_const_lv32_FFFFFFFF : ap_const_lv32_1);

assign tmp_1_fu_183_p2 = (lineY_load_reg_293 == ap_const_lv32_1DF? 1'b1: 1'b0);

assign tmp_2_fu_156_p2 = (lineX_load_reg_285 == ap_const_lv32_0? 1'b1: 1'b0);

assign tmp_3_fu_145_p2 = (y_reg_77 < ap_const_lv9_1E0? 1'b1: 1'b0);

assign tmp_4_fu_161_p2 = (lineX_load_reg_285 == ap_const_lv32_27F? 1'b1: 1'b0);

assign tmp_6_fu_216_p2 = (x_reg_99 < ap_const_lv10_280? 1'b1: 1'b0);

assign tmp_8_fu_178_p2 = (lineY_load_reg_293 == ap_const_lv32_0? 1'b1: 1'b0);

assign tmp_9_fu_227_p2 = (x_cast1_fu_200_p1 == lineX_load_reg_285? 1'b1: 1'b0);

assign tmp_s_fu_151_p2 = (y_cast2_fu_129_p1 == lineY_load_reg_293? 1'b1: 1'b0);

assign x_1_fu_210_p2 = (x_reg_99 + ap_const_lv10_1);

assign x_cast1_fu_200_p1 = x_reg_99;

assign y_1_fu_139_p2 = (y_reg_77 + ap_const_lv9_1);

assign y_cast2_fu_129_p1 = y_reg_77;


endmodule //pattern_generator_cross

