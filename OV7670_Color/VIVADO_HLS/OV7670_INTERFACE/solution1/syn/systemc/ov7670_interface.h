// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _ov7670_interface_HH_
#define _ov7670_interface_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct ov7670_interface : public sc_module {
    // Port declarations 12
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<8> > data_in_V;
    sc_in< sc_lv<1> > href_V;
    sc_in< sc_lv<1> > vsync_V;
    sc_out< sc_lv<8> > data_out_V;
    sc_out< sc_lv<1> > line_valid_V;
    sc_out< sc_lv<1> > frame_valid_V;


    // Module declarations
    ov7670_interface(sc_module_name name);
    SC_HAS_PROCESS(ov7670_interface);

    ~ov7670_interface();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_sig_cseq_ST_st1_fsm_0;
    sc_signal< bool > ap_sig_16;
    sc_signal< sc_lv<32> > count_lines;
    sc_signal< sc_lv<1> > first;
    sc_signal< sc_lv<32> > count_readings;
    sc_signal< sc_lv<1> > brmerge_fu_113_p2;
    sc_signal< sc_lv<1> > or_cond_fu_137_p2;
    sc_signal< sc_lv<1> > or_cond1_fu_149_p2;
    sc_signal< sc_lv<32> > tmp_5_fu_177_p2;
    sc_signal< sc_lv<1> > href_V_read_read_fu_60_p2;
    sc_signal< sc_lv<1> > tmp_4_fu_165_p2;
    sc_signal< sc_lv<32> > tmp_3_fu_189_p2;
    sc_signal< sc_lv<1> > p_not1_fu_107_p2;
    sc_signal< sc_lv<1> > tmp_1_fu_131_p2;
    sc_signal< sc_lv<1> > p_not_fu_125_p2;
    sc_signal< sc_lv<1> > tmp_2_fu_143_p2;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< bool > ap_sig_125;
    sc_signal< bool > ap_sig_128;
    sc_signal< bool > ap_sig_60;
    sc_signal< bool > ap_sig_131;
    sc_signal< bool > ap_sig_75;
    sc_signal< bool > ap_sig_65;
    sc_signal< bool > ap_sig_35;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_st1_fsm_0;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<8> ap_const_lv8_0;
    static const sc_lv<32> ap_const_lv32_1E0;
    static const sc_lv<32> ap_const_lv32_500;
    static const sc_lv<32> ap_const_lv32_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_sig_125();
    void thread_ap_sig_128();
    void thread_ap_sig_131();
    void thread_ap_sig_16();
    void thread_ap_sig_35();
    void thread_ap_sig_60();
    void thread_ap_sig_65();
    void thread_ap_sig_75();
    void thread_ap_sig_cseq_ST_st1_fsm_0();
    void thread_brmerge_fu_113_p2();
    void thread_data_out_V();
    void thread_frame_valid_V();
    void thread_href_V_read_read_fu_60_p2();
    void thread_line_valid_V();
    void thread_or_cond1_fu_149_p2();
    void thread_or_cond_fu_137_p2();
    void thread_p_not1_fu_107_p2();
    void thread_p_not_fu_125_p2();
    void thread_tmp_1_fu_131_p2();
    void thread_tmp_2_fu_143_p2();
    void thread_tmp_3_fu_189_p2();
    void thread_tmp_4_fu_165_p2();
    void thread_tmp_5_fu_177_p2();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
