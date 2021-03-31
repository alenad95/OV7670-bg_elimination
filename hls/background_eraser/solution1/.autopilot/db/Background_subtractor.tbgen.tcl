set moduleName Background_subtractor
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
set C_modelName {Background_subtractor}
set C_modelType { void 0 }
set C_modelArgList {
	{ stream_new_V int 8 regular {axi_s 0 volatile  { stream_new_V Data } }  }
	{ stream_ref_V int 8 regular {axi_s 0 volatile  { stream_ref_V Data } }  }
	{ enable int 1 regular {pointer 0 volatile }  }
	{ threshold_V int 8 regular {pointer 0}  }
	{ pixel_done int 1 regular {pointer 1 volatile }  }
	{ stream_out_V int 8 regular {axi_s 1 volatile  { stream_out_V Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "stream_new_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "stream_new.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 307199,"step" : 1}]}]}]} , 
 	{ "Name" : "stream_ref_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "stream_ref.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 307199,"step" : 1}]}]}]} , 
 	{ "Name" : "enable", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "enable","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "threshold_V", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "threshold.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "pixel_done", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "pixel_done","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "stream_out_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "stream_out.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 307199,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ stream_new_V_TDATA sc_in sc_lv 8 signal 0 } 
	{ stream_new_V_TVALID sc_in sc_logic 1 invld 0 } 
	{ stream_new_V_TREADY sc_out sc_logic 1 inacc 0 } 
	{ stream_ref_V_TDATA sc_in sc_lv 8 signal 1 } 
	{ stream_ref_V_TVALID sc_in sc_logic 1 invld 1 } 
	{ stream_ref_V_TREADY sc_out sc_logic 1 inacc 1 } 
	{ enable sc_in sc_logic 1 signal 2 } 
	{ threshold_V sc_in sc_lv 8 signal 3 } 
	{ pixel_done sc_out sc_logic 1 signal 4 } 
	{ stream_out_V_TDATA sc_out sc_lv 8 signal 5 } 
	{ stream_out_V_TVALID sc_out sc_logic 1 outvld 5 } 
	{ stream_out_V_TREADY sc_in sc_logic 1 outacc 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "stream_new_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "stream_new_V", "role": "TDATA" }} , 
 	{ "name": "stream_new_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stream_new_V", "role": "TVALID" }} , 
 	{ "name": "stream_new_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stream_new_V", "role": "TREADY" }} , 
 	{ "name": "stream_ref_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "stream_ref_V", "role": "TDATA" }} , 
 	{ "name": "stream_ref_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "stream_ref_V", "role": "TVALID" }} , 
 	{ "name": "stream_ref_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "stream_ref_V", "role": "TREADY" }} , 
 	{ "name": "enable", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "enable", "role": "default" }} , 
 	{ "name": "threshold_V", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "threshold_V", "role": "default" }} , 
 	{ "name": "pixel_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixel_done", "role": "default" }} , 
 	{ "name": "stream_out_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "stream_out_V", "role": "TDATA" }} , 
 	{ "name": "stream_out_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "stream_out_V", "role": "TVALID" }} , 
 	{ "name": "stream_out_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "stream_out_V", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Background_subtractor",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "615361", "EstimateLatencyMax" : "615361",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "stream_new_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "stream_new_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_ref_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "stream_ref_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "enable", "Type" : "None", "Direction" : "I"},
			{"Name" : "threshold_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "pixel_done", "Type" : "None", "Direction" : "O"},
			{"Name" : "stream_out_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "stream_out_V_TDATA_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	Background_subtractor {
		stream_new_V {Type I LastRead 2 FirstWrite -1}
		stream_ref_V {Type I LastRead 2 FirstWrite -1}
		enable {Type I LastRead 2 FirstWrite -1}
		threshold_V {Type I LastRead 2 FirstWrite -1}
		pixel_done {Type O LastRead -1 FirstWrite 3}
		stream_out_V {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "615361", "Max" : "615361"}
	, {"Name" : "Interval", "Min" : "615362", "Max" : "615362"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	stream_new_V { axis {  { stream_new_V_TDATA in_data 0 8 }  { stream_new_V_TVALID in_vld 0 1 }  { stream_new_V_TREADY in_acc 1 1 } } }
	stream_ref_V { axis {  { stream_ref_V_TDATA in_data 0 8 }  { stream_ref_V_TVALID in_vld 0 1 }  { stream_ref_V_TREADY in_acc 1 1 } } }
	enable { ap_none {  { enable in_data 0 1 } } }
	threshold_V { ap_none {  { threshold_V in_data 0 8 } } }
	pixel_done { ap_none {  { pixel_done out_data 1 1 } } }
	stream_out_V { axis {  { stream_out_V_TDATA out_data 1 8 }  { stream_out_V_TVALID out_vld 1 1 }  { stream_out_V_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
