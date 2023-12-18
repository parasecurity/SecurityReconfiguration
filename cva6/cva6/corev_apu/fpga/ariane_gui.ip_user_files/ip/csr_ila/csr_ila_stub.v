// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Dec 12 11:56:26 2023
// Host        : tom-tom running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/askyvalos/test/SecurityReconfiguration/cva6/cva6/corev_apu/fpga/ariane_gui.gen/sources_1/ip/csr_ila/csr_ila_stub.v
// Design      : csr_ila
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2022.2" *)
module csr_ila(clk, probe0, probe1, probe2, probe3, probe4)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[11:0],probe1[63:0],probe2[0:0],probe3[31:0],probe4[31:0]" */;
  input clk;
  input [11:0]probe0;
  input [63:0]probe1;
  input [0:0]probe2;
  input [31:0]probe3;
  input [31:0]probe4;
endmodule
