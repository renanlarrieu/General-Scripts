set_property SRC_FILE_INFO {cfile:{C:/Users/Renan/Documents/GitHub/Shared-Scripts/Scripts/VHDL/VHDL PROJECTS/VIVADO/blinking_led_pwm/blinking_led_pwm.srcs/constrs_1/new/CONSTRAINT_TO_BLINK_LED_WITH_CLK.xdc} rfile:../../../blinking_led_pwm.srcs/constrs_1/new/CONSTRAINT_TO_BLINK_LED_WITH_CLK.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property  PACKAGE_PIN Y9 [get_ports {clk}];  # "GCLK"
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 4} [get_ports{clk}];
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [led [0]];  # "LD0"
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T21 IOSTANDARD LVCMOS33} [led [1]];  # "LD1"
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U22 IOSTANDARD LVCMOS33} [led [2]];  # "LD2"
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U21 IOSTANDARD LVCMOS33} [led [3]];  # "LD3"
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V22 IOSTANDARD LVCMOS33} [led [4]];  # "LD4"
set_property src_info {type:XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W22 IOSTANDARD LVCMOS33} [led [5]];  # "LD5"
set_property src_info {type:XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [led [6]];  # "LD6"
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [led [7]];  # "LD7"
