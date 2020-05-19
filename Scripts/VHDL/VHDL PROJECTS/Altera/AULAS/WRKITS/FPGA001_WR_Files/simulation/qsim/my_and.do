onerror {quit -f}
vlib work
vlog -work work my_and.vo
vlog -work work my_and.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.my_and_vlg_vec_tst
vcd file -direction my_and.msim.vcd
vcd add -internal my_and_vlg_vec_tst/*
vcd add -internal my_and_vlg_vec_tst/i1/*
add wave /*
run -all
