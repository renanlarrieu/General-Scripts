
##clock
set_property -dict {PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports GCLK]



#set_property  PACKAGE_PIN Y9 [get_ports {clk}];  # "GCLK"

#set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports {clk}];

#set_property -dict { PACKAGE_PIN Y9 IOSTANDARD LVCMOS33} [get_ports {clk}];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 4} [get_ports{GCLK}];

set_property -dict { PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports{LD0}];  # "LD0"
set_property -dict { PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports{LD1}];  # "LD1"
set_property -dict { PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports{LD2}];  # "LD2"
set_property -dict { PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports{LD3}];  # "LD3"
set_property -dict { PACKAGE_PIN V22 IOSTANDARD LVCMOS33} [get_ports{LD4}];  # "LD4"
set_property -dict { PACKAGE_PIN W22 IOSTANDARD LVCMOS33} [get_ports{LD5}];  # "LD5"
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports{LD6}];  # "LD6"
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports{LD7}];  # "LD7"




set_property IOSTANDARD LVCMOS33 [get_ports LD0]
set_property IOSTANDARD LVCMOS33 [get_ports LD1]
set_property IOSTANDARD LVCMOS33 [get_ports LD2]
set_property IOSTANDARD LVCMOS33 [get_ports LD3]
set_property IOSTANDARD LVCMOS33 [get_ports LD4]
set_property IOSTANDARD LVCMOS33 [get_ports LD5]
set_property IOSTANDARD LVCMOS33 [get_ports LD6]
set_property IOSTANDARD LVCMOS33 [get_ports LD7]
set_property PACKAGE_PIN T22 [get_ports LD0]
set_property PACKAGE_PIN T21 [get_ports LD1]
set_property PACKAGE_PIN U22 [get_ports LD2]
set_property PACKAGE_PIN U21 [get_ports LD3]
set_property PACKAGE_PIN V22 [get_ports LD4]
set_property PACKAGE_PIN W22 [get_ports LD5]
set_property PACKAGE_PIN U19 [get_ports LD6]
set_property PACKAGE_PIN U14 [get_ports LD7]
