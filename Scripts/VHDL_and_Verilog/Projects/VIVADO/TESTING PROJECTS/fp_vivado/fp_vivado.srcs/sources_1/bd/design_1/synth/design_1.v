//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Mon Jun  8 17:17:01 2020
//Host        : Renan-PC running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   ();

  wire LOGIC_SOURCE_0_HIGH;
  wire sim_clk_gen_0_clk;
  wire [31:0]xlconstant_0_dout;

  design_1_floating_point_0_0 floating_point_0
       (.aclk(sim_clk_gen_0_clk),
        .m_axis_result_tready(1'b1),
        .s_axis_a_tdata(xlconstant_0_dout),
        .s_axis_a_tvalid(LOGIC_SOURCE_0_HIGH),
        .s_axis_b_tdata(xlconstant_0_dout),
        .s_axis_b_tvalid(LOGIC_SOURCE_0_HIGH));
  design_1_sim_clk_gen_0_0 sim_clk_gen_0
       (.clk(sim_clk_gen_0_clk));
  design_1_sim_clk_gen_1_0 sim_clk_gen_1
       (.clk(LOGIC_SOURCE_0_HIGH));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
