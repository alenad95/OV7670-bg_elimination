# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "idle" -parent ${Page_0}
  ipgui::add_param $IPINST -name "synchronized" -parent ${Page_0}
  ipgui::add_param $IPINST -name "wait_for_sync" -parent ${Page_0}


}

proc update_PARAM_VALUE.idle { PARAM_VALUE.idle } {
	# Procedure called to update idle when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.idle { PARAM_VALUE.idle } {
	# Procedure called to validate idle
	return true
}

proc update_PARAM_VALUE.synchronized { PARAM_VALUE.synchronized } {
	# Procedure called to update synchronized when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.synchronized { PARAM_VALUE.synchronized } {
	# Procedure called to validate synchronized
	return true
}

proc update_PARAM_VALUE.wait_for_sync { PARAM_VALUE.wait_for_sync } {
	# Procedure called to update wait_for_sync when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.wait_for_sync { PARAM_VALUE.wait_for_sync } {
	# Procedure called to validate wait_for_sync
	return true
}


proc update_MODELPARAM_VALUE.idle { MODELPARAM_VALUE.idle PARAM_VALUE.idle } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.idle}] ${MODELPARAM_VALUE.idle}
}

proc update_MODELPARAM_VALUE.wait_for_sync { MODELPARAM_VALUE.wait_for_sync PARAM_VALUE.wait_for_sync } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.wait_for_sync}] ${MODELPARAM_VALUE.wait_for_sync}
}

proc update_MODELPARAM_VALUE.synchronized { MODELPARAM_VALUE.synchronized PARAM_VALUE.synchronized } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.synchronized}] ${MODELPARAM_VALUE.synchronized}
}

