set moduleName axis_to_ddr_writer
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {axis_to_ddr_writer}
set C_modelType { void 0 }
set C_modelArgList {
	{ inputStream_V int 8 regular {axi_s 0 volatile  { inputStream_V Data } }  }
	{ base_ddr_addr int 64 regular {axi_master 1}  }
	{ frame_index_V int 8 regular {pointer 1 volatile }  }
	{ frame_count int 32 regular {pointer 1}  }
	{ base_address int 32 regular {axi_slave 0}  }
	{ frame_buffer_dim int 32 regular {axi_slave 0}  }
	{ frame_buffer_offset int 32 regular {axi_slave 0}  }
	{ frame_buffer_number uint 8 regular {axi_slave 0}  }
	{ update_intr uint 1 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "inputStream_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "inputStream.V","cData": "unsigned char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "base_ddr_addr", "interface" : "axi_master", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "base_ddr_addr","cData": "long long unsigned int","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 31,"step" : 1}]}]}]} , 
 	{ "Name" : "frame_index_V", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "frame_index.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "frame_count", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "frame_count","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "base_address", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "base_address","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "frame_buffer_dim", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "frame_buffer_dim","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "frame_buffer_offset", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "frame_buffer_offset","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "frame_buffer_number", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "frame_buffer_number","cData": "unsigned char","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "update_intr", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "update_intr","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"in":48}, "offset_end" : {"in":55}} ]}
# RTL Port declarations: 
set portNum 70
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ inputStream_V_TDATA sc_in sc_lv 8 signal 0 } 
	{ inputStream_V_TVALID sc_in sc_logic 1 invld 0 } 
	{ inputStream_V_TREADY sc_out sc_logic 1 inacc 0 } 
	{ m_axi_base_ddr_addr_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_base_ddr_addr_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_base_ddr_addr_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_base_ddr_addr_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_base_ddr_addr_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_base_ddr_addr_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_base_ddr_addr_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_base_ddr_addr_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_base_ddr_addr_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_base_ddr_addr_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_WDATA sc_out sc_lv 64 signal 1 } 
	{ m_axi_base_ddr_addr_WSTRB sc_out sc_lv 8 signal 1 } 
	{ m_axi_base_ddr_addr_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_base_ddr_addr_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_base_ddr_addr_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_base_ddr_addr_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_base_ddr_addr_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_base_ddr_addr_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_base_ddr_addr_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_base_ddr_addr_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_base_ddr_addr_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_base_ddr_addr_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_RDATA sc_in sc_lv 64 signal 1 } 
	{ m_axi_base_ddr_addr_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_base_ddr_addr_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_base_ddr_addr_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_base_ddr_addr_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_base_ddr_addr_BUSER sc_in sc_lv 1 signal 1 } 
	{ frame_index_V sc_out sc_lv 8 signal 2 } 
	{ frame_count sc_out sc_lv 32 signal 3 } 
	{ s_axi_AXILiteS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_AXILiteS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_AXILiteS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_AXILiteS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_AXILiteS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXILiteS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWADDR" },"address":[{"name":"axis_to_ddr_writer","role":"start","value":"0","valid_bit":"0"},{"name":"axis_to_ddr_writer","role":"continue","value":"0","valid_bit":"4"},{"name":"axis_to_ddr_writer","role":"auto_start","value":"0","valid_bit":"7"},{"name":"base_address","role":"data","value":"16"},{"name":"frame_buffer_dim","role":"data","value":"24"},{"name":"frame_buffer_offset","role":"data","value":"32"},{"name":"frame_buffer_number","role":"data","value":"40"},{"name":"update_intr","role":"data","value":"48"}] },
	{ "name": "s_axi_AXILiteS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWVALID" } },
	{ "name": "s_axi_AXILiteS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWREADY" } },
	{ "name": "s_axi_AXILiteS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WVALID" } },
	{ "name": "s_axi_AXILiteS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WREADY" } },
	{ "name": "s_axi_AXILiteS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WDATA" } },
	{ "name": "s_axi_AXILiteS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WSTRB" } },
	{ "name": "s_axi_AXILiteS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARADDR" },"address":[{"name":"axis_to_ddr_writer","role":"start","value":"0","valid_bit":"0"},{"name":"axis_to_ddr_writer","role":"done","value":"0","valid_bit":"1"},{"name":"axis_to_ddr_writer","role":"idle","value":"0","valid_bit":"2"},{"name":"axis_to_ddr_writer","role":"ready","value":"0","valid_bit":"3"},{"name":"axis_to_ddr_writer","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_AXILiteS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARVALID" } },
	{ "name": "s_axi_AXILiteS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARREADY" } },
	{ "name": "s_axi_AXILiteS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RVALID" } },
	{ "name": "s_axi_AXILiteS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RREADY" } },
	{ "name": "s_axi_AXILiteS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RDATA" } },
	{ "name": "s_axi_AXILiteS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RRESP" } },
	{ "name": "s_axi_AXILiteS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BVALID" } },
	{ "name": "s_axi_AXILiteS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BREADY" } },
	{ "name": "s_axi_AXILiteS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "inputStream_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "inputStream_V", "role": "TDATA" }} , 
 	{ "name": "inputStream_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "inputStream_V", "role": "TVALID" }} , 
 	{ "name": "inputStream_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "inputStream_V", "role": "TREADY" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWVALID" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWREADY" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWADDR" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWID" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWLEN" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWBURST" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWPROT" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWQOS" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWREGION" }} , 
 	{ "name": "m_axi_base_ddr_addr_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "AWUSER" }} , 
 	{ "name": "m_axi_base_ddr_addr_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "WVALID" }} , 
 	{ "name": "m_axi_base_ddr_addr_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "WREADY" }} , 
 	{ "name": "m_axi_base_ddr_addr_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "WDATA" }} , 
 	{ "name": "m_axi_base_ddr_addr_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "WSTRB" }} , 
 	{ "name": "m_axi_base_ddr_addr_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "WLAST" }} , 
 	{ "name": "m_axi_base_ddr_addr_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "WID" }} , 
 	{ "name": "m_axi_base_ddr_addr_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "WUSER" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARVALID" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARREADY" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARADDR" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARID" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARLEN" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARBURST" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARPROT" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARQOS" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARREGION" }} , 
 	{ "name": "m_axi_base_ddr_addr_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "ARUSER" }} , 
 	{ "name": "m_axi_base_ddr_addr_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "RVALID" }} , 
 	{ "name": "m_axi_base_ddr_addr_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "RREADY" }} , 
 	{ "name": "m_axi_base_ddr_addr_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "RDATA" }} , 
 	{ "name": "m_axi_base_ddr_addr_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "RLAST" }} , 
 	{ "name": "m_axi_base_ddr_addr_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "RID" }} , 
 	{ "name": "m_axi_base_ddr_addr_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "RUSER" }} , 
 	{ "name": "m_axi_base_ddr_addr_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "RRESP" }} , 
 	{ "name": "m_axi_base_ddr_addr_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "BVALID" }} , 
 	{ "name": "m_axi_base_ddr_addr_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "BREADY" }} , 
 	{ "name": "m_axi_base_ddr_addr_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "BRESP" }} , 
 	{ "name": "m_axi_base_ddr_addr_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "BID" }} , 
 	{ "name": "m_axi_base_ddr_addr_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "base_ddr_addr", "role": "BUSER" }} , 
 	{ "name": "frame_index_V", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "frame_index_V", "role": "default" }} , 
 	{ "name": "frame_count", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "frame_count", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "axis_to_ddr_writer",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "inputStream_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inputStream_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "base_ddr_addr", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "base_ddr_addr_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "base_ddr_addr_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "base_ddr_addr_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "frame_index_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "frame_count", "Type" : "None", "Direction" : "O"},
			{"Name" : "base_address", "Type" : "None", "Direction" : "I"},
			{"Name" : "frame_buffer_dim", "Type" : "None", "Direction" : "I"},
			{"Name" : "frame_buffer_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "frame_buffer_number", "Type" : "None", "Direction" : "I"},
			{"Name" : "update_intr", "Type" : "None", "Direction" : "I"},
			{"Name" : "inner_index_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "FRAME_BUFFER_DIM_r", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "FRAME_BUFFER_NUMBER_r", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "FRAME_OFFSET", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "BASE_ADDRESS_r", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "frame_count_inner", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.axis_to_ddr_writer_AXILiteS_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.axis_to_ddr_writer_base_ddr_addr_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.buffer_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.axis_to_ddr_writecud_U1", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	axis_to_ddr_writer {
		inputStream_V {Type I LastRead 5 FirstWrite -1}
		base_ddr_addr {Type O LastRead 8 FirstWrite 9}
		frame_index_V {Type O LastRead -1 FirstWrite 0}
		frame_count {Type O LastRead -1 FirstWrite 4}
		base_address {Type I LastRead 0 FirstWrite -1}
		frame_buffer_dim {Type I LastRead 0 FirstWrite -1}
		frame_buffer_offset {Type I LastRead 0 FirstWrite -1}
		frame_buffer_number {Type I LastRead 0 FirstWrite -1}
		update_intr {Type I LastRead 0 FirstWrite -1}
		inner_index_V {Type IO LastRead -1 FirstWrite -1}
		FRAME_BUFFER_DIM_r {Type IO LastRead -1 FirstWrite -1}
		FRAME_BUFFER_NUMBER_r {Type IO LastRead -1 FirstWrite -1}
		FRAME_OFFSET {Type IO LastRead -1 FirstWrite -1}
		BASE_ADDRESS_r {Type IO LastRead -1 FirstWrite -1}
		frame_count_inner {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	inputStream_V { axis {  { inputStream_V_TDATA in_data 0 8 }  { inputStream_V_TVALID in_vld 0 1 }  { inputStream_V_TREADY in_acc 1 1 } } }
	base_ddr_addr { m_axi {  { m_axi_base_ddr_addr_AWVALID VALID 1 1 }  { m_axi_base_ddr_addr_AWREADY READY 0 1 }  { m_axi_base_ddr_addr_AWADDR ADDR 1 32 }  { m_axi_base_ddr_addr_AWID ID 1 1 }  { m_axi_base_ddr_addr_AWLEN LEN 1 8 }  { m_axi_base_ddr_addr_AWSIZE SIZE 1 3 }  { m_axi_base_ddr_addr_AWBURST BURST 1 2 }  { m_axi_base_ddr_addr_AWLOCK LOCK 1 2 }  { m_axi_base_ddr_addr_AWCACHE CACHE 1 4 }  { m_axi_base_ddr_addr_AWPROT PROT 1 3 }  { m_axi_base_ddr_addr_AWQOS QOS 1 4 }  { m_axi_base_ddr_addr_AWREGION REGION 1 4 }  { m_axi_base_ddr_addr_AWUSER USER 1 1 }  { m_axi_base_ddr_addr_WVALID VALID 1 1 }  { m_axi_base_ddr_addr_WREADY READY 0 1 }  { m_axi_base_ddr_addr_WDATA DATA 1 64 }  { m_axi_base_ddr_addr_WSTRB STRB 1 8 }  { m_axi_base_ddr_addr_WLAST LAST 1 1 }  { m_axi_base_ddr_addr_WID ID 1 1 }  { m_axi_base_ddr_addr_WUSER USER 1 1 }  { m_axi_base_ddr_addr_ARVALID VALID 1 1 }  { m_axi_base_ddr_addr_ARREADY READY 0 1 }  { m_axi_base_ddr_addr_ARADDR ADDR 1 32 }  { m_axi_base_ddr_addr_ARID ID 1 1 }  { m_axi_base_ddr_addr_ARLEN LEN 1 8 }  { m_axi_base_ddr_addr_ARSIZE SIZE 1 3 }  { m_axi_base_ddr_addr_ARBURST BURST 1 2 }  { m_axi_base_ddr_addr_ARLOCK LOCK 1 2 }  { m_axi_base_ddr_addr_ARCACHE CACHE 1 4 }  { m_axi_base_ddr_addr_ARPROT PROT 1 3 }  { m_axi_base_ddr_addr_ARQOS QOS 1 4 }  { m_axi_base_ddr_addr_ARREGION REGION 1 4 }  { m_axi_base_ddr_addr_ARUSER USER 1 1 }  { m_axi_base_ddr_addr_RVALID VALID 0 1 }  { m_axi_base_ddr_addr_RREADY READY 1 1 }  { m_axi_base_ddr_addr_RDATA DATA 0 64 }  { m_axi_base_ddr_addr_RLAST LAST 0 1 }  { m_axi_base_ddr_addr_RID ID 0 1 }  { m_axi_base_ddr_addr_RUSER USER 0 1 }  { m_axi_base_ddr_addr_RRESP RESP 0 2 }  { m_axi_base_ddr_addr_BVALID VALID 0 1 }  { m_axi_base_ddr_addr_BREADY READY 1 1 }  { m_axi_base_ddr_addr_BRESP RESP 0 2 }  { m_axi_base_ddr_addr_BID ID 0 1 }  { m_axi_base_ddr_addr_BUSER USER 0 1 } } }
	frame_index_V { ap_none {  { frame_index_V out_data 1 8 } } }
	frame_count { ap_none {  { frame_count out_data 1 32 } } }
}

set busDeadlockParameterList { 
	{ base_ddr_addr { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ base_ddr_addr 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ base_ddr_addr 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
