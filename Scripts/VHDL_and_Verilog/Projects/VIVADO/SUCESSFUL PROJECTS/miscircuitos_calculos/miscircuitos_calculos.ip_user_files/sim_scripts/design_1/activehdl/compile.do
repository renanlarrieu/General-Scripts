vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../miscircuitos_calculos.srcs/sources_1/bd/design_1/sim/design_1.v" \


vlog -work xil_defaultlib \
"glbl.v"

