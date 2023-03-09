// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Wed Mar  8 23:02:40 2023
// Host        : alex running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/alex/SecurityReconfiguration/dfx_genesys/dfx_genesys.gen/sources_1/ip/ila_axi_mem/ila_axi_mem_stub.v
// Design      : ila_axi_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2022.2" *)
module ila_axi_mem(clk, trig_out, trig_out_ack, probe0, probe1, 
  probe2, probe3, probe4, probe5, probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13)
/* synthesis syn_black_box black_box_pad_pin="clk,trig_out,trig_out_ack,probe0[31:0],probe1[7:0],probe2[2:0],probe3[1:0],probe4[2:0],probe5[3:0],probe6[3:0],probe7[0:0],probe8[0:0],probe9[31:0],probe10[1:0],probe11[0:0],probe12[0:0],probe13[0:0]" */;
  input clk;
  output trig_out;
  input trig_out_ack;
  input [31:0]probe0;
  input [7:0]probe1;
  input [2:0]probe2;
  input [1:0]probe3;
  input [2:0]probe4;
  input [3:0]probe5;
  input [3:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [31:0]probe9;
  input [1:0]probe10;
  input [0:0]probe11;
  input [0:0]probe12;
  input [0:0]probe13;
endmodule