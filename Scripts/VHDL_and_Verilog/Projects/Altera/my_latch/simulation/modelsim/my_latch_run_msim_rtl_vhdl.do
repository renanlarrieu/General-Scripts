transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Renan/Documents/GitHub/Shared-Scripts/Scripts/Altera/my_latch/my_latch.vhd}

