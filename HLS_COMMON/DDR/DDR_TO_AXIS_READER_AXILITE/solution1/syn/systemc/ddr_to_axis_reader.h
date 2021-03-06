// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _ddr_to_axis_reader_HH_
#define _ddr_to_axis_reader_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "ddr_to_axis_reader_mul_8ns_32ns_40_3.h"
#include "ddr_to_axis_reader_buffer.h"
#include "ddr_to_axis_reader_AXILiteS_s_axi.h"
#include "ddr_to_axis_reader_base_ddr_addr_m_axi.h"

namespace ap_rtl {

template<unsigned int C_M_AXI_BASE_DDR_ADDR_ADDR_WIDTH = 32,
         unsigned int C_M_AXI_BASE_DDR_ADDR_ID_WIDTH = 1,
         unsigned int C_M_AXI_BASE_DDR_ADDR_AWUSER_WIDTH = 1,
         unsigned int C_M_AXI_BASE_DDR_ADDR_DATA_WIDTH = 64,
         unsigned int C_M_AXI_BASE_DDR_ADDR_WUSER_WIDTH = 1,
         unsigned int C_M_AXI_BASE_DDR_ADDR_ARUSER_WIDTH = 1,
         unsigned int C_M_AXI_BASE_DDR_ADDR_RUSER_WIDTH = 1,
         unsigned int C_M_AXI_BASE_DDR_ADDR_BUSER_WIDTH = 1,
         unsigned int C_S_AXI_AXILITES_ADDR_WIDTH = 6,
         unsigned int C_S_AXI_AXILITES_DATA_WIDTH = 32>
struct ddr_to_axis_reader : public sc_module {
    // Port declarations 69
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst_n;
    sc_out< sc_lv<8> > outStream_V_TDATA;
    sc_out< sc_logic > outStream_V_TVALID;
    sc_in< sc_logic > outStream_V_TREADY;
    sc_out< sc_logic > m_axi_base_ddr_addr_AWVALID;
    sc_in< sc_logic > m_axi_base_ddr_addr_AWREADY;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_ADDR_WIDTH> > m_axi_base_ddr_addr_AWADDR;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_ID_WIDTH> > m_axi_base_ddr_addr_AWID;
    sc_out< sc_lv<8> > m_axi_base_ddr_addr_AWLEN;
    sc_out< sc_lv<3> > m_axi_base_ddr_addr_AWSIZE;
    sc_out< sc_lv<2> > m_axi_base_ddr_addr_AWBURST;
    sc_out< sc_lv<2> > m_axi_base_ddr_addr_AWLOCK;
    sc_out< sc_lv<4> > m_axi_base_ddr_addr_AWCACHE;
    sc_out< sc_lv<3> > m_axi_base_ddr_addr_AWPROT;
    sc_out< sc_lv<4> > m_axi_base_ddr_addr_AWQOS;
    sc_out< sc_lv<4> > m_axi_base_ddr_addr_AWREGION;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_AWUSER_WIDTH> > m_axi_base_ddr_addr_AWUSER;
    sc_out< sc_logic > m_axi_base_ddr_addr_WVALID;
    sc_in< sc_logic > m_axi_base_ddr_addr_WREADY;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_DATA_WIDTH> > m_axi_base_ddr_addr_WDATA;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_DATA_WIDTH/8> > m_axi_base_ddr_addr_WSTRB;
    sc_out< sc_logic > m_axi_base_ddr_addr_WLAST;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_ID_WIDTH> > m_axi_base_ddr_addr_WID;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_WUSER_WIDTH> > m_axi_base_ddr_addr_WUSER;
    sc_out< sc_logic > m_axi_base_ddr_addr_ARVALID;
    sc_in< sc_logic > m_axi_base_ddr_addr_ARREADY;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_ADDR_WIDTH> > m_axi_base_ddr_addr_ARADDR;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_ID_WIDTH> > m_axi_base_ddr_addr_ARID;
    sc_out< sc_lv<8> > m_axi_base_ddr_addr_ARLEN;
    sc_out< sc_lv<3> > m_axi_base_ddr_addr_ARSIZE;
    sc_out< sc_lv<2> > m_axi_base_ddr_addr_ARBURST;
    sc_out< sc_lv<2> > m_axi_base_ddr_addr_ARLOCK;
    sc_out< sc_lv<4> > m_axi_base_ddr_addr_ARCACHE;
    sc_out< sc_lv<3> > m_axi_base_ddr_addr_ARPROT;
    sc_out< sc_lv<4> > m_axi_base_ddr_addr_ARQOS;
    sc_out< sc_lv<4> > m_axi_base_ddr_addr_ARREGION;
    sc_out< sc_uint<C_M_AXI_BASE_DDR_ADDR_ARUSER_WIDTH> > m_axi_base_ddr_addr_ARUSER;
    sc_in< sc_logic > m_axi_base_ddr_addr_RVALID;
    sc_out< sc_logic > m_axi_base_ddr_addr_RREADY;
    sc_in< sc_uint<C_M_AXI_BASE_DDR_ADDR_DATA_WIDTH> > m_axi_base_ddr_addr_RDATA;
    sc_in< sc_logic > m_axi_base_ddr_addr_RLAST;
    sc_in< sc_uint<C_M_AXI_BASE_DDR_ADDR_ID_WIDTH> > m_axi_base_ddr_addr_RID;
    sc_in< sc_uint<C_M_AXI_BASE_DDR_ADDR_RUSER_WIDTH> > m_axi_base_ddr_addr_RUSER;
    sc_in< sc_lv<2> > m_axi_base_ddr_addr_RRESP;
    sc_in< sc_logic > m_axi_base_ddr_addr_BVALID;
    sc_out< sc_logic > m_axi_base_ddr_addr_BREADY;
    sc_in< sc_lv<2> > m_axi_base_ddr_addr_BRESP;
    sc_in< sc_uint<C_M_AXI_BASE_DDR_ADDR_ID_WIDTH> > m_axi_base_ddr_addr_BID;
    sc_in< sc_uint<C_M_AXI_BASE_DDR_ADDR_BUSER_WIDTH> > m_axi_base_ddr_addr_BUSER;
    sc_in< sc_lv<8> > frame_index_V;
    sc_in< sc_logic > s_axi_AXILiteS_AWVALID;
    sc_out< sc_logic > s_axi_AXILiteS_AWREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_ADDR_WIDTH> > s_axi_AXILiteS_AWADDR;
    sc_in< sc_logic > s_axi_AXILiteS_WVALID;
    sc_out< sc_logic > s_axi_AXILiteS_WREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH> > s_axi_AXILiteS_WDATA;
    sc_in< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH/8> > s_axi_AXILiteS_WSTRB;
    sc_in< sc_logic > s_axi_AXILiteS_ARVALID;
    sc_out< sc_logic > s_axi_AXILiteS_ARREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_ADDR_WIDTH> > s_axi_AXILiteS_ARADDR;
    sc_out< sc_logic > s_axi_AXILiteS_RVALID;
    sc_in< sc_logic > s_axi_AXILiteS_RREADY;
    sc_out< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH> > s_axi_AXILiteS_RDATA;
    sc_out< sc_lv<2> > s_axi_AXILiteS_RRESP;
    sc_out< sc_logic > s_axi_AXILiteS_BVALID;
    sc_in< sc_logic > s_axi_AXILiteS_BREADY;
    sc_out< sc_lv<2> > s_axi_AXILiteS_BRESP;
    sc_out< sc_logic > interrupt;
    sc_signal< sc_logic > ap_var_for_const0;
    sc_signal< sc_logic > ap_var_for_const6;
    sc_signal< sc_lv<32> > ap_var_for_const7;
    sc_signal< sc_lv<1> > ap_var_for_const1;
    sc_signal< sc_lv<32> > ap_var_for_const2;
    sc_signal< sc_lv<3> > ap_var_for_const3;
    sc_signal< sc_lv<2> > ap_var_for_const4;
    sc_signal< sc_lv<4> > ap_var_for_const5;
    sc_signal< sc_lv<8> > ap_var_for_const9;
    sc_signal< sc_lv<64> > ap_var_for_const8;


