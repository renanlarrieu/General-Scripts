set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports CLK]

create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports CLK];

set_property IOSTANDARD LVCMOS33 [get_ports JB[0]] 

