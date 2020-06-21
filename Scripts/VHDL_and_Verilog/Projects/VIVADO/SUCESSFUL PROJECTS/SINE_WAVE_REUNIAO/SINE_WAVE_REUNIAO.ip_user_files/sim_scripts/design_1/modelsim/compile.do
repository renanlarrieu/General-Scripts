vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/sim_clk_gen_v1_0_2

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap sim_clk_gen_v1_0_2 modelsim_lib/msim/sim_clk_gen_v1_0_2

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ip/design_1_SinGenerator_0_0/sim/design_1_SinGenerator_0_0.v" \

vlog -work sim_clk_gen_v1_0_2 -64 -incr \
"../../../../SINE_WAVE_REUNIAO.srcs/sources_1/bd/design_1/ipshared/d987/hdl/sim_clk_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/design_1/ip/design_1_sim_clk_gen_0_0/sim/design_1_sim_clk_gen_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

