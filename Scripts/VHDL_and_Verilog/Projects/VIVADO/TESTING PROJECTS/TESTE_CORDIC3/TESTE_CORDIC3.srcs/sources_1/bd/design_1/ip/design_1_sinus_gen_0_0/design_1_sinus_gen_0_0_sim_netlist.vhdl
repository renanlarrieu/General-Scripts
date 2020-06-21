-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu May 28 00:13:39 2020
-- Host        : Renan-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               {c:/Users/Renan/Documents/GitHub/Shared-Scripts/Scripts/VHDL_VERILOG/VHDL_VERILOG PROJECTS/VIVADO/TESTING
--               PROJECTS/TESTE_CORDIC3/TESTE_CORDIC3.srcs/sources_1/bd/design_1/ip/design_1_sinus_gen_0_0/design_1_sinus_gen_0_0_sim_netlist.vhdl}
-- Design      : design_1_sinus_gen_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx485tffg1157-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_sinus_gen_0_0 is
  port (
    clk : in STD_LOGIC;
    sinus : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_sinus_gen_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_sinus_gen_0_0 : entity is "design_1_sinus_gen_0_0,sinus_gen,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_sinus_gen_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_sinus_gen_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_sinus_gen_0_0 : entity is "sinus_gen,Vivado 2018.3";
end design_1_sinus_gen_0_0;

architecture STRUCTURE of design_1_sinus_gen_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_sim_clk_gen_0_0_clk, INSERT_VIP 0";
begin
  sinus(15) <= \<const0>\;
  sinus(14) <= \<const0>\;
  sinus(13) <= \<const0>\;
  sinus(12) <= \<const0>\;
  sinus(11) <= \<const0>\;
  sinus(10) <= \<const0>\;
  sinus(9) <= \<const0>\;
  sinus(8) <= \<const0>\;
  sinus(7) <= \<const0>\;
  sinus(6) <= \<const0>\;
  sinus(5) <= \<const0>\;
  sinus(4) <= \<const0>\;
  sinus(3) <= \<const0>\;
  sinus(2) <= \<const0>\;
  sinus(1) <= \<const0>\;
  sinus(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;
