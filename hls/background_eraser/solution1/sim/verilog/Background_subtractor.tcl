
log_wave -r /
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set stream_out_group [add_wave_group stream_out(axis) -into $coutputgroup]
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/stream_out_V_TREADY -into $stream_out_group -color #ffff00 -radix hex
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/stream_out_V_TVALID -into $stream_out_group -color #ffff00 -radix hex
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/stream_out_V_TDATA -into $stream_out_group -radix hex
set frame_done_group [add_wave_group frame_done(wire) -into $coutputgroup]
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/frame_done_V -into $frame_done_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set enable_group [add_wave_group enable(wire) -into $cinputgroup]
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/enable_V -into $enable_group -radix hex
set stream_in_group [add_wave_group stream_in(axis) -into $cinputgroup]
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/stream_in_V_TREADY -into $stream_in_group -color #ffff00 -radix hex
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/stream_in_V_TVALID -into $stream_in_group -color #ffff00 -radix hex
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/stream_in_V_TDATA -into $stream_in_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/ap_start -into $blocksiggroup
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/ap_done -into $blocksiggroup
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/ap_idle -into $blocksiggroup
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/ap_rst_n -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_Background_subtractor_top/AESL_inst_Background_subtractor/ap_clk -into $clockgroup
set testbenchgroup [add_wave_group "Test Bench Signals"]
set tbinternalsiggroup [add_wave_group "Internal Signals" -into $testbenchgroup]
set tb_simstatus_group [add_wave_group "Simulation Status" -into $tbinternalsiggroup]
set tb_portdepth_group [add_wave_group "Port Depth" -into $tbinternalsiggroup]
add_wave /apatb_Background_subtractor_top/AUTOTB_TRANSACTION_NUM -into $tb_simstatus_group -radix hex
add_wave /apatb_Background_subtractor_top/ready_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_Background_subtractor_top/done_cnt -into $tb_simstatus_group -radix hex
add_wave /apatb_Background_subtractor_top/LENGTH_stream_in_V -into $tb_portdepth_group -radix hex
add_wave /apatb_Background_subtractor_top/LENGTH_enable_V -into $tb_portdepth_group -radix hex
add_wave /apatb_Background_subtractor_top/LENGTH_frame_done_V -into $tb_portdepth_group -radix hex
add_wave /apatb_Background_subtractor_top/LENGTH_stream_out_V -into $tb_portdepth_group -radix hex
set tbcoutputgroup [add_wave_group "C Outputs" -into $testbenchgroup]
set tb_stream_out_group [add_wave_group stream_out(axis) -into $tbcoutputgroup]
add_wave /apatb_Background_subtractor_top/stream_out_V_TREADY -into $tb_stream_out_group -color #ffff00 -radix hex
add_wave /apatb_Background_subtractor_top/stream_out_V_TVALID -into $tb_stream_out_group -color #ffff00 -radix hex
add_wave /apatb_Background_subtractor_top/stream_out_V_TDATA -into $tb_stream_out_group -radix hex
set tb_frame_done_group [add_wave_group frame_done(wire) -into $tbcoutputgroup]
add_wave /apatb_Background_subtractor_top/frame_done_V -into $tb_frame_done_group -radix hex
set tbcinputgroup [add_wave_group "C Inputs" -into $testbenchgroup]
set tb_enable_group [add_wave_group enable(wire) -into $tbcinputgroup]
add_wave /apatb_Background_subtractor_top/enable_V -into $tb_enable_group -radix hex
set tb_stream_in_group [add_wave_group stream_in(axis) -into $tbcinputgroup]
add_wave /apatb_Background_subtractor_top/stream_in_V_TREADY -into $tb_stream_in_group -color #ffff00 -radix hex
add_wave /apatb_Background_subtractor_top/stream_in_V_TVALID -into $tb_stream_in_group -color #ffff00 -radix hex
add_wave /apatb_Background_subtractor_top/stream_in_V_TDATA -into $tb_stream_in_group -radix hex
save_wave_config Background_subtractor.wcfg
run all
quit

