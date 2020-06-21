#define a porta t22 como led
set_property -dict { PACKAGE_PIN T22 IOSTANDARD LVCMOS33} [get_ports {led}];
#define o botao DIP SW0 como switch
set_property -dict { PACKAGE_PIN F22 IOSTANDARD LVCMOS33} [get_ports {switch}];