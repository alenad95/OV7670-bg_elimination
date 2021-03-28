// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.4
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

#ifndef _axi_stream_to_vga_red_255_HH_
#define _axi_stream_to_vga_red_255_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct axi_stream_to_vga_red_255 : public sc_module {
    // Port declarations 15
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst_n;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_logic > selftest;
    sc_in< sc_lv<8> > inStream_V_V_TDATA;
    sc_in< sc_logic > inStream_V_V_TVALID;
    sc_out< sc_logic > inStream_V_V_TREADY;
    sc_out< sc_lv<4> > R_V;
    sc_out< sc_lv<4> > G_V;
    sc_out< sc_lv<4> > B_V;
    sc_out< sc_lv<1> > V_SYNC_V;
    sc_out< sc_lv<1> > H_SYNC_V;


    // Module declarations
    axi_stream_to_vga_red_255(sc_module_name name);
    SC_HAS_PROCESS(axi_stream_to_vga_red_255);

    ~axi_stream_to_vga_red_255();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    sc_signal< sc_logic > ap_rst_n_inv;
    sc_signal< sc_lv<3> > ap_CS_fsm;
    sc_signal< sc_logic > ap_sig_cseq_ST_st1_fsm_0;
    sc_signal< bool > ap_sig_bdd_21;
    sc_signal< sc_lv<4> > color_blinking_V;
    sc_signal< sc_lv<19> > indvar_flatten_reg_194;
    sc_signal< sc_lv<10> > y_reg_205;
    sc_signal< sc_lv<10> > x_reg_216;
    sc_signal< sc_lv<1> > selftest_read_read_fu_136_p2;
    sc_signal< sc_lv<4> > op2_V_read_assign_fu_259_p2;
    sc_signal< sc_lv<4> > op2_V_read_assign_reg_504;
    sc_signal< sc_lv<1> > tmp_nbreadreq_fu_142_p3;
    sc_signal< sc_lv<1> > tmp_reg_509;
    sc_signal< sc_lv<4> > tmp_6_i_fu_271_p2;
    sc_signal< sc_lv<4> > tmp_6_i_reg_513;
    sc_signal< sc_lv<1> > exitcond_flatten_fu_277_p2;
    sc_signal< sc_lv<1> > exitcond_flatten_reg_518;
    sc_signal< sc_logic > ap_sig_cseq_ST_pp0_stg0_fsm_1;
    sc_signal< bool > ap_sig_bdd_63;
    sc_signal< sc_lv<1> > or_cond2_fu_391_p2;
    sc_signal< bool > ap_sig_bdd_78;
    sc_signal< sc_logic > ap_reg_ppiten_pp0_it0;
    sc_signal< sc_logic > ap_reg_ppiten_pp0_it1;
    sc_signal< sc_lv<19> > indvar_flatten_next_fu_283_p2;
    sc_signal< sc_lv<10> > y_mid2_fu_309_p3;
    sc_signal< sc_lv<10> > y_mid2_reg_527;
    sc_signal< sc_lv<1> > icmp_fu_333_p2;
    sc_signal< sc_lv<1> > icmp_reg_532;
    sc_signal< sc_lv<1> > not_1_fu_367_p2;
    sc_signal< sc_lv<1> > not_1_reg_537;
    sc_signal< sc_lv<1> > or_cond2_reg_542;
    sc_signal< sc_lv<10> > x_1_fu_458_p2;
    sc_signal< sc_lv<10> > y_phi_fu_209_p4;
    sc_signal< sc_lv<4> > R_temp_V_read_assign_fu_124;
    sc_signal< sc_lv<1> > tmp_6_fu_397_p2;
    sc_signal< sc_lv<21> > tmp_2_i_fu_448_p4;
    sc_signal< sc_lv<4> > G_temp_V_read_assign_fu_128;
    sc_signal< sc_lv<4> > B_temp_V_read_assign_fu_132;
    sc_signal< sc_lv<4> > R_V_preg;
    sc_signal< sc_lv<4> > G_V_preg;
    sc_signal< sc_lv<4> > B_V_preg;
    sc_signal< sc_lv<1> > V_SYNC_V_preg;
    sc_signal< sc_lv<1> > H_SYNC_V_preg;
    sc_signal< sc_lv<1> > exitcond4_fu_289_p2;
    sc_signal< sc_lv<10> > y_s_fu_303_p2;
    sc_signal< sc_lv<9> > tmp_3_fu_323_p4;
    sc_signal< sc_lv<1> > tmp_1_fu_339_p2;
    sc_signal< sc_lv<1> > tmp_2_fu_345_p2;
    sc_signal< sc_lv<10> > x_mid2_fu_295_p3;
    sc_signal< sc_lv<11> > tmp_3_cast_fu_357_p1;
    sc_signal< sc_lv<1> > tmp_4_fu_373_p2;
    sc_signal< sc_lv<1> > tmp_5_fu_379_p2;
    sc_signal< sc_lv<1> > tmp2_fu_351_p2;
    sc_signal< sc_lv<1> > tmp1_fu_385_p2;
    sc_signal< sc_lv<10> > p_Val2_1_fu_317_p2;
    sc_signal< sc_lv<11> > p_Val2_s_fu_361_p2;
    sc_signal< sc_lv<1> > tmp_8_fu_436_p3;
    sc_signal< sc_lv<19> > tmp_1_i_fu_444_p1;
    sc_signal< sc_lv<1> > tmp_7_fu_428_p3;
    sc_signal< sc_logic > ap_sig_cseq_ST_st4_fsm_2;
    sc_signal< bool > ap_sig_bdd_307;
    sc_signal< sc_lv<3> > ap_NS_fsm;
    sc_signal< bool > ap_sig_bdd_110;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<3> ap_ST_st1_fsm_0;
    static const sc_lv<3> ap_ST_pp0_stg0_fsm_1;
    static const sc_lv<3> ap_ST_st4_fsm_2;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<19> ap_const_lv19_0;
    static const sc_lv<10> ap_const_lv10_0;
    static const sc_lv<4> ap_const_lv4_F;
    static const sc_lv<21> ap_const_lv21_3;
    static const sc_lv<21> ap_const_lv21_2;
    static const sc_lv<21> ap_const_lv21_1;
    static const sc_lv<21> ap_const_lv21_0;
    static const sc_lv<4> ap_const_lv4_1;
    static const sc_lv<4> ap_const_lv4_E;
    static const sc_lv<19> ap_const_lv19_668A0;
    static const sc_lv<19> ap_const_lv19_1;
    static const sc_lv<10> ap_const_lv10_320;
    static const sc_lv<10> ap_const_lv10_1;
    static const sc_lv<10> ap_const_lv10_3DD;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<9> ap_const_lv9_0;
    static const sc_lv<10> ap_const_lv10_22;
    static const sc_lv<10> ap_const_lv10_203;
    static const sc_lv<11> ap_const_lv11_770;
    static const sc_lv<10> ap_const_lv10_5F;
    static const sc_lv<10> ap_const_lv10_8F;
    static const sc_lv<10> ap_const_lv10_310;
    static const sc_lv<8> ap_const_lv8_FF;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_lv<32> ap_const_lv32_2;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_B_V();
    void thread_G_V();
    void thread_H_SYNC_V();
    void thread_R_V();
    void thread_V_SYNC_V();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_rst_n_inv();
    void thread_ap_sig_bdd_110();
    void thread_ap_sig_bdd_21();
    void thread_ap_sig_bdd_307();
    void thread_ap_sig_bdd_63();
    void thread_ap_sig_bdd_78();
    void thread_ap_sig_cseq_ST_pp0_stg0_fsm_1();
    void thread_ap_sig_cseq_ST_st1_fsm_0();
    void thread_ap_sig_cseq_ST_st4_fsm_2();
    void thread_exitcond4_fu_289_p2();
    void thread_exitcond_flatten_fu_277_p2();
    void thread_icmp_fu_333_p2();
    void thread_inStream_V_V_TREADY();
    void thread_indvar_flatten_next_fu_283_p2();
    void thread_not_1_fu_367_p2();
    void thread_op2_V_read_assign_fu_259_p2();
    void thread_or_cond2_fu_391_p2();
    void thread_p_Val2_1_fu_317_p2();
    void thread_p_Val2_s_fu_361_p2();
    void thread_selftest_read_read_fu_136_p2();
    void thread_tmp1_fu_385_p2();
    void thread_tmp2_fu_351_p2();
    void thread_tmp_1_fu_339_p2();
    void thread_tmp_1_i_fu_444_p1();
    void thread_tmp_2_fu_345_p2();
    void thread_tmp_2_i_fu_448_p4();
    void thread_tmp_3_cast_fu_357_p1();
    void thread_tmp_3_fu_323_p4();
    void thread_tmp_4_fu_373_p2();
    void thread_tmp_5_fu_379_p2();
    void thread_tmp_6_fu_397_p2();
    void thread_tmp_6_i_fu_271_p2();
    void thread_tmp_7_fu_428_p3();
    void thread_tmp_8_fu_436_p3();
    void thread_tmp_nbreadreq_fu_142_p3();
    void thread_x_1_fu_458_p2();
    void thread_x_mid2_fu_295_p3();
    void thread_y_mid2_fu_309_p3();
    void thread_y_phi_fu_209_p4();
    void thread_y_s_fu_303_p2();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
