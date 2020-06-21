# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "alto" -parent ${Page_0}
  ipgui::add_param $IPINST -name "baixo" -parent ${Page_0}


}

proc update_PARAM_VALUE.alto { PARAM_VALUE.alto } {
	# Procedure called to update alto when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.alto { PARAM_VALUE.alto } {
	# Procedure called to validate alto
	return true
}

proc update_PARAM_VALUE.baixo { PARAM_VALUE.baixo } {
	# Procedure called to update baixo when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.baixo { PARAM_VALUE.baixo } {
	# Procedure called to validate baixo
	return true
}


proc update_MODELPARAM_VALUE.alto { MODELPARAM_VALUE.alto PARAM_VALUE.alto } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.alto}] ${MODELPARAM_VALUE.alto}
}

proc update_MODELPARAM_VALUE.baixo { MODELPARAM_VALUE.baixo PARAM_VALUE.baixo } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.baixo}] ${MODELPARAM_VALUE.baixo}
}

