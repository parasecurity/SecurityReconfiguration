// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: xilinx.com:ip:dfx_decoupler:1.0
// IP Revision: 5

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
dfx_decoupler your_instance_name (
  .s_dcache_signals_clk_i(s_dcache_signals_clk_i),                                              // input wire [0 : 0] s_dcache_signals_clk_i
  .rp_dcache_signals_clk_i(rp_dcache_signals_clk_i),                                            // output wire [0 : 0] rp_dcache_signals_clk_i
  .s_dcache_signals_rst_ni(s_dcache_signals_rst_ni),                                            // input wire [0 : 0] s_dcache_signals_rst_ni
  .rp_dcache_signals_rst_ni(rp_dcache_signals_rst_ni),                                          // output wire [0 : 0] rp_dcache_signals_rst_ni
  .s_dcache_signals_enable_i(s_dcache_signals_enable_i),                                        // input wire [0 : 0] s_dcache_signals_enable_i
  .rp_dcache_signals_enable_i(rp_dcache_signals_enable_i),                                      // output wire [0 : 0] rp_dcache_signals_enable_i
  .s_dcache_signals_flush_i(s_dcache_signals_flush_i),                                          // input wire [0 : 0] s_dcache_signals_flush_i
  .rp_dcache_signals_flush_i(rp_dcache_signals_flush_i),                                        // output wire [0 : 0] rp_dcache_signals_flush_i
  .s_dcache_signals_flush_ack_o(s_dcache_signals_flush_ack_o),                                  // output wire [0 : 0] s_dcache_signals_flush_ack_o
  .rp_dcache_signals_flush_ack_o(rp_dcache_signals_flush_ack_o),                                // input wire [0 : 0] rp_dcache_signals_flush_ack_o
  .s_dcache_signals_miss_o(s_dcache_signals_miss_o),                                            // output wire [0 : 0] s_dcache_signals_miss_o
  .rp_dcache_signals_miss_o(rp_dcache_signals_miss_o),                                          // input wire [0 : 0] rp_dcache_signals_miss_o
  .s_dcache_signals_wbuffer_empty_o(s_dcache_signals_wbuffer_empty_o),                          // output wire [0 : 0] s_dcache_signals_wbuffer_empty_o
  .rp_dcache_signals_wbuffer_empty_o(rp_dcache_signals_wbuffer_empty_o),                        // input wire [0 : 0] rp_dcache_signals_wbuffer_empty_o
  .s_dcache_signals_wbuffer_not_ni_o(s_dcache_signals_wbuffer_not_ni_o),                        // output wire [0 : 0] s_dcache_signals_wbuffer_not_ni_o
  .rp_dcache_signals_wbuffer_not_ni_o(rp_dcache_signals_wbuffer_not_ni_o),                      // input wire [0 : 0] rp_dcache_signals_wbuffer_not_ni_o
  .s_dcache_signals_amo_req_i_req(s_dcache_signals_amo_req_i_req),                              // input wire [0 : 0] s_dcache_signals_amo_req_i_req
  .rp_dcache_signals_amo_req_i_req(rp_dcache_signals_amo_req_i_req),                            // output wire [0 : 0] rp_dcache_signals_amo_req_i_req
  .s_dcache_signals_amo_req_i_amo_op(s_dcache_signals_amo_req_i_amo_op),                        // input wire [3 : 0] s_dcache_signals_amo_req_i_amo_op
  .rp_dcache_signals_amo_req_i_amo_op(rp_dcache_signals_amo_req_i_amo_op),                      // output wire [3 : 0] rp_dcache_signals_amo_req_i_amo_op
  .s_dcache_signals_amo_req_i_size(s_dcache_signals_amo_req_i_size),                            // input wire [1 : 0] s_dcache_signals_amo_req_i_size
  .rp_dcache_signals_amo_req_i_size(rp_dcache_signals_amo_req_i_size),                          // output wire [1 : 0] rp_dcache_signals_amo_req_i_size
  .s_dcache_signals_amo_req_i_operand_a(s_dcache_signals_amo_req_i_operand_a),                  // input wire [63 : 0] s_dcache_signals_amo_req_i_operand_a
  .rp_dcache_signals_amo_req_i_operand_a(rp_dcache_signals_amo_req_i_operand_a),                // output wire [63 : 0] rp_dcache_signals_amo_req_i_operand_a
  .s_dcache_signals_amo_req_i_operand_b(s_dcache_signals_amo_req_i_operand_b),                  // input wire [63 : 0] s_dcache_signals_amo_req_i_operand_b
  .rp_dcache_signals_amo_req_i_operand_b(rp_dcache_signals_amo_req_i_operand_b),                // output wire [63 : 0] rp_dcache_signals_amo_req_i_operand_b
  .s_dcache_signals_amo_resp_o_ack(s_dcache_signals_amo_resp_o_ack),                            // output wire [0 : 0] s_dcache_signals_amo_resp_o_ack
  .rp_dcache_signals_amo_resp_o_ack(rp_dcache_signals_amo_resp_o_ack),                          // input wire [0 : 0] rp_dcache_signals_amo_resp_o_ack
  .s_dcache_signals_amo_resp_o_result(s_dcache_signals_amo_resp_o_result),                      // output wire [63 : 0] s_dcache_signals_amo_resp_o_result
  .rp_dcache_signals_amo_resp_o_result(rp_dcache_signals_amo_resp_o_result),                    // input wire [63 : 0] rp_dcache_signals_amo_resp_o_result
  .s_dcache_signals_req_ports_i_address_index1(s_dcache_signals_req_ports_i_address_index1),    // input wire [11 : 0] s_dcache_signals_req_ports_i_address_index1
  .rp_dcache_signals_req_ports_i_address_index1(rp_dcache_signals_req_ports_i_address_index1),  // output wire [11 : 0] rp_dcache_signals_req_ports_i_address_index1
  .s_dcache_signals_req_ports_i_address_tag1(s_dcache_signals_req_ports_i_address_tag1),        // input wire [43 : 0] s_dcache_signals_req_ports_i_address_tag1
  .rp_dcache_signals_req_ports_i_address_tag1(rp_dcache_signals_req_ports_i_address_tag1),      // output wire [43 : 0] rp_dcache_signals_req_ports_i_address_tag1
  .s_dcache_signals_req_ports_i_data_wdata1(s_dcache_signals_req_ports_i_data_wdata1),          // input wire [63 : 0] s_dcache_signals_req_ports_i_data_wdata1
  .rp_dcache_signals_req_ports_i_data_wdata1(rp_dcache_signals_req_ports_i_data_wdata1),        // output wire [63 : 0] rp_dcache_signals_req_ports_i_data_wdata1
  .s_dcache_signals_req_ports_i_data_wuser1(s_dcache_signals_req_ports_i_data_wuser1),          // input wire [63 : 0] s_dcache_signals_req_ports_i_data_wuser1
  .rp_dcache_signals_req_ports_i_data_wuser1(rp_dcache_signals_req_ports_i_data_wuser1),        // output wire [63 : 0] rp_dcache_signals_req_ports_i_data_wuser1
  .s_dcache_signals_req_ports_i_data_req1(s_dcache_signals_req_ports_i_data_req1),              // input wire [0 : 0] s_dcache_signals_req_ports_i_data_req1
  .rp_dcache_signals_req_ports_i_data_req1(rp_dcache_signals_req_ports_i_data_req1),            // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_req1
  .s_dcache_signals_req_ports_i_data_we1(s_dcache_signals_req_ports_i_data_we1),                // input wire [0 : 0] s_dcache_signals_req_ports_i_data_we1
  .rp_dcache_signals_req_ports_i_data_we1(rp_dcache_signals_req_ports_i_data_we1),              // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_we1
  .s_dcache_signals_req_ports_i_data_be1(s_dcache_signals_req_ports_i_data_be1),                // input wire [7 : 0] s_dcache_signals_req_ports_i_data_be1
  .rp_dcache_signals_req_ports_i_data_be1(rp_dcache_signals_req_ports_i_data_be1),              // output wire [7 : 0] rp_dcache_signals_req_ports_i_data_be1
  .s_dcache_signals_req_ports_i_data_size1(s_dcache_signals_req_ports_i_data_size1),            // input wire [1 : 0] s_dcache_signals_req_ports_i_data_size1
  .rp_dcache_signals_req_ports_i_data_size1(rp_dcache_signals_req_ports_i_data_size1),          // output wire [1 : 0] rp_dcache_signals_req_ports_i_data_size1
  .s_dcache_signals_req_ports_i_data_id1(s_dcache_signals_req_ports_i_data_id1),                // input wire [0 : 0] s_dcache_signals_req_ports_i_data_id1
  .rp_dcache_signals_req_ports_i_data_id1(rp_dcache_signals_req_ports_i_data_id1),              // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_id1
  .s_dcache_signals_req_ports_i_kill_req1(s_dcache_signals_req_ports_i_kill_req1),              // input wire [0 : 0] s_dcache_signals_req_ports_i_kill_req1
  .rp_dcache_signals_req_ports_i_kill_req1(rp_dcache_signals_req_ports_i_kill_req1),            // output wire [0 : 0] rp_dcache_signals_req_ports_i_kill_req1
  .s_dcache_signals_req_ports_i_tag_valid1(s_dcache_signals_req_ports_i_tag_valid1),            // input wire [0 : 0] s_dcache_signals_req_ports_i_tag_valid1
  .rp_dcache_signals_req_ports_i_tag_valid1(rp_dcache_signals_req_ports_i_tag_valid1),          // output wire [0 : 0] rp_dcache_signals_req_ports_i_tag_valid1
  .s_dcache_signals_req_ports_o_data_gnt1(s_dcache_signals_req_ports_o_data_gnt1),              // output wire [0 : 0] s_dcache_signals_req_ports_o_data_gnt1
  .rp_dcache_signals_req_ports_o_data_gnt1(rp_dcache_signals_req_ports_o_data_gnt1),            // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_gnt1
  .s_dcache_signals_req_ports_o_data_rvalid1(s_dcache_signals_req_ports_o_data_rvalid1),        // output wire [0 : 0] s_dcache_signals_req_ports_o_data_rvalid1
  .rp_dcache_signals_req_ports_o_data_rvalid1(rp_dcache_signals_req_ports_o_data_rvalid1),      // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_rvalid1
  .s_dcache_signals_req_ports_o_data_rid1(s_dcache_signals_req_ports_o_data_rid1),              // output wire [0 : 0] s_dcache_signals_req_ports_o_data_rid1
  .rp_dcache_signals_req_ports_o_data_rid1(rp_dcache_signals_req_ports_o_data_rid1),            // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_rid1
  .s_dcache_signals_req_ports_o_data_rdata1(s_dcache_signals_req_ports_o_data_rdata1),          // output wire [63 : 0] s_dcache_signals_req_ports_o_data_rdata1
  .rp_dcache_signals_req_ports_o_data_rdata1(rp_dcache_signals_req_ports_o_data_rdata1),        // input wire [63 : 0] rp_dcache_signals_req_ports_o_data_rdata1
  .s_dcache_signals_req_ports_o_data_ruser1(s_dcache_signals_req_ports_o_data_ruser1),          // output wire [63 : 0] s_dcache_signals_req_ports_o_data_ruser1
  .rp_dcache_signals_req_ports_o_data_ruser1(rp_dcache_signals_req_ports_o_data_ruser1),        // input wire [63 : 0] rp_dcache_signals_req_ports_o_data_ruser1
  .s_dcache_signals_req_ports_i_address_index2(s_dcache_signals_req_ports_i_address_index2),    // input wire [11 : 0] s_dcache_signals_req_ports_i_address_index2
  .rp_dcache_signals_req_ports_i_address_index2(rp_dcache_signals_req_ports_i_address_index2),  // output wire [11 : 0] rp_dcache_signals_req_ports_i_address_index2
  .s_dcache_signals_req_ports_i_address_tag2(s_dcache_signals_req_ports_i_address_tag2),        // input wire [43 : 0] s_dcache_signals_req_ports_i_address_tag2
  .rp_dcache_signals_req_ports_i_address_tag2(rp_dcache_signals_req_ports_i_address_tag2),      // output wire [43 : 0] rp_dcache_signals_req_ports_i_address_tag2
  .s_dcache_signals_req_ports_i_data_wdata2(s_dcache_signals_req_ports_i_data_wdata2),          // input wire [63 : 0] s_dcache_signals_req_ports_i_data_wdata2
  .rp_dcache_signals_req_ports_i_data_wdata2(rp_dcache_signals_req_ports_i_data_wdata2),        // output wire [63 : 0] rp_dcache_signals_req_ports_i_data_wdata2
  .s_dcache_signals_req_ports_i_data_wuser2(s_dcache_signals_req_ports_i_data_wuser2),          // input wire [63 : 0] s_dcache_signals_req_ports_i_data_wuser2
  .rp_dcache_signals_req_ports_i_data_wuser2(rp_dcache_signals_req_ports_i_data_wuser2),        // output wire [63 : 0] rp_dcache_signals_req_ports_i_data_wuser2
  .s_dcache_signals_req_ports_i_data_req2(s_dcache_signals_req_ports_i_data_req2),              // input wire [0 : 0] s_dcache_signals_req_ports_i_data_req2
  .rp_dcache_signals_req_ports_i_data_req2(rp_dcache_signals_req_ports_i_data_req2),            // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_req2
  .s_dcache_signals_req_ports_i_data_we2(s_dcache_signals_req_ports_i_data_we2),                // input wire [0 : 0] s_dcache_signals_req_ports_i_data_we2
  .rp_dcache_signals_req_ports_i_data_we2(rp_dcache_signals_req_ports_i_data_we2),              // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_we2
  .s_dcache_signals_req_ports_i_data_be2(s_dcache_signals_req_ports_i_data_be2),                // input wire [7 : 0] s_dcache_signals_req_ports_i_data_be2
  .rp_dcache_signals_req_ports_i_data_be2(rp_dcache_signals_req_ports_i_data_be2),              // output wire [7 : 0] rp_dcache_signals_req_ports_i_data_be2
  .s_dcache_signals_req_ports_i_data_size2(s_dcache_signals_req_ports_i_data_size2),            // input wire [1 : 0] s_dcache_signals_req_ports_i_data_size2
  .rp_dcache_signals_req_ports_i_data_size2(rp_dcache_signals_req_ports_i_data_size2),          // output wire [1 : 0] rp_dcache_signals_req_ports_i_data_size2
  .s_dcache_signals_req_ports_i_data_id2(s_dcache_signals_req_ports_i_data_id2),                // input wire [0 : 0] s_dcache_signals_req_ports_i_data_id2
  .rp_dcache_signals_req_ports_i_data_id2(rp_dcache_signals_req_ports_i_data_id2),              // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_id2
  .s_dcache_signals_req_ports_i_kill_req2(s_dcache_signals_req_ports_i_kill_req2),              // input wire [0 : 0] s_dcache_signals_req_ports_i_kill_req2
  .rp_dcache_signals_req_ports_i_kill_req2(rp_dcache_signals_req_ports_i_kill_req2),            // output wire [0 : 0] rp_dcache_signals_req_ports_i_kill_req2
  .s_dcache_signals_req_ports_i_tag_valid2(s_dcache_signals_req_ports_i_tag_valid2),            // input wire [0 : 0] s_dcache_signals_req_ports_i_tag_valid2
  .rp_dcache_signals_req_ports_i_tag_valid2(rp_dcache_signals_req_ports_i_tag_valid2),          // output wire [0 : 0] rp_dcache_signals_req_ports_i_tag_valid2
  .s_dcache_signals_req_ports_o_data_gnt2(s_dcache_signals_req_ports_o_data_gnt2),              // output wire [0 : 0] s_dcache_signals_req_ports_o_data_gnt2
  .rp_dcache_signals_req_ports_o_data_gnt2(rp_dcache_signals_req_ports_o_data_gnt2),            // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_gnt2
  .s_dcache_signals_req_ports_o_data_rvalid2(s_dcache_signals_req_ports_o_data_rvalid2),        // output wire [0 : 0] s_dcache_signals_req_ports_o_data_rvalid2
  .rp_dcache_signals_req_ports_o_data_rvalid2(rp_dcache_signals_req_ports_o_data_rvalid2),      // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_rvalid2
  .s_dcache_signals_req_ports_o_data_rid2(s_dcache_signals_req_ports_o_data_rid2),              // output wire [0 : 0] s_dcache_signals_req_ports_o_data_rid2
  .rp_dcache_signals_req_ports_o_data_rid2(rp_dcache_signals_req_ports_o_data_rid2),            // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_rid2
  .s_dcache_signals_req_ports_o_data_rdata2(s_dcache_signals_req_ports_o_data_rdata2),          // output wire [63 : 0] s_dcache_signals_req_ports_o_data_rdata2
  .rp_dcache_signals_req_ports_o_data_rdata2(rp_dcache_signals_req_ports_o_data_rdata2),        // input wire [63 : 0] rp_dcache_signals_req_ports_o_data_rdata2
  .s_dcache_signals_req_ports_o_data_ruser2(s_dcache_signals_req_ports_o_data_ruser2),          // output wire [63 : 0] s_dcache_signals_req_ports_o_data_ruser2
  .rp_dcache_signals_req_ports_o_data_ruser2(rp_dcache_signals_req_ports_o_data_ruser2),        // input wire [63 : 0] rp_dcache_signals_req_ports_o_data_ruser2
  .s_dcache_signals_req_ports_i_address_index3(s_dcache_signals_req_ports_i_address_index3),    // input wire [11 : 0] s_dcache_signals_req_ports_i_address_index3
  .rp_dcache_signals_req_ports_i_address_index3(rp_dcache_signals_req_ports_i_address_index3),  // output wire [11 : 0] rp_dcache_signals_req_ports_i_address_index3
  .s_dcache_signals_req_ports_i_address_tag3(s_dcache_signals_req_ports_i_address_tag3),        // input wire [43 : 0] s_dcache_signals_req_ports_i_address_tag3
  .rp_dcache_signals_req_ports_i_address_tag3(rp_dcache_signals_req_ports_i_address_tag3),      // output wire [43 : 0] rp_dcache_signals_req_ports_i_address_tag3
  .s_dcache_signals_req_ports_i_data_wdata3(s_dcache_signals_req_ports_i_data_wdata3),          // input wire [63 : 0] s_dcache_signals_req_ports_i_data_wdata3
  .rp_dcache_signals_req_ports_i_data_wdata3(rp_dcache_signals_req_ports_i_data_wdata3),        // output wire [63 : 0] rp_dcache_signals_req_ports_i_data_wdata3
  .s_dcache_signals_req_ports_i_data_wuser3(s_dcache_signals_req_ports_i_data_wuser3),          // input wire [63 : 0] s_dcache_signals_req_ports_i_data_wuser3
  .rp_dcache_signals_req_ports_i_data_wuser3(rp_dcache_signals_req_ports_i_data_wuser3),        // output wire [63 : 0] rp_dcache_signals_req_ports_i_data_wuser3
  .s_dcache_signals_req_ports_i_data_req3(s_dcache_signals_req_ports_i_data_req3),              // input wire [0 : 0] s_dcache_signals_req_ports_i_data_req3
  .rp_dcache_signals_req_ports_i_data_req3(rp_dcache_signals_req_ports_i_data_req3),            // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_req3
  .s_dcache_signals_req_ports_i_data_we3(s_dcache_signals_req_ports_i_data_we3),                // input wire [0 : 0] s_dcache_signals_req_ports_i_data_we3
  .rp_dcache_signals_req_ports_i_data_we3(rp_dcache_signals_req_ports_i_data_we3),              // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_we3
  .s_dcache_signals_req_ports_i_data_be3(s_dcache_signals_req_ports_i_data_be3),                // input wire [7 : 0] s_dcache_signals_req_ports_i_data_be3
  .rp_dcache_signals_req_ports_i_data_be3(rp_dcache_signals_req_ports_i_data_be3),              // output wire [7 : 0] rp_dcache_signals_req_ports_i_data_be3
  .s_dcache_signals_req_ports_i_data_size3(s_dcache_signals_req_ports_i_data_size3),            // input wire [1 : 0] s_dcache_signals_req_ports_i_data_size3
  .rp_dcache_signals_req_ports_i_data_size3(rp_dcache_signals_req_ports_i_data_size3),          // output wire [1 : 0] rp_dcache_signals_req_ports_i_data_size3
  .s_dcache_signals_req_ports_i_data_id3(s_dcache_signals_req_ports_i_data_id3),                // input wire [0 : 0] s_dcache_signals_req_ports_i_data_id3
  .rp_dcache_signals_req_ports_i_data_id3(rp_dcache_signals_req_ports_i_data_id3),              // output wire [0 : 0] rp_dcache_signals_req_ports_i_data_id3
  .s_dcache_signals_req_ports_i_kill_req3(s_dcache_signals_req_ports_i_kill_req3),              // input wire [0 : 0] s_dcache_signals_req_ports_i_kill_req3
  .rp_dcache_signals_req_ports_i_kill_req3(rp_dcache_signals_req_ports_i_kill_req3),            // output wire [0 : 0] rp_dcache_signals_req_ports_i_kill_req3
  .s_dcache_signals_req_ports_i_tag_valid3(s_dcache_signals_req_ports_i_tag_valid3),            // input wire [0 : 0] s_dcache_signals_req_ports_i_tag_valid3
  .rp_dcache_signals_req_ports_i_tag_valid3(rp_dcache_signals_req_ports_i_tag_valid3),          // output wire [0 : 0] rp_dcache_signals_req_ports_i_tag_valid3
  .s_dcache_signals_req_ports_o_data_gnt3(s_dcache_signals_req_ports_o_data_gnt3),              // output wire [0 : 0] s_dcache_signals_req_ports_o_data_gnt3
  .rp_dcache_signals_req_ports_o_data_gnt3(rp_dcache_signals_req_ports_o_data_gnt3),            // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_gnt3
  .s_dcache_signals_req_ports_o_data_rvalid3(s_dcache_signals_req_ports_o_data_rvalid3),        // output wire [0 : 0] s_dcache_signals_req_ports_o_data_rvalid3
  .rp_dcache_signals_req_ports_o_data_rvalid3(rp_dcache_signals_req_ports_o_data_rvalid3),      // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_rvalid3
  .s_dcache_signals_req_ports_o_data_rid3(s_dcache_signals_req_ports_o_data_rid3),              // output wire [0 : 0] s_dcache_signals_req_ports_o_data_rid3
  .rp_dcache_signals_req_ports_o_data_rid3(rp_dcache_signals_req_ports_o_data_rid3),            // input wire [0 : 0] rp_dcache_signals_req_ports_o_data_rid3
  .s_dcache_signals_req_ports_o_data_rdata3(s_dcache_signals_req_ports_o_data_rdata3),          // output wire [63 : 0] s_dcache_signals_req_ports_o_data_rdata3
  .rp_dcache_signals_req_ports_o_data_rdata3(rp_dcache_signals_req_ports_o_data_rdata3),        // input wire [63 : 0] rp_dcache_signals_req_ports_o_data_rdata3
  .s_dcache_signals_req_ports_o_data_ruser3(s_dcache_signals_req_ports_o_data_ruser3),          // output wire [63 : 0] s_dcache_signals_req_ports_o_data_ruser3
  .rp_dcache_signals_req_ports_o_data_ruser3(rp_dcache_signals_req_ports_o_data_ruser3),        // input wire [63 : 0] rp_dcache_signals_req_ports_o_data_ruser3
  .s_dcache_signals_miss_vld_bits_o_1(s_dcache_signals_miss_vld_bits_o_1),                      // output wire [7 : 0] s_dcache_signals_miss_vld_bits_o_1
  .rp_dcache_signals_miss_vld_bits_o_1(rp_dcache_signals_miss_vld_bits_o_1),                    // input wire [7 : 0] rp_dcache_signals_miss_vld_bits_o_1
  .s_dcache_signals_miss_vld_bits_o_2(s_dcache_signals_miss_vld_bits_o_2),                      // output wire [7 : 0] s_dcache_signals_miss_vld_bits_o_2
  .rp_dcache_signals_miss_vld_bits_o_2(rp_dcache_signals_miss_vld_bits_o_2),                    // input wire [7 : 0] rp_dcache_signals_miss_vld_bits_o_2
  .s_dcache_signals_miss_vld_bits_o_3(s_dcache_signals_miss_vld_bits_o_3),                      // output wire [7 : 0] s_dcache_signals_miss_vld_bits_o_3
  .rp_dcache_signals_miss_vld_bits_o_3(rp_dcache_signals_miss_vld_bits_o_3),                    // input wire [7 : 0] rp_dcache_signals_miss_vld_bits_o_3
  .s_dcache_signals_mem_rtrn_vld_i(s_dcache_signals_mem_rtrn_vld_i),                            // input wire [0 : 0] s_dcache_signals_mem_rtrn_vld_i
  .rp_dcache_signals_mem_rtrn_vld_i(rp_dcache_signals_mem_rtrn_vld_i),                          // output wire [0 : 0] rp_dcache_signals_mem_rtrn_vld_i
  .s_dcache_signals_mem_rtrn_i_rtype(s_dcache_signals_mem_rtrn_i_rtype),                        // input wire [2 : 0] s_dcache_signals_mem_rtrn_i_rtype
  .rp_dcache_signals_mem_rtrn_i_rtype(rp_dcache_signals_mem_rtrn_i_rtype),                      // output wire [2 : 0] rp_dcache_signals_mem_rtrn_i_rtype
  .s_dcache_signals_mem_rtrn_i_data(s_dcache_signals_mem_rtrn_i_data),                          // input wire [127 : 0] s_dcache_signals_mem_rtrn_i_data
  .rp_dcache_signals_mem_rtrn_i_data(rp_dcache_signals_mem_rtrn_i_data),                        // output wire [127 : 0] rp_dcache_signals_mem_rtrn_i_data
  .s_dcache_signals_mem_rtrn_i_user(s_dcache_signals_mem_rtrn_i_user),                          // input wire [127 : 0] s_dcache_signals_mem_rtrn_i_user
  .rp_dcache_signals_mem_rtrn_i_user(rp_dcache_signals_mem_rtrn_i_user),                        // output wire [127 : 0] rp_dcache_signals_mem_rtrn_i_user
  .s_dcache_signals_mem_rtrn_i_inv_vld(s_dcache_signals_mem_rtrn_i_inv_vld),                    // input wire [0 : 0] s_dcache_signals_mem_rtrn_i_inv_vld
  .rp_dcache_signals_mem_rtrn_i_inv_vld(rp_dcache_signals_mem_rtrn_i_inv_vld),                  // output wire [0 : 0] rp_dcache_signals_mem_rtrn_i_inv_vld
  .s_dcache_signals_mem_rtrn_i_inv_all(s_dcache_signals_mem_rtrn_i_inv_all),                    // input wire [0 : 0] s_dcache_signals_mem_rtrn_i_inv_all
  .rp_dcache_signals_mem_rtrn_i_inv_all(rp_dcache_signals_mem_rtrn_i_inv_all),                  // output wire [0 : 0] rp_dcache_signals_mem_rtrn_i_inv_all
  .s_dcache_signals_mem_rtrn_i_inv_idx(s_dcache_signals_mem_rtrn_i_inv_idx),                    // input wire [11 : 0] s_dcache_signals_mem_rtrn_i_inv_idx
  .rp_dcache_signals_mem_rtrn_i_inv_idx(rp_dcache_signals_mem_rtrn_i_inv_idx),                  // output wire [11 : 0] rp_dcache_signals_mem_rtrn_i_inv_idx
  .s_dcache_signals_mem_rtrn_i_inv_way(s_dcache_signals_mem_rtrn_i_inv_way),                    // input wire [2 : 0] s_dcache_signals_mem_rtrn_i_inv_way
  .rp_dcache_signals_mem_rtrn_i_inv_way(rp_dcache_signals_mem_rtrn_i_inv_way),                  // output wire [2 : 0] rp_dcache_signals_mem_rtrn_i_inv_way
  .s_dcache_signals_mem_rtrn_i_tid(s_dcache_signals_mem_rtrn_i_tid),                            // input wire [1 : 0] s_dcache_signals_mem_rtrn_i_tid
  .rp_dcache_signals_mem_rtrn_i_tid(rp_dcache_signals_mem_rtrn_i_tid),                          // output wire [1 : 0] rp_dcache_signals_mem_rtrn_i_tid
  .s_dcache_signals_mem_data_req_o(s_dcache_signals_mem_data_req_o),                            // output wire [0 : 0] s_dcache_signals_mem_data_req_o
  .rp_dcache_signals_mem_data_req_o(rp_dcache_signals_mem_data_req_o),                          // input wire [0 : 0] rp_dcache_signals_mem_data_req_o
  .s_dcache_signals_mem_data_ack_i(s_dcache_signals_mem_data_ack_i),                            // input wire [0 : 0] s_dcache_signals_mem_data_ack_i
  .rp_dcache_signals_mem_data_ack_i(rp_dcache_signals_mem_data_ack_i),                          // output wire [0 : 0] rp_dcache_signals_mem_data_ack_i
  .s_dcache_signals_mem_data_o_rtype(s_dcache_signals_mem_data_o_rtype),                        // output wire [1 : 0] s_dcache_signals_mem_data_o_rtype
  .rp_dcache_signals_mem_data_o_rtype(rp_dcache_signals_mem_data_o_rtype),                      // input wire [1 : 0] rp_dcache_signals_mem_data_o_rtype
  .s_dcache_signals_mem_data_o_size(s_dcache_signals_mem_data_o_size),                          // output wire [2 : 0] s_dcache_signals_mem_data_o_size
  .rp_dcache_signals_mem_data_o_size(rp_dcache_signals_mem_data_o_size),                        // input wire [2 : 0] rp_dcache_signals_mem_data_o_size
  .s_dcache_signals_mem_data_o_way(s_dcache_signals_mem_data_o_way),                            // output wire [2 : 0] s_dcache_signals_mem_data_o_way
  .rp_dcache_signals_mem_data_o_way(rp_dcache_signals_mem_data_o_way),                          // input wire [2 : 0] rp_dcache_signals_mem_data_o_way
  .s_dcache_signals_mem_data_o_paddr(s_dcache_signals_mem_data_o_paddr),                        // output wire [55 : 0] s_dcache_signals_mem_data_o_paddr
  .rp_dcache_signals_mem_data_o_paddr(rp_dcache_signals_mem_data_o_paddr),                      // input wire [55 : 0] rp_dcache_signals_mem_data_o_paddr
  .s_dcache_signals_mem_data_o_data(s_dcache_signals_mem_data_o_data),                          // output wire [63 : 0] s_dcache_signals_mem_data_o_data
  .rp_dcache_signals_mem_data_o_data(rp_dcache_signals_mem_data_o_data),                        // input wire [63 : 0] rp_dcache_signals_mem_data_o_data
  .s_dcache_signals_mem_data_o_user(s_dcache_signals_mem_data_o_user),                          // output wire [63 : 0] s_dcache_signals_mem_data_o_user
  .rp_dcache_signals_mem_data_o_user(rp_dcache_signals_mem_data_o_user),                        // input wire [63 : 0] rp_dcache_signals_mem_data_o_user
  .s_dcache_signals_mem_data_o_nc(s_dcache_signals_mem_data_o_nc),                              // output wire [0 : 0] s_dcache_signals_mem_data_o_nc
  .rp_dcache_signals_mem_data_o_nc(rp_dcache_signals_mem_data_o_nc),                            // input wire [0 : 0] rp_dcache_signals_mem_data_o_nc
  .s_dcache_signals_mem_data_o_tid(s_dcache_signals_mem_data_o_tid),                            // output wire [1 : 0] s_dcache_signals_mem_data_o_tid
  .rp_dcache_signals_mem_data_o_tid(rp_dcache_signals_mem_data_o_tid),                          // input wire [1 : 0] rp_dcache_signals_mem_data_o_tid
  .s_dcache_signals_mem_data_o_amo_op(s_dcache_signals_mem_data_o_amo_op),                      // output wire [3 : 0] s_dcache_signals_mem_data_o_amo_op
  .rp_dcache_signals_mem_data_o_amo_op(rp_dcache_signals_mem_data_o_amo_op),                    // input wire [3 : 0] rp_dcache_signals_mem_data_o_amo_op
  .decouple(decouple)                                                                          // input wire decouple
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file dfx_decoupler.v when simulating
// the core, dfx_decoupler. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

