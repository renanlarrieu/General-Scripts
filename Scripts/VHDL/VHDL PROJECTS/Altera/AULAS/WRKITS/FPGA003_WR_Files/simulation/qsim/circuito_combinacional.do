onerror {quit -f}
vlib work
vlog -work work circuito_combinacional.vo
vlog -work work circuito_combinacional.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.circuito_combinacional_vlg_vec_tst
vcd file -direction circuito_combinacional.msim.vcd
vcd add -internal circuito_combinacional_vlg_vec_tst/*
vcd add -internal circuito_combinacional_vlg_vec_tst/i1/*
add wave /*
run -all
