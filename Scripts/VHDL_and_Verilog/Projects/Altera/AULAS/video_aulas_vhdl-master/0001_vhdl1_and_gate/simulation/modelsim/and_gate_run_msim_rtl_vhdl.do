transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Renan/Scripts/Altera/video_aulas_vhdl-master/0001_vhdl1_and_gate/and_gate.vhd}

