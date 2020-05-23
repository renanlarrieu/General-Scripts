set_property SRC_FILE_INFO {cfile:{C:/Users/Renan/Documents/GitHub/Shared-Scripts/Scripts/VHDL/VHDL PROJECTS/VIVADO/blinking_led_pwm/blinking_led_pwm.srcs/constrs_1/new/CONSTRAINT_TO_BLINK_LED_WITH_CLK.xdc} rfile:../../../blinking_led_pwm.srcs/constrs_1/new/CONSTRAINT_TO_BLINK_LED_WITH_CLK.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN Y9 IOSTANDARD LVCMOS33 } [get_ports {GCLK}];  # "GCLK"
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 4} [get_ports{GCLK}];
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports{LD0}];  # "LD0"
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [get_ports{LD1}];  # "LD1"
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [get_ports{LD2}];  # "LD2"
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [get_ports{LD3}];  # "LD3"
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V22 IOSTANDARD LVCMOS33} [get_ports{LD4}];  # "LD4"
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W22 IOSTANDARD LVCMOS33} [get_ports{LD5}];  # "LD5"
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports{LD6}];  # "LD6"
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports{LD7}];  # "LD7"
