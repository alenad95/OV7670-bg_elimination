
set PATH=
call D:/Vivado/Vivado/2019.1/bin/xelab xil_defaultlib.apatb_Background_subtractor_top glbl -prj Background_subtractor.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm --initfile "D:/Vivado/Vivado/2019.1/data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s Background_subtractor -debug wave
call D:/Vivado/Vivado/2019.1/bin/xsim --noieeewarnings Background_subtractor -tclbatch Background_subtractor.tcl

