// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Sep 26 12:57:51 2023
// Host        : tom-tom running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/askyvalos/cva6/corev_apu/fpga/ariane_gui.gen/sources_1/ip/dfx_decoupler/dfx_decoupler_stub.v
// Design      : dfx_decoupler
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dfx_decoupler_dfx_decoupler,Vivado 2022.2" *)
module dfx_decoupler(s_dcache_signals_clk_i, 
  rp_dcache_signals_clk_i, s_dcache_signals_rst_ni, rp_dcache_signals_rst_ni, 
  s_dcache_signals_enable_i, rp_dcache_signals_enable_i, s_dcache_signals_flush_i, 
  rp_dcache_signals_flush_i, s_dcache_signals_flush_ack_o, 
  rp_dcache_signals_flush_ack_o, s_dcache_signals_miss_o, rp_dcache_signals_miss_o, 
  s_dcache_signals_wbuffer_empty_o, rp_dcache_signals_wbuffer_empty_o, 
  s_dcache_signals_wbuffer_not_ni_o, rp_dcache_signals_wbuffer_not_ni_o, 
  s_dcache_signals_amo_req_i_req, rp_dcache_signals_amo_req_i_req, 
  s_dcache_signals_amo_req_i_amo_op, rp_dcache_signals_amo_req_i_amo_op, 
  s_dcache_signals_amo_req_i_size, rp_dcache_signals_amo_req_i_size, 
  s_dcache_signals_amo_req_i_operand_a, rp_dcache_signals_amo_req_i_operand_a, 
  s_dcache_signals_amo_req_i_operand_b, rp_dcache_signals_amo_req_i_operand_b, 
  s_dcache_signals_amo_resp_o_ack, rp_dcache_signals_amo_resp_o_ack, 
  s_dcache_signals_amo_resp_o_result, rp_dcache_signals_amo_resp_o_result, 
  s_dcache_signals_req_ports_i_address_index1, 
  rp_dcache_signals_req_ports_i_address_index1, 
  s_dcache_signals_req_ports_i_address_tag1, 
  rp_dcache_signals_req_ports_i_address_tag1, 
  s_dcache_signals_req_ports_i_data_wdata1, 
  rp_dcache_signals_req_ports_i_data_wdata1, 
  s_dcache_signals_req_ports_i_data_wuser1, 
  rp_dcache_signals_req_ports_i_data_wuser1, s_dcache_signals_req_ports_i_data_req1, 
  rp_dcache_signals_req_ports_i_data_req1, s_dcache_signals_req_ports_i_data_we1, 
  rp_dcache_signals_req_ports_i_data_we1, s_dcache_signals_req_ports_i_data_be1, 
  rp_dcache_signals_req_ports_i_data_be1, s_dcache_signals_req_ports_i_data_size1, 
  rp_dcache_signals_req_ports_i_data_size1, s_dcache_signals_req_ports_i_data_id1, 
  rp_dcache_signals_req_ports_i_data_id1, s_dcache_signals_req_ports_i_kill_req1, 
  rp_dcache_signals_req_ports_i_kill_req1, s_dcache_signals_req_ports_i_tag_valid1, 
  rp_dcache_signals_req_ports_i_tag_valid1, s_dcache_signals_req_ports_o_data_gnt1, 
  rp_dcache_signals_req_ports_o_data_gnt1, s_dcache_signals_req_ports_o_data_rvalid1, 
  rp_dcache_signals_req_ports_o_data_rvalid1, s_dcache_signals_req_ports_o_data_rid1, 
  rp_dcache_signals_req_ports_o_data_rid1, s_dcache_signals_req_ports_o_data_rdata1, 
  rp_dcache_signals_req_ports_o_data_rdata1, 
  s_dcache_signals_req_ports_o_data_ruser1, 
  rp_dcache_signals_req_ports_o_data_ruser1, 
  s_dcache_signals_req_ports_i_address_index2, 
  rp_dcache_signals_req_ports_i_address_index2, 
  s_dcache_signals_req_ports_i_address_tag2, 
  rp_dcache_signals_req_ports_i_address_tag2, 
  s_dcache_signals_req_ports_i_data_wdata2, 
  rp_dcache_signals_req_ports_i_data_wdata2, 
  s_dcache_signals_req_ports_i_data_wuser2, 
  rp_dcache_signals_req_ports_i_data_wuser2, s_dcache_signals_req_ports_i_data_req2, 
  rp_dcache_signals_req_ports_i_data_req2, s_dcache_signals_req_ports_i_data_we2, 
  rp_dcache_signals_req_ports_i_data_we2, s_dcache_signals_req_ports_i_data_be2, 
  rp_dcache_signals_req_ports_i_data_be2, s_dcache_signals_req_ports_i_data_size2, 
  rp_dcache_signals_req_ports_i_data_size2, s_dcache_signals_req_ports_i_data_id2, 
  rp_dcache_signals_req_ports_i_data_id2, s_dcache_signals_req_ports_i_kill_req2, 
  rp_dcache_signals_req_ports_i_kill_req2, s_dcache_signals_req_ports_i_tag_valid2, 
  rp_dcache_signals_req_ports_i_tag_valid2, s_dcache_signals_req_ports_o_data_gnt2, 
  rp_dcache_signals_req_ports_o_data_gnt2, s_dcache_signals_req_ports_o_data_rvalid2, 
  rp_dcache_signals_req_ports_o_data_rvalid2, s_dcache_signals_req_ports_o_data_rid2, 
  rp_dcache_signals_req_ports_o_data_rid2, s_dcache_signals_req_ports_o_data_rdata2, 
  rp_dcache_signals_req_ports_o_data_rdata2, 
  s_dcache_signals_req_ports_o_data_ruser2, 
  rp_dcache_signals_req_ports_o_data_ruser2, 
  s_dcache_signals_req_ports_i_address_index3, 
  rp_dcache_signals_req_ports_i_address_index3, 
  s_dcache_signals_req_ports_i_address_tag3, 
  rp_dcache_signals_req_ports_i_address_tag3, 
  s_dcache_signals_req_ports_i_data_wdata3, 
  rp_dcache_signals_req_ports_i_data_wdata3, 
  s_dcache_signals_req_ports_i_data_wuser3, 
  rp_dcache_signals_req_ports_i_data_wuser3, s_dcache_signals_req_ports_i_data_req3, 
  rp_dcache_signals_req_ports_i_data_req3, s_dcache_signals_req_ports_i_data_we3, 
  rp_dcache_signals_req_ports_i_data_we3, s_dcache_signals_req_ports_i_data_be3, 
  rp_dcache_signals_req_ports_i_data_be3, s_dcache_signals_req_ports_i_data_size3, 
  rp_dcache_signals_req_ports_i_data_size3, s_dcache_signals_req_ports_i_data_id3, 
  rp_dcache_signals_req_ports_i_data_id3, s_dcache_signals_req_ports_i_kill_req3, 
  rp_dcache_signals_req_ports_i_kill_req3, s_dcache_signals_req_ports_i_tag_valid3, 
  rp_dcache_signals_req_ports_i_tag_valid3, s_dcache_signals_req_ports_o_data_gnt3, 
  rp_dcache_signals_req_ports_o_data_gnt3, s_dcache_signals_req_ports_o_data_rvalid3, 
  rp_dcache_signals_req_ports_o_data_rvalid3, s_dcache_signals_req_ports_o_data_rid3, 
  rp_dcache_signals_req_ports_o_data_rid3, s_dcache_signals_req_ports_o_data_rdata3, 
  rp_dcache_signals_req_ports_o_data_rdata3, 
  s_dcache_signals_req_ports_o_data_ruser3, 
  rp_dcache_signals_req_ports_o_data_ruser3, s_dcache_signals_miss_vld_bits_o_1, 
  rp_dcache_signals_miss_vld_bits_o_1, s_dcache_signals_miss_vld_bits_o_2, 
  rp_dcache_signals_miss_vld_bits_o_2, s_dcache_signals_miss_vld_bits_o_3, 
  rp_dcache_signals_miss_vld_bits_o_3, s_dcache_signals_mem_rtrn_vld_i, 
  rp_dcache_signals_mem_rtrn_vld_i, s_dcache_signals_mem_rtrn_i_rtype, 
  rp_dcache_signals_mem_rtrn_i_rtype, s_dcache_signals_mem_rtrn_i_data, 
  rp_dcache_signals_mem_rtrn_i_data, s_dcache_signals_mem_rtrn_i_user, 
  rp_dcache_signals_mem_rtrn_i_user, s_dcache_signals_mem_rtrn_i_inv_vld, 
  rp_dcache_signals_mem_rtrn_i_inv_vld, s_dcache_signals_mem_rtrn_i_inv_all, 
  rp_dcache_signals_mem_rtrn_i_inv_all, s_dcache_signals_mem_rtrn_i_inv_idx, 
  rp_dcache_signals_mem_rtrn_i_inv_idx, s_dcache_signals_mem_rtrn_i_inv_way, 
  rp_dcache_signals_mem_rtrn_i_inv_way, s_dcache_signals_mem_rtrn_i_tid, 
  rp_dcache_signals_mem_rtrn_i_tid, s_dcache_signals_mem_data_req_o, 
  rp_dcache_signals_mem_data_req_o, s_dcache_signals_mem_data_ack_i, 
  rp_dcache_signals_mem_data_ack_i, s_dcache_signals_mem_data_o_rtype, 
  rp_dcache_signals_mem_data_o_rtype, s_dcache_signals_mem_data_o_size, 
  rp_dcache_signals_mem_data_o_size, s_dcache_signals_mem_data_o_way, 
  rp_dcache_signals_mem_data_o_way, s_dcache_signals_mem_data_o_paddr, 
  rp_dcache_signals_mem_data_o_paddr, s_dcache_signals_mem_data_o_data, 
  rp_dcache_signals_mem_data_o_data, s_dcache_signals_mem_data_o_user, 
  rp_dcache_signals_mem_data_o_user, s_dcache_signals_mem_data_o_nc, 
  rp_dcache_signals_mem_data_o_nc, s_dcache_signals_mem_data_o_tid, 
  rp_dcache_signals_mem_data_o_tid, s_dcache_signals_mem_data_o_amo_op, 
  rp_dcache_signals_mem_data_o_amo_op, decouple)