    // Module declarations
    ddr_to_axis_reader(sc_module_name name);
    SC_HAS_PROCESS(ddr_to_axis_reader);

    ~ddr_to_axis_reader();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    ddr_to_axis_reader_AXILiteS_s_axi<C_S_AXI_AXILITES_ADDR_WIDTH,C_S_AXI_AXILITES_DATA_WIDTH>* ddr_to_axis_reader_AXILiteS_s_axi_U;
    ddr_to_axis_reader_base_ddr_addr_m_axi<64,32,5,16,16,16,16,C_M_AXI_BASE_DDR_ADDR_ID_WIDTH,C_M_AXI_BASE_DDR_ADDR_ADDR_WIDTH,C_M_AXI_BASE_DDR_ADDR_DATA_WIDTH,C_M_AXI_BASE_DDR_ADDR_AWUSER_WIDTH,C_M_AXI_BASE_DDR_ADDR_ARUSER_WIDTH,C_M_AXI_BASE_DDR_ADDR_WUSER_WIDTH,C_M_AXI_BASE_DDR_ADDR_RUSER_WIDTH,C_M_AXI_BASE_DDR_ADDR_BUSER_WIDTH,C_M_AXI_BASE_DDR_ADDR_TARGET_ADDR,C_M_AXI_BASE_DDR_ADDR_USER_VALUE,C_M_AXI_BASE_DDR_ADDR_PROT_VALUE,C_M_AXI_BASE_DDR_ADDR_CACHE_VALUE>* ddr_to_axis_reader_base_ddr_addr_m_axi_U;
    ddr_to_axis_reader_buffer* buffer_U;
    ddr_to_axis_reader_mul_8ns_32ns_40_3<1,3,8,32,40>* ddr_to_axis_reader_mul_8ns_32ns_40_3_U0;
    sc_signal< sc_logic > ap_rst_n_inv;
    sc_signal< sc_logic > ap_start;
    sc_signal< sc_logic > ap_done;
    sc_signal< sc_logic > ap_idle;
    sc_signal< sc_lv<15> > ap_CS_fsm;
    sc_signal< sc_logic > ap_sig_cseq_ST_st1_fsm_0;
    sc_signal< bool > ap_sig_32;
    sc_signal< sc_logic > ap_ready;
    sc_signal< sc_lv<32> > base_address;
    sc_signal< sc_lv<32> > frame_buffer_dim;
    sc_signal< sc_lv<32> > frame_buffer_offset;
    sc_signal< sc_lv<8> > frame_buffer_number;
    sc_signal< sc_logic > update_intr;
    sc_signal< sc_lv<32> > FRAME_OFFSET;
    sc_signal< sc_lv<32> > FRAME_BUFFER_NUMBER_r;
    sc_signal< sc_lv<32> > FRAME_BUFFER_DIM_r;
    sc_signal< sc_logic > outStream_V_TDATA_blk_n;
    sc_signal< sc_logic > ap_reg_ppiten_pp1_it2;
    sc_signal< sc_logic > ap_reg_ppiten_pp1_it0;
    sc_signal< sc_logic > ap_reg_ppiten_pp1_it1;
    sc_signal< sc_lv<1> > exitcond_reg_671;
    sc_signal< sc_lv<1> > ap_reg_ppstg_exitcond_reg_671_pp1_iter1;
    sc_signal< sc_logic > base_ddr_addr_blk_n_AR;
    sc_signal< sc_logic > ap_sig_cseq_ST_st6_fsm_5;
    sc_signal< bool > ap_sig_122;
    sc_signal< sc_lv<1> > tmp_7_fu_414_p2;
    sc_signal< sc_logic > base_ddr_addr_blk_n_R;
    sc_signal< sc_logic > ap_sig_cseq_ST_pp0_stg0_fsm_12;
    sc_signal< bool > ap_sig_134;
    sc_signal< sc_logic > ap_reg_ppiten_pp0_it1;
    sc_signal< sc_logic > ap_reg_ppiten_pp0_it0;
    sc_signal< sc_logic > ap_reg_ppiten_pp0_it2;
    sc_signal< sc_lv<1> > exitcond1_reg_657;
    sc_signal< sc_logic > base_ddr_addr_AWREADY;
    sc_signal< sc_logic > base_ddr_addr_WREADY;
    sc_signal< sc_logic > base_ddr_addr_ARVALID;
    sc_signal< sc_logic > base_ddr_addr_ARREADY;
    sc_signal< sc_lv<32> > base_ddr_addr_ARADDR;
    sc_signal< sc_logic > base_ddr_addr_RVALID;
    sc_signal< sc_logic > base_ddr_addr_RREADY;
    sc_signal< sc_lv<64> > base_ddr_addr_RDATA;
    sc_signal< sc_logic > base_ddr_addr_RLAST;
    sc_signal< sc_lv<1> > base_ddr_addr_RID;
    sc_signal< sc_lv<1> > base_ddr_addr_RUSER;
    sc_signal< sc_lv<2> > base_ddr_addr_RRESP;
    sc_signal< sc_logic > base_ddr_addr_BVALID;
    sc_signal< sc_lv<2> > base_ddr_addr_BRESP;
    sc_signal< sc_lv<1> > base_ddr_addr_BID;
    sc_signal< sc_lv<1> > base_ddr_addr_BUSER;
    sc_signal< sc_lv<10> > indvar_reg_269;
    sc_signal< sc_lv<10> > ap_reg_ppstg_indvar_reg_269_pp0_iter1;
    sc_signal< bool > ap_sig_265;
    sc_signal< sc_lv<13> > j_reg_281;
    sc_signal< sc_lv<8> > inner_index_V_1_fu_362_p2;
    sc_signal< sc_lv<8> > inner_index_V_1_reg_618;
    sc_signal< sc_logic > ap_sig_cseq_ST_st2_fsm_1;
    sc_signal< bool > ap_sig_287;
    sc_signal< sc_lv<32> > tmp_s_reg_633;
    sc_signal< sc_logic > ap_sig_cseq_ST_st4_fsm_3;
    sc_signal< bool > ap_sig_298;
    sc_signal< sc_lv<32> > offset_fu_391_p2;
    sc_signal< sc_logic > ap_sig_cseq_ST_st5_fsm_4;
    sc_signal< bool > ap_sig_307;
    sc_signal< sc_lv<32> > i_1_fu_420_p2;
    sc_signal< sc_lv<32> > i_1_reg_646;
    sc_signal< sc_logic > ap_sig_ioackin_base_ddr_addr_ARREADY;
    sc_signal< sc_lv<1> > exitcond1_fu_437_p2;
    sc_signal< sc_lv<1> > ap_reg_ppstg_exitcond1_reg_657_pp0_iter1;
    sc_signal< sc_lv<10> > indvar_next_fu_443_p2;
    sc_signal< sc_lv<10> > indvar_next_reg_661;
    sc_signal< sc_lv<64> > base_ddr_addr_addr_read_reg_666;
    sc_signal< sc_lv<1> > exitcond_fu_454_p2;
    sc_signal< sc_logic > ap_sig_cseq_ST_pp1_stg0_fsm_13;
    sc_signal< bool > ap_sig_335;
    sc_signal< sc_logic > ap_sig_ioackin_outStream_V_TREADY;
    sc_signal< sc_lv<13> > j_1_fu_460_p2;
    sc_signal< sc_lv<3> > tmp_12_fu_466_p1;
    sc_signal< sc_lv<3> > tmp_12_reg_680;
    sc_signal< sc_lv<7> > tmp_23_fu_564_p2;
    sc_signal< sc_lv<7> > tmp_23_reg_690;
    sc_signal< sc_lv<64> > tmp_26_fu_574_p2;
    sc_signal< sc_lv<64> > tmp_26_reg_695;
    sc_signal< sc_lv<32> > offset_1_fu_599_p2;
    sc_signal< sc_logic > ap_sig_cseq_ST_st19_fsm_14;
    sc_signal< bool > ap_sig_367;
    sc_signal< sc_logic > ap_sig_cseq_ST_st12_fsm_11;
    sc_signal< bool > ap_sig_374;
    sc_signal< sc_lv<9> > buffer_address0;
    sc_signal< sc_logic > buffer_ce0;
    sc_signal< sc_lv<64> > buffer_q0;
    sc_signal< sc_lv<9> > buffer_address1;
    sc_signal< sc_logic > buffer_ce1;
    sc_signal< sc_logic > buffer_we1;
    sc_signal< sc_lv<32> > tmp_1_fu_292_p1;
    sc_signal< sc_lv<32> > tmp_3_phi_fu_233_p4;
    sc_signal< sc_lv<1> > update_intr_read_read_fu_154_p2;
    sc_signal< sc_lv<32> > i_op_assign_reg_239;
    sc_signal< sc_lv<32> > offset1_reg_248;
    sc_signal< sc_lv<32> > i_reg_258;
    sc_signal< sc_lv<10> > indvar_phi_fu_273_p4;
    sc_signal< sc_lv<64> > tmp_10_fu_449_p1;
    sc_signal< sc_lv<64> > gepindex2_cast_fu_480_p1;
    sc_signal< sc_lv<64> > tmp_8_fu_426_p1;
    sc_signal< sc_logic > ap_reg_ioackin_base_ddr_addr_ARREADY;
    sc_signal< sc_logic > ap_reg_ioackin_outStream_V_TREADY;
    sc_signal< sc_lv<1> > tmp_4_fu_344_p2;
    sc_signal< sc_lv<8> > tmp_fu_350_p1;
    sc_signal< sc_lv<8> > t_V_fu_354_p3;
    sc_signal< sc_lv<8> > grp_fu_375_p0;
    sc_signal< sc_lv<32> > grp_fu_375_p1;
    sc_signal< sc_lv<40> > grp_fu_375_p2;
    sc_signal< sc_lv<20> > tmp_6_fu_400_p4;
    sc_signal< sc_lv<32> > tmp_9_fu_410_p1;
    sc_signal< sc_lv<9> > gepindex_cast_fu_470_p4;
    sc_signal< sc_lv<6> > start_pos_fu_485_p3;
    sc_signal< sc_lv<6> > end_pos_fu_492_p2;
    sc_signal< sc_lv<7> > tmp_14_fu_504_p1;
    sc_signal< sc_lv<7> > tmp_15_fu_508_p1;
    sc_signal< sc_lv<1> > tmp_13_fu_498_p2;
    sc_signal< sc_lv<7> > tmp_17_fu_522_p2;
    sc_signal< sc_lv<7> > tmp_19_fu_534_p2;
    sc_signal< sc_lv<64> > tmp_16_fu_512_p4;
    sc_signal< sc_lv<7> > tmp_18_fu_528_p2;
    sc_signal< sc_lv<7> > tmp_20_fu_540_p3;
    sc_signal< sc_lv<7> > tmp_22_fu_556_p3;
    sc_signal< sc_lv<64> > tmp_21_fu_548_p3;
    sc_signal< sc_lv<64> > tmp_24_fu_570_p1;
    sc_signal< sc_lv<64> > tmp_25_fu_580_p1;
    sc_signal< sc_lv<64> > tmp_27_fu_583_p2;
    sc_signal< sc_lv<64> > tmp_28_fu_589_p2;
    sc_signal< sc_lv<15> > ap_NS_fsm;
    sc_signal< sc_lv<40> > grp_fu_375_p00;
    sc_signal< sc_lv<40> > grp_fu_375_p10;
    sc_signal< bool > ap_sig_128;
    sc_signal< bool > ap_sig_116;
    sc_signal< bool > ap_sig_276;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<15> ap_ST_st1_fsm_0;
    static const sc_lv<15> ap_ST_st2_fsm_1;
    static const sc_lv<15> ap_ST_st3_fsm_2;
    static const sc_lv<15> ap_ST_st4_fsm_3;
    static const sc_lv<15> ap_ST_st5_fsm_4;
    static const sc_lv<15> ap_ST_st6_fsm_5;
    static const sc_lv<15> ap_ST_st7_fsm_6;
    static const sc_lv<15> ap_ST_st8_fsm_7;
    static const sc_lv<15> ap_ST_st9_fsm_8;
    static const sc_lv<15> ap_ST_st10_fsm_9;
    static const sc_lv<15> ap_ST_st11_fsm_10;
    static const sc_lv<15> ap_ST_st12_fsm_11;
    static const sc_lv<15> ap_ST_pp0_stg0_fsm_12;
    static const sc_lv<15> ap_ST_pp1_stg0_fsm_13;
    static const sc_lv<15> ap_ST_st19_fsm_14;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<32> ap_const_lv32_5;
    static const sc_lv<32> ap_const_lv32_C;
    static const int C_S_AXI_DATA_WIDTH;
    static const int C_M_AXI_DATA_WIDTH;
    static const int C_M_AXI_BASE_DDR_ADDR_TARGET_ADDR;
    static const int C_M_AXI_BASE_DDR_ADDR_USER_VALUE;
    static const int C_M_AXI_BASE_DDR_ADDR_PROT_VALUE;
    static const int C_M_AXI_BASE_DDR_ADDR_CACHE_VALUE;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<32> ap_const_lv32_D;
    static const sc_lv<32> ap_const_lv32_E;
    static const sc_lv<32> ap_const_lv32_B;
    static const sc_lv<10> ap_const_lv10_0;
    static const sc_lv<13> ap_const_lv13_0;
    static const sc_lv<32> ap_const_lv32_200;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<32> ap_const_lv32_1F;
    static const sc_lv<8> ap_const_lv8_0;
    static const sc_lv<8> ap_const_lv8_FF;
    static const sc_lv<32> ap_const_lv32_22;
    static const sc_lv<32> ap_const_lv32_8000000;
    static const sc_lv<10> ap_const_lv10_200;
    static const sc_lv<10> ap_const_lv10_1;
    static const sc_lv<13> ap_const_lv13_1000;
    static const sc_lv<13> ap_const_lv13_1;
    static const sc_lv<6> ap_const_lv6_7;
    static const sc_lv<32> ap_const_lv32_3F;
    static const sc_lv<7> ap_const_lv7_3F;
    static const sc_lv<64> ap_const_lv64_FFFFFFFFFFFFFFFF;
    static const sc_lv<64> ap_const_lv64_0;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_var_for_const6();
    void thread_ap_var_for_const7();
    void thread_ap_var_for_const1();
    void thread_ap_var_for_const2();
    void thread_ap_var_for_const3();
    void thread_ap_var_for_const4();
    void thread_ap_var_for_const5();
    void thread_ap_var_for_const9();
    void thread_ap_var_for_const8();
    void thread_ap_clk_no_reset_();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_rst_n_inv();
    void thread_ap_sig_116();
    void thread_ap_sig_122();
    void thread_ap_sig_128();
    void thread_ap_sig_134();
    void thread_ap_sig_265();
    void thread_ap_sig_276();
    void thread_ap_sig_287();
    void thread_ap_sig_298();
    void thread_ap_sig_307();
    void thread_ap_sig_32();
    void thread_ap_sig_335();
    void thread_ap_sig_367();
    void thread_ap_sig_374();
    void thread_ap_sig_cseq_ST_pp0_stg0_fsm_12();
    void thread_ap_sig_cseq_ST_pp1_stg0_fsm_13();
    void thread_ap_sig_cseq_ST_st12_fsm_11();
    void thread_ap_sig_cseq_ST_st19_fsm_14();
    void thread_ap_sig_cseq_ST_st1_fsm_0();
    void thread_ap_sig_cseq_ST_st2_fsm_1();
    void thread_ap_sig_cseq_ST_st4_fsm_3();
    void thread_ap_sig_cseq_ST_st5_fsm_4();
    void thread_ap_sig_cseq_ST_st6_fsm_5();
    void thread_ap_sig_ioackin_base_ddr_addr_ARREADY();
    void thread_ap_sig_ioackin_outStream_V_TREADY();
    void thread_base_ddr_addr_ARADDR();
    void thread_base_ddr_addr_ARVALID();
    void thread_base_ddr_addr_RREADY();
    void thread_base_ddr_addr_blk_n_AR();
    void thread_base_ddr_addr_blk_n_R();
    void thread_buffer_address0();
    void thread_buffer_address1();
    void thread_buffer_ce0();
    void thread_buffer_ce1();
    void thread_buffer_we1();
    void thread_end_pos_fu_492_p2();
    void thread_exitcond1_fu_437_p2();
    void thread_exitcond_fu_454_p2();
    void thread_gepindex2_cast_fu_480_p1();
    void thread_gepindex_cast_fu_470_p4();
    void thread_grp_fu_375_p0();
    void thread_grp_fu_375_p00();
    void thread_grp_fu_375_p1();
    void thread_grp_fu_375_p10();
    void thread_i_1_fu_420_p2();
    void thread_indvar_next_fu_443_p2();
    void thread_indvar_phi_fu_273_p4();
    void thread_inner_index_V_1_fu_362_p2();
    void thread_j_1_fu_460_p2();
    void thread_offset_1_fu_599_p2();
    void thread_offset_fu_391_p2();
    void thread_outStream_V_TDATA();
    void thread_outStream_V_TDATA_blk_n();
    void thread_outStream_V_TVALID();
    void thread_start_pos_fu_485_p3();
    void thread_t_V_fu_354_p3();
    void thread_tmp_10_fu_449_p1();
    void thread_tmp_12_fu_466_p1();
    void thread_tmp_13_fu_498_p2();
    void thread_tmp_14_fu_504_p1();
    void thread_tmp_15_fu_508_p1();
    void thread_tmp_16_fu_512_p4();
    void thread_tmp_17_fu_522_p2();
    void thread_tmp_18_fu_528_p2();
    void thread_tmp_19_fu_534_p2();
    void thread_tmp_1_fu_292_p1();
    void thread_tmp_20_fu_540_p3();
    void thread_tmp_21_fu_548_p3();
    void thread_tmp_22_fu_556_p3();
    void thread_tmp_23_fu_564_p2();
    void thread_tmp_24_fu_570_p1();
    void thread_tmp_25_fu_580_p1();
    void thread_tmp_26_fu_574_p2();
    void thread_tmp_27_fu_583_p2();
    void thread_tmp_28_fu_589_p2();
    void thread_tmp_3_phi_fu_233_p4();
    void thread_tmp_4_fu_344_p2();
    void thread_tmp_6_fu_400_p4();
    void thread_tmp_7_fu_414_p2();
    void thread_tmp_8_fu_426_p1();
    void thread_tmp_9_fu_410_p1();
    void thread_tmp_fu_350_p1();
    void thread_update_intr_read_read_fu_154_p2();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
