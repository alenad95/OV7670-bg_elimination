// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:Background_subtractor:1.0
// IP Revision: 2103100840

(* X_CORE_INFO = "Background_subtractor,Vivado 2019.1" *)
(* CHECK_LICENSE_TYPE = "design_1_Background_subtractor_0_0,Background_subtractor,{}" *)
(* CORE_GENERATION_INFO = "design_1_Background_subtractor_0_0,Background_subtractor,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=Background_subtractor,x_ipVersion=1.0,x_ipCoreRevision=2103100840,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_Background_subtractor_0_0 (
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  stream_new_V_TVALID,
  stream_new_V_TREADY,
  stream_new_V_TDATA,
  stream_ref_V_TVALID,
  stream_ref_V_TREADY,
  stream_ref_V_TDATA,
  enable,
  threshold_V,
  pixel_done,
  stream_out_V_TVALID,
  stream_out_V_TREADY,
  stream_out_V_TDATA
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF stream_new_V:stream_ref_V:stream_out_V, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 24000000, PHASE 0.000, CLK_DOMAIN design_1_PCLK, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_new_V TVALID" *)
input wire stream_new_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_new_V TREADY" *)
output wire stream_new_V_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stream_new_V, TDATA_NUM_BYTES 1, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 24000000, PHASE 0.000, CLK_DOMAIN design_1_PCLK, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_new_V TDATA" *)
input wire [7 : 0] stream_new_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_ref_V TVALID" *)
input wire stream_ref_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_ref_V TREADY" *)
output wire stream_ref_V_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stream_ref_V, TDATA_NUM_BYTES 1, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 24000000, PHASE 0.000, CLK_DOMAIN design_1_PCLK, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_ref_V TDATA" *)
input wire [7 : 0] stream_ref_V_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME enable, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 enable DATA" *)
input wire enable;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME threshold_V, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 threshold_V DATA" *)
input wire [7 : 0] threshold_V;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pixel_done, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pixel_done DATA" *)
output wire pixel_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_V TVALID" *)
output wire stream_out_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_V TREADY" *)
input wire stream_out_V_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stream_out_V, TDATA_NUM_BYTES 1, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 24000000, PHASE 0.000, CLK_DOMAIN design_1_PCLK, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_V TDATA" *)
output wire [7 : 0] stream_out_V_TDATA;

  Background_subtractor inst (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .stream_new_V_TVALID(stream_new_V_TVALID),
    .stream_new_V_TREADY(stream_new_V_TREADY),
    .stream_new_V_TDATA(stream_new_V_TDATA),
    .stream_ref_V_TVALID(stream_ref_V_TVALID),
    .stream_ref_V_TREADY(stream_ref_V_TREADY),
    .stream_ref_V_TDATA(stream_ref_V_TDATA),
    .enable(enable),
    .threshold_V(threshold_V),
    .pixel_done(pixel_done),
    .stream_out_V_TVALID(stream_out_V_TVALID),
    .stream_out_V_TREADY(stream_out_V_TREADY),
    .stream_out_V_TDATA(stream_out_V_TDATA)
  );
endmodule