/* synthesis syn_black_box black_box_pad_pin="s_dcache_signals_clk_i[0:0],rp_dcache_signals_clk_i[0:0],s_dcache_signals_rst_ni[0:0],rp_dcache_signals_rst_ni[0:0],s_dcache_signals_enable_i[0:0],rp_dcache_signals_enable_i[0:0],s_dcache_signals_flush_i[0:0],rp_dcache_signals_flush_i[0:0],s_dcache_signals_flush_ack_o[0:0],rp_dcache_signals_flush_ack_o[0:0],s_dcache_signals_miss_o[0:0],rp_dcache_signals_miss_o[0:0],s_dcache_signals_wbuffer_empty_o[0:0],rp_dcache_signals_wbuffer_empty_o[0:0],s_dcache_signals_wbuffer_not_ni_o[0:0],rp_dcache_signals_wbuffer_not_ni_o[0:0],s_dcache_signals_amo_req_i_req[0:0],rp_dcache_signals_amo_req_i_req[0:0],s_dcache_signals_amo_req_i_amo_op[3:0],rp_dcache_signals_amo_req_i_amo_op[3:0],s_dcache_signals_amo_req_i_size[1:0],rp_dcache_signals_amo_req_i_size[1:0],s_dcache_signals_amo_req_i_operand_a[63:0],rp_dcache_signals_amo_req_i_operand_a[63:0],s_dcache_signals_amo_req_i_operand_b[63:0],rp_dcache_signals_amo_req_i_operand_b[63:0],s_dcache_signals_amo_resp_o_ack[0:0],rp_dcache_signals_amo_resp_o_ack[0:0],s_dcache_signals_amo_resp_o_result[63:0],rp_dcache_signals_amo_resp_o_result[63:0],s_dcache_signals_req_ports_i_address_index1[11:0],rp_dcache_signals_req_ports_i_address_index1[11:0],s_dcache_signals_req_ports_i_address_tag1[43:0],rp_dcache_signals_req_ports_i_address_tag1[43:0],s_dcache_signals_req_ports_i_data_wdata1[63:0],rp_dcache_signals_req_ports_i_data_wdata1[63:0],s_dcache_signals_req_ports_i_data_wuser1[63:0],rp_dcache_signals_req_ports_i_data_wuser1[63:0],s_dcache_signals_req_ports_i_data_req1[0:0],rp_dcache_signals_req_ports_i_data_req1[0:0],s_dcache_signals_req_ports_i_data_we1[0:0],rp_dcache_signals_req_ports_i_data_we1[0:0],s_dcache_signals_req_ports_i_data_be1[7:0],rp_dcache_signals_req_ports_i_data_be1[7:0],s_dcache_signals_req_ports_i_data_size1[1:0],rp_dcache_signals_req_ports_i_data_size1[1:0],s_dcache_signals_req_ports_i_data_id1[0:0],rp_dcache_signals_req_ports_i_data_id1[0:0],s_dcache_signals_req_ports_i_kill_req1[0:0],rp_dcache_signals_req_ports_i_kill_req1[0:0],s_dcache_signals_req_ports_i_tag_valid1[0:0],rp_dcache_signals_req_ports_i_tag_valid1[0:0],s_dcache_signals_req_ports_o_data_gnt1[0:0],rp_dcache_signals_req_ports_o_data_gnt1[0:0],s_dcache_signals_req_ports_o_data_rvalid1[0:0],rp_dcache_signals_req_ports_o_data_rvalid1[0:0],s_dcache_signals_req_ports_o_data_rid1[0:0],rp_dcache_signals_req_ports_o_data_rid1[0:0],s_dcache_signals_req_ports_o_data_rdata1[63:0],rp_dcache_signals_req_ports_o_data_rdata1[63:0],s_dcache_signals_req_ports_o_data_ruser1[63:0],rp_dcache_signals_req_ports_o_data_ruser1[63:0],s_dcache_signals_req_ports_i_address_index2[11:0],rp_dcache_signals_req_ports_i_address_index2[11:0],s_dcache_signals_req_ports_i_address_tag2[43:0],rp_dcache_signals_req_ports_i_address_tag2[43:0],s_dcache_signals_req_ports_i_data_wdata2[63:0],rp_dcache_signals_req_ports_i_data_wdata2[63:0],s_dcache_signals_req_ports_i_data_wuser2[63:0],rp_dcache_signals_req_ports_i_data_wuser2[63:0],s_dcache_signals_req_ports_i_data_req2[0:0],rp_dcache_signals_req_ports_i_data_req2[0:0],s_dcache_signals_req_ports_i_data_we2[0:0],rp_dcache_signals_req_ports_i_data_we2[0:0],s_dcache_signals_req_ports_i_data_be2[7:0],rp_dcache_signals_req_ports_i_data_be2[7:0],s_dcache_signals_req_ports_i_data_size2[1:0],rp_dcache_signals_req_ports_i_data_size2[1:0],s_dcache_signals_req_ports_i_data_id2[0:0],rp_dcache_signals_req_ports_i_data_id2[0:0],s_dcache_signals_req_ports_i_kill_req2[0:0],rp_dcache_signals_req_ports_i_kill_req2[0:0],s_dcache_signals_req_ports_i_tag_valid2[0:0],rp_dcache_signals_req_ports_i_tag_valid2[0:0],s_dcache_signals_req_ports_o_data_gnt2[0:0],rp_dcache_signals_req_ports_o_data_gnt2[0:0],s_dcache_signals_req_ports_o_data_rvalid2[0:0],rp_dcache_signals_req_ports_o_data_rvalid2[0:0],s_dcache_signals_req_ports_o_data_rid2[0:0],rp_dcache_signals_req_ports_o_data_rid2[0:0],s_dcache_signals_req_ports_o_data_rdata2[63:0],rp_dcache_signals_req_ports_o_data_rdata2[63:0],s_dcache_signals_req_ports_o_data_ruser2[63:0],rp_dcache_signals_req_ports_o_data_ruser2[63:0],s_dcache_signals_req_ports_i_address_index3[11:0],rp_dcache_signals_req_ports_i_address_index3[11:0],s_dcache_signals_req_ports_i_address_tag3[43:0],rp_dcache_signals_req_ports_i_address_tag3[43:0],s_dcache_signals_req_ports_i_data_wdata3[63:0],rp_dcache_signals_req_ports_i_data_wdata3[63:0],s_dcache_signals_req_ports_i_data_wuser3[63:0],rp_dcache_signals_req_ports_i_data_wuser3[63:0],s_dcache_signals_req_ports_i_data_req3[0:0],rp_dcache_signals_req_ports_i_data_req3[0:0],s_dcache_signals_req_ports_i_data_we3[0:0],rp_dcache_signals_req_ports_i_data_we3[0:0],s_dcache_signals_req_ports_i_data_be3[7:0],rp_dcache_signals_req_ports_i_data_be3[7:0],s_dcache_signals_req_ports_i_data_size3[1:0],rp_dcache_signals_req_ports_i_data_size3[1:0],s_dcache_signals_req_ports_i_data_id3[0:0],rp_dcache_signals_req_ports_i_data_id3[0:0],s_dcache_signals_req_ports_i_kill_req3[0:0],rp_dcache_signals_req_ports_i_kill_req3[0:0],s_dcache_signals_req_ports_i_tag_valid3[0:0],rp_dcache_signals_req_ports_i_tag_valid3[0:0],s_dcache_signals_req_ports_o_data_gnt3[0:0],rp_dcache_signals_req_ports_o_data_gnt3[0:0],s_dcache_signals_req_ports_o_data_rvalid3[0:0],rp_dcache_signals_req_ports_o_data_rvalid3[0:0],s_dcache_signals_req_ports_o_data_rid3[0:0],rp_dcache_signals_req_ports_o_data_rid3[0:0],s_dcache_signals_req_ports_o_data_rdata3[63:0],rp_dcache_signals_req_ports_o_data_rdata3[63:0],s_dcache_signals_req_ports_o_data_ruser3[63:0],rp_dcache_signals_req_ports_o_data_ruser3[63:0],s_dcache_signals_miss_vld_bits_o_1[7:0],rp_dcache_signals_miss_vld_bits_o_1[7:0],s_dcache_signals_miss_vld_bits_o_2[7:0],rp_dcache_signals_miss_vld_bits_o_2[7:0],s_dcache_signals_miss_vld_bits_o_3[7:0],rp_dcache_signals_miss_vld_bits_o_3[7:0],s_dcache_signals_mem_rtrn_vld_i[0:0],rp_dcache_signals_mem_rtrn_vld_i[0:0],s_dcache_signals_mem_rtrn_i_rtype[2:0],rp_dcache_signals_mem_rtrn_i_rtype[2:0],s_dcache_signals_mem_rtrn_i_data[127:0],rp_dcache_signals_mem_rtrn_i_data[127:0],s_dcache_signals_mem_rtrn_i_user[127:0],rp_dcache_signals_mem_rtrn_i_user[127:0],s_dcache_signals_mem_rtrn_i_inv_vld[0:0],rp_dcache_signals_mem_rtrn_i_inv_vld[0:0],s_dcache_signals_mem_rtrn_i_inv_all[0:0],rp_dcache_signals_mem_rtrn_i_inv_all[0:0],s_dcache_signals_mem_rtrn_i_inv_idx[11:0],rp_dcache_signals_mem_rtrn_i_inv_idx[11:0],s_dcache_signals_mem_rtrn_i_inv_way[2:0],rp_dcache_signals_mem_rtrn_i_inv_way[2:0],s_dcache_signals_mem_rtrn_i_tid[1:0],rp_dcache_signals_mem_rtrn_i_tid[1:0],s_dcache_signals_mem_data_req_o[0:0],rp_dcache_signals_mem_data_req_o[0:0],s_dcache_signals_mem_data_ack_i[0:0],rp_dcache_signals_mem_data_ack_i[0:0],s_dcache_signals_mem_data_o_rtype[1:0],rp_dcache_signals_mem_data_o_rtype[1:0],s_dcache_signals_mem_data_o_size[2:0],rp_dcache_signals_mem_data_o_size[2:0],s_dcache_signals_mem_data_o_way[2:0],rp_dcache_signals_mem_data_o_way[2:0],s_dcache_signals_mem_data_o_paddr[55:0],rp_dcache_signals_mem_data_o_paddr[55:0],s_dcache_signals_mem_data_o_data[63:0],rp_dcache_signals_mem_data_o_data[63:0],s_dcache_signals_mem_data_o_user[63:0],rp_dcache_signals_mem_data_o_user[63:0],s_dcache_signals_mem_data_o_nc[0:0],rp_dcache_signals_mem_data_o_nc[0:0],s_dcache_signals_mem_data_o_tid[1:0],rp_dcache_signals_mem_data_o_tid[1:0],s_dcache_signals_mem_data_o_amo_op[3:0],rp_dcache_signals_mem_data_o_amo_op[3:0],decouple" */;
  input [0:0]s_dcache_signals_clk_i;
  output [0:0]rp_dcache_signals_clk_i;
  input [0:0]s_dcache_signals_rst_ni;
  output [0:0]rp_dcache_signals_rst_ni;
  input [0:0]s_dcache_signals_enable_i;
  output [0:0]rp_dcache_signals_enable_i;
  input [0:0]s_dcache_signals_flush_i;
  output [0:0]rp_dcache_signals_flush_i;
  output [0:0]s_dcache_signals_flush_ack_o;
  input [0:0]rp_dcache_signals_flush_ack_o;
  output [0:0]s_dcache_signals_miss_o;
  input [0:0]rp_dcache_signals_miss_o;
  output [0:0]s_dcache_signals_wbuffer_empty_o;
  input [0:0]rp_dcache_signals_wbuffer_empty_o;
  output [0:0]s_dcache_signals_wbuffer_not_ni_o;
  input [0:0]rp_dcache_signals_wbuffer_not_ni_o;
  input [0:0]s_dcache_signals_amo_req_i_req;
  output [0:0]rp_dcache_signals_amo_req_i_req;
  input [3:0]s_dcache_signals_amo_req_i_amo_op;
  output [3:0]rp_dcache_signals_amo_req_i_amo_op;
  input [1:0]s_dcache_signals_amo_req_i_size;
  output [1:0]rp_dcache_signals_amo_req_i_size;
  input [63:0]s_dcache_signals_amo_req_i_operand_a;
  output [63:0]rp_dcache_signals_amo_req_i_operand_a;
  input [63:0]s_dcache_signals_amo_req_i_operand_b;
  output [63:0]rp_dcache_signals_amo_req_i_operand_b;
  output [0:0]s_dcache_signals_amo_resp_o_ack;
  input [0:0]rp_dcache_signals_amo_resp_o_ack;
  output [63:0]s_dcache_signals_amo_resp_o_result;
  input [63:0]rp_dcache_signals_amo_resp_o_result;
  input [11:0]s_dcache_signals_req_ports_i_address_index1;
  output [11:0]rp_dcache_signals_req_ports_i_address_index1;
  input [43:0]s_dcache_signals_req_ports_i_address_tag1;
  output [43:0]rp_dcache_signals_req_ports_i_address_tag1;
  input [63:0]s_dcache_signals_req_ports_i_data_wdata1;
  output [63:0]rp_dcache_signals_req_ports_i_data_wdata1;
  input [63:0]s_dcache_signals_req_ports_i_data_wuser1;
  output [63:0]rp_dcache_signals_req_ports_i_data_wuser1;
  input [0:0]s_dcache_signals_req_ports_i_data_req1;
  output [0:0]rp_dcache_signals_req_ports_i_data_req1;
  input [0:0]s_dcache_signals_req_ports_i_data_we1;
  output [0:0]rp_dcache_signals_req_ports_i_data_we1;
  input [7:0]s_dcache_signals_req_ports_i_data_be1;
  output [7:0]rp_dcache_signals_req_ports_i_data_be1;
  input [1:0]s_dcache_signals_req_ports_i_data_size1;
  output [1:0]rp_dcache_signals_req_ports_i_data_size1;
  input [0:0]s_dcache_signals_req_ports_i_data_id1;
  output [0:0]rp_dcache_signals_req_ports_i_data_id1;
  input [0:0]s_dcache_signals_req_ports_i_kill_req1;
  output [0:0]rp_dcache_signals_req_ports_i_kill_req1;
  input [0:0]s_dcache_signals_req_ports_i_tag_valid1;
  output [0:0]rp_dcache_signals_req_ports_i_tag_valid1;
  output [0:0]s_dcache_signals_req_ports_o_data_gnt1;
  input [0:0]rp_dcache_signals_req_ports_o_data_gnt1;
  output [0:0]s_dcache_signals_req_ports_o_data_rvalid1;
  input [0:0]rp_dcache_signals_req_ports_o_data_rvalid1;
  output [0:0]s_dcache_signals_req_ports_o_data_rid1;
  input [0:0]rp_dcache_signals_req_ports_o_data_rid1;
  output [63:0]s_dcache_signals_req_ports_o_data_rdata1;
  input [63:0]rp_dcache_signals_req_ports_o_data_rdata1;
  output [63:0]s_dcache_signals_req_ports_o_data_ruser1;
  input [63:0]rp_dcache_signals_req_ports_o_data_ruser1;
  input [11:0]s_dcache_signals_req_ports_i_address_index2;
  output [11:0]rp_dcache_signals_req_ports_i_address_index2;
  input [43:0]s_dcache_signals_req_ports_i_address_tag2;
  output [43:0]rp_dcache_signals_req_ports_i_address_tag2;
  input [63:0]s_dcache_signals_req_ports_i_data_wdata2;
  output [63:0]rp_dcache_signals_req_ports_i_data_wdata2;
  input [63:0]s_dcache_signals_req_ports_i_data_wuser2;
  output [63:0]rp_dcache_signals_req_ports_i_data_wuser2;
  input [0:0]s_dcache_signals_req_ports_i_data_req2;
  output [0:0]rp_dcache_signals_req_ports_i_data_req2;
  input [0:0]s_dcache_signals_req_ports_i_data_we2;
  output [0:0]rp_dcache_signals_req_ports_i_data_we2;
  input [7:0]s_dcache_signals_req_ports_i_data_be2;
  output [7:0]rp_dcache_signals_req_ports_i_data_be2;
  input [1:0]s_dcache_signals_req_ports_i_data_size2;
  output [1:0]rp_dcache_signals_req_ports_i_data_size2;
  input [0:0]s_dcache_signals_req_ports_i_data_id2;
  output [0:0]rp_dcache_signals_req_ports_i_data_id2;
  input [0:0]s_dcache_signals_req_ports_i_kill_req2;
  output [0:0]rp_dcache_signals_req_ports_i_kill_req2;
  input [0:0]s_dcache_signals_req_ports_i_tag_valid2;
  output [0:0]rp_dcache_signals_req_ports_i_tag_valid2;
  output [0:0]s_dcache_signals_req_ports_o_data_gnt2;
  input [0:0]rp_dcache_signals_req_ports_o_data_gnt2;
  output [0:0]s_dcache_signals_req_ports_o_data_rvalid2;
  input [0:0]rp_dcache_signals_req_ports_o_data_rvalid2;
  output [0:0]s_dcache_signals_req_ports_o_data_rid2;
  input [0:0]rp_dcache_signals_req_ports_o_data_rid2;
  output [63:0]s_dcache_signals_req_ports_o_data_rdata2;
  input [63:0]rp_dcache_signals_req_ports_o_data_rdata2;
  output [63:0]s_dcache_signals_req_ports_o_data_ruser2;
  input [63:0]rp_dcache_signals_req_ports_o_data_ruser2;
  input [11:0]s_dcache_signals_req_ports_i_address_index3;
  output [11:0]rp_dcache_signals_req_ports_i_address_index3;
  input [43:0]s_dcache_signals_req_ports_i_address_tag3;
  output [43:0]rp_dcache_signals_req_ports_i_address_tag3;
  input [63:0]s_dcache_signals_req_ports_i_data_wdata3;
  output [63:0]rp_dcache_signals_req_ports_i_data_wdata3;
  input [63:0]s_dcache_signals_req_ports_i_data_wuser3;
  output [63:0]rp_dcache_signals_req_ports_i_data_wuser3;
  input [0:0]s_dcache_signals_req_ports_i_data_req3;
  output [0:0]rp_dcache_signals_req_ports_i_data_req3;
  input [0:0]s_dcache_signals_req_ports_i_data_we3;
  output [0:0]rp_dcache_signals_req_ports_i_data_we3;
  input [7:0]s_dcache_signals_req_ports_i_data_be3;
  output [7:0]rp_dcache_signals_req_ports_i_data_be3;
  input [1:0]s_dcache_signals_req_ports_i_data_size3;
  output [1:0]rp_dcache_signals_req_ports_i_data_size3;
  input [0:0]s_dcache_signals_req_ports_i_data_id3;
  output [0:0]rp_dcache_signals_req_ports_i_data_id3;
  input [0:0]s_dcache_signals_req_ports_i_kill_req3;
  output [0:0]rp_dcache_signals_req_ports_i_kill_req3;
  input [0:0]s_dcache_signals_req_ports_i_tag_valid3;
  output [0:0]rp_dcache_signals_req_ports_i_tag_valid3;
  output [0:0]s_dcache_signals_req_ports_o_data_gnt3;
  input [0:0]rp_dcache_signals_req_ports_o_data_gnt3;
  output [0:0]s_dcache_signals_req_ports_o_data_rvalid3;
  input [0:0]rp_dcache_signals_req_ports_o_data_rvalid3;
  output [0:0]s_dcache_signals_req_ports_o_data_rid3;
  input [0:0]rp_dcache_signals_req_ports_o_data_rid3;
  output [63:0]s_dcache_signals_req_ports_o_data_rdata3;
  input [63:0]rp_dcache_signals_req_ports_o_data_rdata3;
  output [63:0]s_dcache_signals_req_ports_o_data_ruser3;
  input [63:0]rp_dcache_signals_req_ports_o_data_ruser3;
  output [7:0]s_dcache_signals_miss_vld_bits_o_1;
  input [7:0]rp_dcache_signals_miss_vld_bits_o_1;
  output [7:0]s_dcache_signals_miss_vld_bits_o_2;
  input [7:0]rp_dcache_signals_miss_vld_bits_o_2;
  output [7:0]s_dcache_signals_miss_vld_bits_o_3;
  input [7:0]rp_dcache_signals_miss_vld_bits_o_3;
  input [0:0]s_dcache_signals_mem_rtrn_vld_i;
  output [0:0]rp_dcache_signals_mem_rtrn_vld_i;
  input [2:0]s_dcache_signals_mem_rtrn_i_rtype;
  output [2:0]rp_dcache_signals_mem_rtrn_i_rtype;
  input [127:0]s_dcache_signals_mem_rtrn_i_data;
  output [127:0]rp_dcache_signals_mem_rtrn_i_data;
  input [127:0]s_dcache_signals_mem_rtrn_i_user;
  output [127:0]rp_dcache_signals_mem_rtrn_i_user;
  input [0:0]s_dcache_signals_mem_rtrn_i_inv_vld;
  output [0:0]rp_dcache_signals_mem_rtrn_i_inv_vld;
  input [0:0]s_dcache_signals_mem_rtrn_i_inv_all;
  output [0:0]rp_dcache_signals_mem_rtrn_i_inv_all;
  input [11:0]s_dcache_signals_mem_rtrn_i_inv_idx;
  output [11:0]rp_dcache_signals_mem_rtrn_i_inv_idx;
  input [2:0]s_dcache_signals_mem_rtrn_i_inv_way;
  output [2:0]rp_dcache_signals_mem_rtrn_i_inv_way;
  input [1:0]s_dcache_signals_mem_rtrn_i_tid;
  output [1:0]rp_dcache_signals_mem_rtrn_i_tid;
  output [0:0]s_dcache_signals_mem_data_req_o;
  input [0:0]rp_dcache_signals_mem_data_req_o;
  input [0:0]s_dcache_signals_mem_data_ack_i;
  output [0:0]rp_dcache_signals_mem_data_ack_i;
  output [1:0]s_dcache_signals_mem_data_o_rtype;
  input [1:0]rp_dcache_signals_mem_data_o_rtype;
  output [2:0]s_dcache_signals_mem_data_o_size;
  input [2:0]rp_dcache_signals_mem_data_o_size;
  output [2:0]s_dcache_signals_mem_data_o_way;
  input [2:0]rp_dcache_signals_mem_data_o_way;
  output [55:0]s_dcache_signals_mem_data_o_paddr;
  input [55:0]rp_dcache_signals_mem_data_o_paddr;
  output [63:0]s_dcache_signals_mem_data_o_data;
  input [63:0]rp_dcache_signals_mem_data_o_data;
  output [63:0]s_dcache_signals_mem_data_o_user;
  input [63:0]rp_dcache_signals_mem_data_o_user;
  output [0:0]s_dcache_signals_mem_data_o_nc;
  input [0:0]rp_dcache_signals_mem_data_o_nc;
  output [1:0]s_dcache_signals_mem_data_o_tid;
  input [1:0]rp_dcache_signals_mem_data_o_tid;
  output [3:0]s_dcache_signals_mem_data_o_amo_op;
  input [3:0]rp_dcache_signals_mem_data_o_amo_op;
  input decouple;
endmodule
