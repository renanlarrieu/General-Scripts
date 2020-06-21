# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "high_signal" -parent ${Page_0}
  ipgui::add_param $IPINST -name "low_signal" -parent ${Page_0}


}

proc update_PARAM_VALUE.high_signal { PARAM_VALUE.high_signal } {
	# Procedure called to update high_signal when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.high_signal { PARAM_VALUE.high_signal } {
	# Procedure called to validate high_signal
	return true
}

proc update_PARAM_VALUE.low_signal { PARAM_VALUE.low_signal } {
	# Procedure called to update low_signal when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.low_signal { PARAM_VALUE.low_signal } {
	# Procedure called to validate low_signal
	return true
}


proc update_MODELPARAM_VALUE.high_signal { MODELPARAM_VALUE.high_signal PARAM_VALUE.high_signal } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.high_signal}] ${MODELPARAM_VALUE.high_signal}
}

proc update_MODELPARAM_VALUE.low_signal { MODELPARAM_VALUE.low_signal PARAM_VALUE.low_signal } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.low_signal}] ${MODELPARAM_VALUE.low_signal}
}

