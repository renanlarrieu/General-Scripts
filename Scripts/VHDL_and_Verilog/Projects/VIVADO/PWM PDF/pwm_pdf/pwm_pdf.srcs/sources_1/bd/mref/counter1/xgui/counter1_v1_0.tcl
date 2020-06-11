# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "cnt_value_g" -parent ${Page_0}
  ipgui::add_param $IPINST -name "depth_g" -parent ${Page_0}


}

proc update_PARAM_VALUE.cnt_value_g { PARAM_VALUE.cnt_value_g } {
	# Procedure called to update cnt_value_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.cnt_value_g { PARAM_VALUE.cnt_value_g } {
	# Procedure called to validate cnt_value_g
	return true
}

proc update_PARAM_VALUE.depth_g { PARAM_VALUE.depth_g } {
	# Procedure called to update depth_g when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.depth_g { PARAM_VALUE.depth_g } {
	# Procedure called to validate depth_g
	return true
}


proc update_MODELPARAM_VALUE.cnt_value_g { MODELPARAM_VALUE.cnt_value_g PARAM_VALUE.cnt_value_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.cnt_value_g}] ${MODELPARAM_VALUE.cnt_value_g}
}

proc update_MODELPARAM_VALUE.depth_g { MODELPARAM_VALUE.depth_g PARAM_VALUE.depth_g } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.depth_g}] ${MODELPARAM_VALUE.depth_g}
}

