// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Mar  9 11:44:18 2023
// Host        : alex running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/alex/SecurityReconfiguration/dfx_genesys/dfx_genesys.gen/sources_1/ip/ila_rom/ila_rom_stub.v
// Design      : ila_rom
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2022.2" *)
module ila_rom(clk, trig_out, trig_out_ack, probe0, probe1, 
  probe2)
/* synthesis syn_black_box black_box_pad_pin="clk,trig_out,trig_out_ack,probe0[0:0],probe1[0:0],probe2[0:0]" */;
  input clk;
  output trig_out;
  input trig_out_ack;
  input [0:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
endmodule
