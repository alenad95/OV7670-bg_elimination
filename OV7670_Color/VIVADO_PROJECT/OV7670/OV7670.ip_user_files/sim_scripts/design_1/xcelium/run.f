-makelib xcelium_lib/xilinx_vip -sv \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "D:/Xilinx/Vivado/2019.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_5 -sv \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/d4a8/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_7 -sv \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/8c62/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/axis_infrastructure_v1_1_0 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axis_data_fifo_v2_0_1 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/e1b1/hdl/axis_data_fifo_v2_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_axis_data_fifo_0_0/sim/design_1_axis_data_fifo_0_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_rst_processing_system7_0_100M_0/sim/design_1_rst_processing_system7_0_100M_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \
  "../../../bd/design_1/ip/design_1_proc_sys_reset_0_1/sim/design_1_proc_sys_reset_0_1.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_axis_data_fifo_1_0/sim/design_1_axis_data_fifo_1_0.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_21 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/9c6e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/1eed/hdl/verilog/axi_stream_to_vga.v" \
  "../../../bd/design_1/ip/design_1_axi_stream_to_vga_0_1/sim/design_1_axi_stream_to_vga_0_1.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_6 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/66e7/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/303d/hdl/verilog/LF_valid_to_AXIS.v" \
  "../../../bd/design_1/ip/design_1_LF_valid_to_AXIS_0_0/sim/design_1_LF_valid_to_AXIS_0_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7417/hdl/verilog/ov7670_interface.v" \
  "../../../bd/design_1/ip/design_1_ov7670_interface_0_1/sim/design_1_ov7670_interface_0_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_axi_gpio_1_0/sim/design_1_axi_gpio_1_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_xlconstant_0_1/sim/design_1_xlconstant_0_1.v" \
-endlib
-makelib xcelium_lib/xlconcat_v2_1_3 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_xlconcat_0_1/sim/design_1_xlconcat_0_1.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/f201/hdl/verilog/axis_to_ddr_writebkb.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/f201/hdl/verilog/axis_to_ddr_writecud.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/f201/hdl/verilog/axis_to_ddr_writer_AXILiteS_s_axi.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/f201/hdl/verilog/axis_to_ddr_writer_base_ddr_addr_m_axi.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/f201/hdl/verilog/axis_to_ddr_writer.v" \
  "../../../bd/design_1/ip/design_1_axis_to_ddr_writer_0_0/sim/design_1_axis_to_ddr_writer_0_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7dfa/hdl/verilog/ddr_to_axis_reader.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7dfa/hdl/verilog/ddr_to_axis_reader_AXILiteS_s_axi.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7dfa/hdl/verilog/ddr_to_axis_reader_base_ddr_addr_m_axi.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7dfa/hdl/verilog/ddr_to_axis_reader_buffer.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7dfa/hdl/verilog/ddr_to_axis_reader_mul_8ns_32ns_40_3.v" \
  "../../../bd/design_1/ip/design_1_ddr_to_axis_reader_0_1/sim/design_1_ddr_to_axis_reader_0_1.v" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/1123/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_reg_fd_v12_0_6 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_6 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_addsub_v3_0_6 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_addsub_v3_0_6 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/cfdd/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_addsub_v12_0_13 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/cbe4/hdl/c_addsub_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_gate_bit_v12_0_6 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7161/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_counter_v3_0_6 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/9ac8/hdl/xbip_counter_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_counter_binary_v12_0_13 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/23f1/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_c_counter_binary_0_0/sim/design_1_c_counter_binary_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/80a8/hdl/verilog/ov7670_LUMA_CHROMA.v" \
  "../../../bd/design_1/ip/design_1_ov7670_LUMA_CHROMA_0_0/sim/design_1_ov7670_LUMA_CHROMA_0_0.v" \
  "../../../bd/design_1/ip/design_1_xlconstant_0_2/sim/design_1_xlconstant_0_2.v" \
  "../../../bd/design_1/ip/design_1_axis_to_ddr_writer_1_0/sim/design_1_axis_to_ddr_writer_1_0.v" \
  "../../../bd/design_1/ip/design_1_axis_to_ddr_writer_2_0/sim/design_1_axis_to_ddr_writer_2_0.v" \
  "../../../bd/design_1/ip/design_1_axis_data_fifo_0_2/sim/design_1_axis_data_fifo_0_2.v" \
  "../../../bd/design_1/ip/design_1_axis_data_fifo_1_2/sim/design_1_axis_data_fifo_1_2.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/2bed/hdl/verilog/ddr_to_axis_reader_SD.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/2bed/hdl/verilog/ddr_to_axis_reader_SD_AXILiteS_s_axi.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/2bed/hdl/verilog/ddr_to_axis_reader_SD_base_ddr_addr_m_axi.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/2bed/hdl/verilog/ddr_to_axis_reader_SD_buffer.v" \
  "../../../bd/design_1/ip/design_1_ddr_to_axis_reader_SD_0_0/sim/design_1_ddr_to_axis_reader_SD_0_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7059/hdl/verilog/mux_sd_ov.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/7059/hdl/verilog/mux_sd_ov_AXILiteS_s_axi.v" \
  "../../../bd/design_1/ip/design_1_mux_sd_ov_1_0/sim/design_1_mux_sd_ov_1_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/a302/hdl/verilog/convolution_filter.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/a302/hdl/verilog/convolution_filter_AXILiteS_s_axi.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/a302/hdl/verilog/convolution_filter_line_buffer_V_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/a302/hdl/verilog/convolution_filter_mul_8s_8ns_16_1.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/a302/hdl/verilog/convolution_filter_sdiv_23s_8s_23_27.v" \
  "../../../bd/design_1/ip/design_1_convolution_filter_0_0/sim/design_1_convolution_filter_0_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_AXILiteS_s_axi.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_line_buffer_V_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_mac_muladd_19s_8s_27s_27_1.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_mac_muladd_19s_8s_27s_28_1.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_mac_muladd_19s_8s_28s_28_1.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_mac_muladd_8s_8ns_16s_17_1.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_mac_muladd_8s_8ns_17s_18_1.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_mul_mul_19s_8s_27_1.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5e59/hdl/verilog/sep_convolution_filter_sdiv_30s_8s_30_34.v" \
  "../../../bd/design_1/ip/design_1_sep_convolution_filter_0_0/sim/design_1_sep_convolution_filter_0_0.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_19 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/4d88/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/1f5a/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_4 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/1f5a/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_18 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/5b9c/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_20 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/ace7/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_xbar_6/sim/design_1_xbar_6.v" \
  "../../../bd/design_1/ip/design_1_xbar_4/sim/design_1_xbar_4.v" \
  "../../../bd/design_1/ip/design_1_xbar_5/sim/design_1_xbar_5.v" \
  "../../../bd/design_1/ip/design_1_xbar_7/sim/design_1_xbar_7.v" \
  "../../../bd/design_1/ip/design_1_stream_aligner_new_f_0_0/sim/design_1_stream_aligner_new_f_0_0.v" \
  "../../../bd/design_1/ip/design_1_pixel_counter_v1_0_0/sim/design_1_pixel_counter_v1_0_0.v" \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/3c3c/hdl/verilog/Background_subtractor.v" \
  "../../../bd/design_1/ip/design_1_Background_subtractor_0_0/sim/design_1_Background_subtractor_0_0.v" \
  "../../../bd/design_1/ip/design_1_xlconstant_0_3/sim/design_1_xlconstant_0_3.v" \
  "../../../bd/design_1/ip/design_1_pixel_counter_v1_0_1/sim/design_1_pixel_counter_v1_0_1.v" \
  "../../../bd/design_1/ip/design_1_xbar_8/sim/design_1_xbar_8.v" \
  "../../../bd/design_1/ip/design_1_ddr_to_axis_reader_0_2/sim/design_1_ddr_to_axis_reader_0_2.v" \
  "../../../bd/design_1/ip/design_1_axis_data_fifo_reader_to_vga_0/sim/design_1_axis_data_fifo_reader_to_vga_0.v" \
  "../../../bd/design_1/ip/design_1_xlconstant_0_4/sim/design_1_xlconstant_0_4.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_19 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/c83a/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
  "../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \
  "../../../bd/design_1/ip/design_1_auto_pc_2/sim/design_1_auto_pc_2.v" \
  "../../../bd/design_1/ip/design_1_auto_pc_3/sim/design_1_auto_pc_3.v" \
  "../../../bd/design_1/ip/design_1_auto_pc_4/sim/design_1_auto_pc_4.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_18 \
  "../../../../OV7670.srcs/sources_1/bd/design_1/ipshared/ac9d/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_auto_cc_0/sim/design_1_auto_cc_0.v" \
  "../../../bd/design_1/sim/design_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

