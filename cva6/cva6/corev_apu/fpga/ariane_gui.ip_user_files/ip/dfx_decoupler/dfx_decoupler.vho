-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.
-- IP VLNV: xilinx.com:ip:dfx_decoupler:1.0
-- IP Revision: 5

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT dfx_decoupler
  PORT (
    s_dcache_signals_clk_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_clk_i : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_rst_ni : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_rst_ni : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_enable_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_enable_i : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_flush_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_flush_i : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_flush_ack_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_flush_ack_o : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_miss_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_miss_o : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_wbuffer_empty_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_wbuffer_empty_o : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_wbuffer_not_ni_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_wbuffer_not_ni_o : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_amo_req_i_req : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_amo_req_i_req : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_amo_req_i_amo_op : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    rp_dcache_signals_amo_req_i_amo_op : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_dcache_signals_amo_req_i_size : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    rp_dcache_signals_amo_req_i_size : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_dcache_signals_amo_req_i_operand_a : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_amo_req_i_operand_a : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_amo_req_i_operand_b : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_amo_req_i_operand_b : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_amo_resp_o_ack : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_amo_resp_o_ack : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_amo_resp_o_result : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_amo_resp_o_result : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_address_index1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    rp_dcache_signals_req_ports_i_address_index1 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_dcache_signals_req_ports_i_address_tag1 : IN STD_LOGIC_VECTOR(43 DOWNTO 0);
    rp_dcache_signals_req_ports_i_address_tag1 : OUT STD_LOGIC_VECTOR(43 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_wdata1 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_wdata1 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_wuser1 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_wuser1 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_req1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_req1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_we1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_we1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_be1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_be1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_size1 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_size1 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_id1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_id1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_kill_req1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_kill_req1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_tag_valid1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_tag_valid1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_gnt1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_gnt1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rvalid1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rvalid1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rid1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rid1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rdata1 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rdata1 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_ruser1 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_ruser1 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_address_index2 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    rp_dcache_signals_req_ports_i_address_index2 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_dcache_signals_req_ports_i_address_tag2 : IN STD_LOGIC_VECTOR(43 DOWNTO 0);
    rp_dcache_signals_req_ports_i_address_tag2 : OUT STD_LOGIC_VECTOR(43 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_wdata2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_wdata2 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_wuser2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_wuser2 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_req2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_req2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_we2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_we2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_be2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_be2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_size2 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_size2 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_id2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_id2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_kill_req2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_kill_req2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_tag_valid2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_tag_valid2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_gnt2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_gnt2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rvalid2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rvalid2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rid2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rid2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rdata2 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rdata2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_ruser2 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_ruser2 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_address_index3 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    rp_dcache_signals_req_ports_i_address_index3 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_dcache_signals_req_ports_i_address_tag3 : IN STD_LOGIC_VECTOR(43 DOWNTO 0);
    rp_dcache_signals_req_ports_i_address_tag3 : OUT STD_LOGIC_VECTOR(43 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_wdata3 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_wdata3 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_wuser3 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_wuser3 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_req3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_req3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_we3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_we3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_be3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_be3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_size3 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_size3 : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_dcache_signals_req_ports_i_data_id3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_data_id3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_kill_req3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_kill_req3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_i_tag_valid3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_i_tag_valid3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_gnt3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_gnt3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rvalid3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rvalid3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rid3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rid3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_rdata3 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_rdata3 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_req_ports_o_data_ruser3 : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_req_ports_o_data_ruser3 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_miss_vld_bits_o_1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rp_dcache_signals_miss_vld_bits_o_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_dcache_signals_miss_vld_bits_o_2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rp_dcache_signals_miss_vld_bits_o_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_dcache_signals_miss_vld_bits_o_3 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rp_dcache_signals_miss_vld_bits_o_3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_dcache_signals_mem_rtrn_vld_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_vld_i : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_mem_rtrn_i_rtype : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_i_rtype : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_dcache_signals_mem_rtrn_i_data : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_i_data : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    s_dcache_signals_mem_rtrn_i_user : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_i_user : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    s_dcache_signals_mem_rtrn_i_inv_vld : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_i_inv_vld : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_mem_rtrn_i_inv_all : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_i_inv_all : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_mem_rtrn_i_inv_idx : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_i_inv_idx : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_dcache_signals_mem_rtrn_i_inv_way : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_i_inv_way : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_dcache_signals_mem_rtrn_i_tid : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    rp_dcache_signals_mem_rtrn_i_tid : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_dcache_signals_mem_data_req_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_mem_data_req_o : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_mem_data_ack_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_mem_data_ack_i : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_mem_data_o_rtype : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    rp_dcache_signals_mem_data_o_rtype : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_dcache_signals_mem_data_o_size : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    rp_dcache_signals_mem_data_o_size : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_dcache_signals_mem_data_o_way : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    rp_dcache_signals_mem_data_o_way : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_dcache_signals_mem_data_o_paddr : OUT STD_LOGIC_VECTOR(55 DOWNTO 0);
    rp_dcache_signals_mem_data_o_paddr : IN STD_LOGIC_VECTOR(55 DOWNTO 0);
    s_dcache_signals_mem_data_o_data : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_mem_data_o_data : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_mem_data_o_user : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    rp_dcache_signals_mem_data_o_user : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_dcache_signals_mem_data_o_nc : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    rp_dcache_signals_mem_data_o_nc : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_dcache_signals_mem_data_o_tid : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    rp_dcache_signals_mem_data_o_tid : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_dcache_signals_mem_data_o_amo_op : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    rp_dcache_signals_mem_data_o_amo_op : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    decouple : IN STD_LOGIC 
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : dfx_decoupler
  PORT MAP (
    s_dcache_signals_clk_i => s_dcache_signals_clk_i,
    rp_dcache_signals_clk_i => rp_dcache_signals_clk_i,
    s_dcache_signals_rst_ni => s_dcache_signals_rst_ni,
    rp_dcache_signals_rst_ni => rp_dcache_signals_rst_ni,
    s_dcache_signals_enable_i => s_dcache_signals_enable_i,
    rp_dcache_signals_enable_i => rp_dcache_signals_enable_i,
    s_dcache_signals_flush_i => s_dcache_signals_flush_i,
    rp_dcache_signals_flush_i => rp_dcache_signals_flush_i,
    s_dcache_signals_flush_ack_o => s_dcache_signals_flush_ack_o,
    rp_dcache_signals_flush_ack_o => rp_dcache_signals_flush_ack_o,
    s_dcache_signals_miss_o => s_dcache_signals_miss_o,
    rp_dcache_signals_miss_o => rp_dcache_signals_miss_o,
    s_dcache_signals_wbuffer_empty_o => s_dcache_signals_wbuffer_empty_o,
    rp_dcache_signals_wbuffer_empty_o => rp_dcache_signals_wbuffer_empty_o,
    s_dcache_signals_wbuffer_not_ni_o => s_dcache_signals_wbuffer_not_ni_o,
    rp_dcache_signals_wbuffer_not_ni_o => rp_dcache_signals_wbuffer_not_ni_o,
    s_dcache_signals_amo_req_i_req => s_dcache_signals_amo_req_i_req,
    rp_dcache_signals_amo_req_i_req => rp_dcache_signals_amo_req_i_req,
    s_dcache_signals_amo_req_i_amo_op => s_dcache_signals_amo_req_i_amo_op,
    rp_dcache_signals_amo_req_i_amo_op => rp_dcache_signals_amo_req_i_amo_op,
    s_dcache_signals_amo_req_i_size => s_dcache_signals_amo_req_i_size,
    rp_dcache_signals_amo_req_i_size => rp_dcache_signals_amo_req_i_size,
    s_dcache_signals_amo_req_i_operand_a => s_dcache_signals_amo_req_i_operand_a,
    rp_dcache_signals_amo_req_i_operand_a => rp_dcache_signals_amo_req_i_operand_a,
    s_dcache_signals_amo_req_i_operand_b => s_dcache_signals_amo_req_i_operand_b,
    rp_dcache_signals_amo_req_i_operand_b => rp_dcache_signals_amo_req_i_operand_b,
    s_dcache_signals_amo_resp_o_ack => s_dcache_signals_amo_resp_o_ack,
    rp_dcache_signals_amo_resp_o_ack => rp_dcache_signals_amo_resp_o_ack,
    s_dcache_signals_amo_resp_o_result => s_dcache_signals_amo_resp_o_result,
    rp_dcache_signals_amo_resp_o_result => rp_dcache_signals_amo_resp_o_result,
    s_dcache_signals_req_ports_i_address_index1 => s_dcache_signals_req_ports_i_address_index1,
    rp_dcache_signals_req_ports_i_address_index1 => rp_dcache_signals_req_ports_i_address_index1,
    s_dcache_signals_req_ports_i_address_tag1 => s_dcache_signals_req_ports_i_address_tag1,
    rp_dcache_signals_req_ports_i_address_tag1 => rp_dcache_signals_req_ports_i_address_tag1,
    s_dcache_signals_req_ports_i_data_wdata1 => s_dcache_signals_req_ports_i_data_wdata1,
    rp_dcache_signals_req_ports_i_data_wdata1 => rp_dcache_signals_req_ports_i_data_wdata1,
    s_dcache_signals_req_ports_i_data_wuser1 => s_dcache_signals_req_ports_i_data_wuser1,
    rp_dcache_signals_req_ports_i_data_wuser1 => rp_dcache_signals_req_ports_i_data_wuser1,
    s_dcache_signals_req_ports_i_data_req1 => s_dcache_signals_req_ports_i_data_req1,
    rp_dcache_signals_req_ports_i_data_req1 => rp_dcache_signals_req_ports_i_data_req1,
    s_dcache_signals_req_ports_i_data_we1 => s_dcache_signals_req_ports_i_data_we1,
    rp_dcache_signals_req_ports_i_data_we1 => rp_dcache_signals_req_ports_i_data_we1,
    s_dcache_signals_req_ports_i_data_be1 => s_dcache_signals_req_ports_i_data_be1,
    rp_dcache_signals_req_ports_i_data_be1 => rp_dcache_signals_req_ports_i_data_be1,
    s_dcache_signals_req_ports_i_data_size1 => s_dcache_signals_req_ports_i_data_size1,
    rp_dcache_signals_req_ports_i_data_size1 => rp_dcache_signals_req_ports_i_data_size1,
    s_dcache_signals_req_ports_i_data_id1 => s_dcache_signals_req_ports_i_data_id1,
    rp_dcache_signals_req_ports_i_data_id1 => rp_dcache_signals_req_ports_i_data_id1,
    s_dcache_signals_req_ports_i_kill_req1 => s_dcache_signals_req_ports_i_kill_req1,
    rp_dcache_signals_req_ports_i_kill_req1 => rp_dcache_signals_req_ports_i_kill_req1,
    s_dcache_signals_req_ports_i_tag_valid1 => s_dcache_signals_req_ports_i_tag_valid1,
    rp_dcache_signals_req_ports_i_tag_valid1 => rp_dcache_signals_req_ports_i_tag_valid1,
    s_dcache_signals_req_ports_o_data_gnt1 => s_dcache_signals_req_ports_o_data_gnt1,
    rp_dcache_signals_req_ports_o_data_gnt1 => rp_dcache_signals_req_ports_o_data_gnt1,
    s_dcache_signals_req_ports_o_data_rvalid1 => s_dcache_signals_req_ports_o_data_rvalid1,
    rp_dcache_signals_req_ports_o_data_rvalid1 => rp_dcache_signals_req_ports_o_data_rvalid1,
    s_dcache_signals_req_ports_o_data_rid1 => s_dcache_signals_req_ports_o_data_rid1,
    rp_dcache_signals_req_ports_o_data_rid1 => rp_dcache_signals_req_ports_o_data_rid1,
    s_dcache_signals_req_ports_o_data_rdata1 => s_dcache_signals_req_ports_o_data_rdata1,
    rp_dcache_signals_req_ports_o_data_rdata1 => rp_dcache_signals_req_ports_o_data_rdata1,
    s_dcache_signals_req_ports_o_data_ruser1 => s_dcache_signals_req_ports_o_data_ruser1,
    rp_dcache_signals_req_ports_o_data_ruser1 => rp_dcache_signals_req_ports_o_data_ruser1,
    s_dcache_signals_req_ports_i_address_index2 => s_dcache_signals_req_ports_i_address_index2,
    rp_dcache_signals_req_ports_i_address_index2 => rp_dcache_signals_req_ports_i_address_index2,
    s_dcache_signals_req_ports_i_address_tag2 => s_dcache_signals_req_ports_i_address_tag2,
    rp_dcache_signals_req_ports_i_address_tag2 => rp_dcache_signals_req_ports_i_address_tag2,
    s_dcache_signals_req_ports_i_data_wdata2 => s_dcache_signals_req_ports_i_data_wdata2,
    rp_dcache_signals_req_ports_i_data_wdata2 => rp_dcache_signals_req_ports_i_data_wdata2,
    s_dcache_signals_req_ports_i_data_wuser2 => s_dcache_signals_req_ports_i_data_wuser2,
    rp_dcache_signals_req_ports_i_data_wuser2 => rp_dcache_signals_req_ports_i_data_wuser2,
    s_dcache_signals_req_ports_i_data_req2 => s_dcache_signals_req_ports_i_data_req2,
    rp_dcache_signals_req_ports_i_data_req2 => rp_dcache_signals_req_ports_i_data_req2,
    s_dcache_signals_req_ports_i_data_we2 => s_dcache_signals_req_ports_i_data_we2,
    rp_dcache_signals_req_ports_i_data_we2 => rp_dcache_signals_req_ports_i_data_we2,
    s_dcache_signals_req_ports_i_data_be2 => s_dcache_signals_req_ports_i_data_be2,
    rp_dcache_signals_req_ports_i_data_be2 => rp_dcache_signals_req_ports_i_data_be2,
    s_dcache_signals_req_ports_i_data_size2 => s_dcache_signals_req_ports_i_data_size2,
    rp_dcache_signals_req_ports_i_data_size2 => rp_dcache_signals_req_ports_i_data_size2,
    s_dcache_signals_req_ports_i_data_id2 => s_dcache_signals_req_ports_i_data_id2,
    rp_dcache_signals_req_ports_i_data_id2 => rp_dcache_signals_req_ports_i_data_id2,
    s_dcache_signals_req_ports_i_kill_req2 => s_dcache_signals_req_ports_i_kill_req2,
    rp_dcache_signals_req_ports_i_kill_req2 => rp_dcache_signals_req_ports_i_kill_req2,
    s_dcache_signals_req_ports_i_tag_valid2 => s_dcache_signals_req_ports_i_tag_valid2,
    rp_dcache_signals_req_ports_i_tag_valid2 => rp_dcache_signals_req_ports_i_tag_valid2,
    s_dcache_signals_req_ports_o_data_gnt2 => s_dcache_signals_req_ports_o_data_gnt2,
    rp_dcache_signals_req_ports_o_data_gnt2 => rp_dcache_signals_req_ports_o_data_gnt2,
    s_dcache_signals_req_ports_o_data_rvalid2 => s_dcache_signals_req_ports_o_data_rvalid2,
    rp_dcache_signals_req_ports_o_data_rvalid2 => rp_dcache_signals_req_ports_o_data_rvalid2,
    s_dcache_signals_req_ports_o_data_rid2 => s_dcache_signals_req_ports_o_data_rid2,
    rp_dcache_signals_req_ports_o_data_rid2 => rp_dcache_signals_req_ports_o_data_rid2,
    s_dcache_signals_req_ports_o_data_rdata2 => s_dcache_signals_req_ports_o_data_rdata2,
    rp_dcache_signals_req_ports_o_data_rdata2 => rp_dcache_signals_req_ports_o_data_rdata2,
    s_dcache_signals_req_ports_o_data_ruser2 => s_dcache_signals_req_ports_o_data_ruser2,
    rp_dcache_signals_req_ports_o_data_ruser2 => rp_dcache_signals_req_ports_o_data_ruser2,
    s_dcache_signals_req_ports_i_address_index3 => s_dcache_signals_req_ports_i_address_index3,
    rp_dcache_signals_req_ports_i_address_index3 => rp_dcache_signals_req_ports_i_address_index3,
    s_dcache_signals_req_ports_i_address_tag3 => s_dcache_signals_req_ports_i_address_tag3,
    rp_dcache_signals_req_ports_i_address_tag3 => rp_dcache_signals_req_ports_i_address_tag3,
    s_dcache_signals_req_ports_i_data_wdata3 => s_dcache_signals_req_ports_i_data_wdata3,
    rp_dcache_signals_req_ports_i_data_wdata3 => rp_dcache_signals_req_ports_i_data_wdata3,
    s_dcache_signals_req_ports_i_data_wuser3 => s_dcache_signals_req_ports_i_data_wuser3,
    rp_dcache_signals_req_ports_i_data_wuser3 => rp_dcache_signals_req_ports_i_data_wuser3,
    s_dcache_signals_req_ports_i_data_req3 => s_dcache_signals_req_ports_i_data_req3,
    rp_dcache_signals_req_ports_i_data_req3 => rp_dcache_signals_req_ports_i_data_req3,
    s_dcache_signals_req_ports_i_data_we3 => s_dcache_signals_req_ports_i_data_we3,
    rp_dcache_signals_req_ports_i_data_we3 => rp_dcache_signals_req_ports_i_data_we3,
    s_dcache_signals_req_ports_i_data_be3 => s_dcache_signals_req_ports_i_data_be3,
    rp_dcache_signals_req_ports_i_data_be3 => rp_dcache_signals_req_ports_i_data_be3,
    s_dcache_signals_req_ports_i_data_size3 => s_dcache_signals_req_ports_i_data_size3,
    rp_dcache_signals_req_ports_i_data_size3 => rp_dcache_signals_req_ports_i_data_size3,
    s_dcache_signals_req_ports_i_data_id3 => s_dcache_signals_req_ports_i_data_id3,
    rp_dcache_signals_req_ports_i_data_id3 => rp_dcache_signals_req_ports_i_data_id3,
    s_dcache_signals_req_ports_i_kill_req3 => s_dcache_signals_req_ports_i_kill_req3,
    rp_dcache_signals_req_ports_i_kill_req3 => rp_dcache_signals_req_ports_i_kill_req3,
    s_dcache_signals_req_ports_i_tag_valid3 => s_dcache_signals_req_ports_i_tag_valid3,
    rp_dcache_signals_req_ports_i_tag_valid3 => rp_dcache_signals_req_ports_i_tag_valid3,
    s_dcache_signals_req_ports_o_data_gnt3 => s_dcache_signals_req_ports_o_data_gnt3,
    rp_dcache_signals_req_ports_o_data_gnt3 => rp_dcache_signals_req_ports_o_data_gnt3,
    s_dcache_signals_req_ports_o_data_rvalid3 => s_dcache_signals_req_ports_o_data_rvalid3,
    rp_dcache_signals_req_ports_o_data_rvalid3 => rp_dcache_signals_req_ports_o_data_rvalid3,
    s_dcache_signals_req_ports_o_data_rid3 => s_dcache_signals_req_ports_o_data_rid3,
    rp_dcache_signals_req_ports_o_data_rid3 => rp_dcache_signals_req_ports_o_data_rid3,
    s_dcache_signals_req_ports_o_data_rdata3 => s_dcache_signals_req_ports_o_data_rdata3,
    rp_dcache_signals_req_ports_o_data_rdata3 => rp_dcache_signals_req_ports_o_data_rdata3,
    s_dcache_signals_req_ports_o_data_ruser3 => s_dcache_signals_req_ports_o_data_ruser3,
    rp_dcache_signals_req_ports_o_data_ruser3 => rp_dcache_signals_req_ports_o_data_ruser3,
    s_dcache_signals_miss_vld_bits_o_1 => s_dcache_signals_miss_vld_bits_o_1,
    rp_dcache_signals_miss_vld_bits_o_1 => rp_dcache_signals_miss_vld_bits_o_1,
    s_dcache_signals_miss_vld_bits_o_2 => s_dcache_signals_miss_vld_bits_o_2,
    rp_dcache_signals_miss_vld_bits_o_2 => rp_dcache_signals_miss_vld_bits_o_2,
    s_dcache_signals_miss_vld_bits_o_3 => s_dcache_signals_miss_vld_bits_o_3,
    rp_dcache_signals_miss_vld_bits_o_3 => rp_dcache_signals_miss_vld_bits_o_3,
    s_dcache_signals_mem_rtrn_vld_i => s_dcache_signals_mem_rtrn_vld_i,
    rp_dcache_signals_mem_rtrn_vld_i => rp_dcache_signals_mem_rtrn_vld_i,
    s_dcache_signals_mem_rtrn_i_rtype => s_dcache_signals_mem_rtrn_i_rtype,
    rp_dcache_signals_mem_rtrn_i_rtype => rp_dcache_signals_mem_rtrn_i_rtype,
    s_dcache_signals_mem_rtrn_i_data => s_dcache_signals_mem_rtrn_i_data,
    rp_dcache_signals_mem_rtrn_i_data => rp_dcache_signals_mem_rtrn_i_data,
    s_dcache_signals_mem_rtrn_i_user => s_dcache_signals_mem_rtrn_i_user,
    rp_dcache_signals_mem_rtrn_i_user => rp_dcache_signals_mem_rtrn_i_user,
    s_dcache_signals_mem_rtrn_i_inv_vld => s_dcache_signals_mem_rtrn_i_inv_vld,
    rp_dcache_signals_mem_rtrn_i_inv_vld => rp_dcache_signals_mem_rtrn_i_inv_vld,
    s_dcache_signals_mem_rtrn_i_inv_all => s_dcache_signals_mem_rtrn_i_inv_all,
    rp_dcache_signals_mem_rtrn_i_inv_all => rp_dcache_signals_mem_rtrn_i_inv_all,
    s_dcache_signals_mem_rtrn_i_inv_idx => s_dcache_signals_mem_rtrn_i_inv_idx,
    rp_dcache_signals_mem_rtrn_i_inv_idx => rp_dcache_signals_mem_rtrn_i_inv_idx,
    s_dcache_signals_mem_rtrn_i_inv_way => s_dcache_signals_mem_rtrn_i_inv_way,
    rp_dcache_signals_mem_rtrn_i_inv_way => rp_dcache_signals_mem_rtrn_i_inv_way,
    s_dcache_signals_mem_rtrn_i_tid => s_dcache_signals_mem_rtrn_i_tid,
    rp_dcache_signals_mem_rtrn_i_tid => rp_dcache_signals_mem_rtrn_i_tid,
    s_dcache_signals_mem_data_req_o => s_dcache_signals_mem_data_req_o,
    rp_dcache_signals_mem_data_req_o => rp_dcache_signals_mem_data_req_o,
    s_dcache_signals_mem_data_ack_i => s_dcache_signals_mem_data_ack_i,
    rp_dcache_signals_mem_data_ack_i => rp_dcache_signals_mem_data_ack_i,
    s_dcache_signals_mem_data_o_rtype => s_dcache_signals_mem_data_o_rtype,
    rp_dcache_signals_mem_data_o_rtype => rp_dcache_signals_mem_data_o_rtype,
    s_dcache_signals_mem_data_o_size => s_dcache_signals_mem_data_o_size,
    rp_dcache_signals_mem_data_o_size => rp_dcache_signals_mem_data_o_size,
    s_dcache_signals_mem_data_o_way => s_dcache_signals_mem_data_o_way,
    rp_dcache_signals_mem_data_o_way => rp_dcache_signals_mem_data_o_way,
    s_dcache_signals_mem_data_o_paddr => s_dcache_signals_mem_data_o_paddr,
    rp_dcache_signals_mem_data_o_paddr => rp_dcache_signals_mem_data_o_paddr,
    s_dcache_signals_mem_data_o_data => s_dcache_signals_mem_data_o_data,
    rp_dcache_signals_mem_data_o_data => rp_dcache_signals_mem_data_o_data,
    s_dcache_signals_mem_data_o_user => s_dcache_signals_mem_data_o_user,
    rp_dcache_signals_mem_data_o_user => rp_dcache_signals_mem_data_o_user,
    s_dcache_signals_mem_data_o_nc => s_dcache_signals_mem_data_o_nc,
    rp_dcache_signals_mem_data_o_nc => rp_dcache_signals_mem_data_o_nc,
    s_dcache_signals_mem_data_o_tid => s_dcache_signals_mem_data_o_tid,
    rp_dcache_signals_mem_data_o_tid => rp_dcache_signals_mem_data_o_tid,
    s_dcache_signals_mem_data_o_amo_op => s_dcache_signals_mem_data_o_amo_op,
    rp_dcache_signals_mem_data_o_amo_op => rp_dcache_signals_mem_data_o_amo_op,
    decouple => decouple
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

-- You must compile the wrapper file dfx_decoupler.vhd when simulating
-- the core, dfx_decoupler. When compiling the wrapper file, be sure to
-- reference the VHDL simulation library.



