vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../sine_wave_miscircuitos.srcs/sources_1/bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

