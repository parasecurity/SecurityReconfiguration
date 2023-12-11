// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Mon Oct  9 14:52:10 2023
// Host        : tom-tom running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/askyvalos/cva6/corev_apu/fpga/ariane_gui.gen/sources_1/ip/dcache_mem_ila/dcache_mem_ila_stub.v
// Design      : dcache_mem_ila
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2022.2" *)
module dcache_mem_ila(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16, probe17, 
  probe18, probe19, probe20, probe21, probe22, probe23)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[7:0],probe2[7:0],probe3[7:0],probe4[0:0],probe5[2:0],probe6[127:0],probe7[127:0],probe8[0:0],probe9[0:0],probe10[11:0],probe11[2:0],probe12[1:0],probe13[0:0],probe14[0:0],probe15[1:0],probe16[2:0],probe17[2:0],probe18[55:0],probe19[63:0],probe20[63:0],probe21[0:0],probe22[1:0],probe23[3:0]" */;
  input clk;
  input [0:0]probe0;
  input [7:0]probe1;
  input [7:0]probe2;
  input [7:0]probe3;
  input [0:0]probe4;
  input [2:0]probe5;
  input [127:0]probe6;
  input [127:0]probe7;
  input [0:0]probe8;
  input [0:0]probe9;
  input [11:0]probe10;
  input [2:0]probe11;
  input [1:0]probe12;
  input [0:0]probe13;
  input [0:0]probe14;
  input [1:0]probe15;
  input [2:0]probe16;
  input [2:0]probe17;
  input [55:0]probe18;
  input [63:0]probe19;
  input [63:0]probe20;
  input [0:0]probe21;
  input [1:0]probe22;
  input [3:0]probe23;
endmodule
