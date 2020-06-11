set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports CLK]

create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports CLK];

set_property IOSTANDARD LVCMOS33 [get_ports JB[0]] 
set_property IOSTANDARD LVCMOS33 [get_ports JB[1]] 
set_property IOSTANDARD LVCMOS33 [get_ports JB[2]] 
set_property IOSTANDARD LVCMOS33 [get_ports JB[3]] 
set_property IOSTANDARD LVCMOS33 [get_ports JB[4]] 
set_property IOSTANDARD LVCMOS33 [get_ports JB[5]] 
set_property IOSTANDARD LVCMOS33 [get_ports JB[6]] 
set_property IOSTANDARD LVCMOS33 [get_ports JB[7]] 

set_property IOSTANDARD LVCMOS33 [get_ports JA[0]] 
set_property IOSTANDARD LVCMOS33 [get_ports JA[1]] 



set_property PACKAGE_PIN W12 [get_ports JB[0]] 
set_property PACKAGE_PIN W11 [get_ports JB[1]]
set_property PACKAGE_PIN V10 [get_ports JB[2]] 
set_property PACKAGE_PIN W8 [get_ports JB[3]] 
set_property PACKAGE_PIN V12 [get_ports JB[4]] 
set_property PACKAGE_PIN W10 [get_ports JB[5]] 
set_property PACKAGE_PIN V9 [get_ports JB[6]] 
set_property PACKAGE_PIN V8 [get_ports JB[7]]

set_property PACKAGE_PIN Y11 [get_ports JA[0]]
set_property PACKAGE_PIN AA11 [get_ports JA[1]] 
