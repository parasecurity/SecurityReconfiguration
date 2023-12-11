-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Tue Sep 26 12:57:51 2023
-- Host        : tom-tom running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/askyvalos/cva6/corev_apu/fpga/ariane_gui.gen/sources_1/ip/dfx_decoupler/dfx_decoupler_stub.vhdl
-- Design      : dfx_decoupler
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dfx_decoupler is
  Port ( 
    s_dcache_signals_clk_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_clk_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_rst_ni : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_rst_ni : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_enable_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_enable_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_flush_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_flush_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_flush_ack_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_flush_ack_o : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_miss_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_miss_o : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_wbuffer_empty_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_wbuffer_empty_o : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_wbuffer_not_ni_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_wbuffer_not_ni_o : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_amo_req_i_req : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_amo_req_i_req : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_amo_req_i_amo_op : in STD_LOGIC_VECTOR ( 3 downto 0 );
    rp_dcache_signals_amo_req_i_amo_op : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_dcache_signals_amo_req_i_size : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rp_dcache_signals_amo_req_i_size : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_dcache_signals_amo_req_i_operand_a : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_amo_req_i_operand_a : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_amo_req_i_operand_b : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_amo_req_i_operand_b : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_amo_resp_o_ack : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_amo_resp_o_ack : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_amo_resp_o_result : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_amo_resp_o_result : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_address_index1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    rp_dcache_signals_req_ports_i_address_index1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_dcache_signals_req_ports_i_address_tag1 : in STD_LOGIC_VECTOR ( 43 downto 0 );
    rp_dcache_signals_req_ports_i_address_tag1 : out STD_LOGIC_VECTOR ( 43 downto 0 );
    s_dcache_signals_req_ports_i_data_wdata1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_i_data_wdata1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_data_wuser1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_i_data_wuser1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_data_req1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_req1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_data_we1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_we1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_data_be1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rp_dcache_signals_req_ports_i_data_be1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_dcache_signals_req_ports_i_data_size1 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rp_dcache_signals_req_ports_i_data_size1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_dcache_signals_req_ports_i_data_id1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_id1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_kill_req1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_kill_req1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_tag_valid1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_tag_valid1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_gnt1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_gnt1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rvalid1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_rvalid1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rid1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_rid1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rdata1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_o_data_rdata1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_o_data_ruser1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_o_data_ruser1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_address_index2 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    rp_dcache_signals_req_ports_i_address_index2 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_dcache_signals_req_ports_i_address_tag2 : in STD_LOGIC_VECTOR ( 43 downto 0 );
    rp_dcache_signals_req_ports_i_address_tag2 : out STD_LOGIC_VECTOR ( 43 downto 0 );
    s_dcache_signals_req_ports_i_data_wdata2 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_i_data_wdata2 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_data_wuser2 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_i_data_wuser2 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_data_req2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_req2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_data_we2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_we2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_data_be2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rp_dcache_signals_req_ports_i_data_be2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_dcache_signals_req_ports_i_data_size2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rp_dcache_signals_req_ports_i_data_size2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_dcache_signals_req_ports_i_data_id2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_id2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_kill_req2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_kill_req2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_tag_valid2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_tag_valid2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_gnt2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_gnt2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rvalid2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_rvalid2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rid2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_rid2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rdata2 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_o_data_rdata2 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_o_data_ruser2 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_o_data_ruser2 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_address_index3 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    rp_dcache_signals_req_ports_i_address_index3 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_dcache_signals_req_ports_i_address_tag3 : in STD_LOGIC_VECTOR ( 43 downto 0 );
    rp_dcache_signals_req_ports_i_address_tag3 : out STD_LOGIC_VECTOR ( 43 downto 0 );
    s_dcache_signals_req_ports_i_data_wdata3 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_i_data_wdata3 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_data_wuser3 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_i_data_wuser3 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_i_data_req3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_req3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_data_we3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_we3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_data_be3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rp_dcache_signals_req_ports_i_data_be3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_dcache_signals_req_ports_i_data_size3 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rp_dcache_signals_req_ports_i_data_size3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_dcache_signals_req_ports_i_data_id3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_data_id3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_kill_req3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_kill_req3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_i_tag_valid3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_i_tag_valid3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_gnt3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_gnt3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rvalid3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_rvalid3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rid3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_req_ports_o_data_rid3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_req_ports_o_data_rdata3 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_o_data_rdata3 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_req_ports_o_data_ruser3 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_req_ports_o_data_ruser3 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_miss_vld_bits_o_1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rp_dcache_signals_miss_vld_bits_o_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_dcache_signals_miss_vld_bits_o_2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rp_dcache_signals_miss_vld_bits_o_2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_dcache_signals_miss_vld_bits_o_3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rp_dcache_signals_miss_vld_bits_o_3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_dcache_signals_mem_rtrn_vld_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_mem_rtrn_vld_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_mem_rtrn_i_rtype : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rp_dcache_signals_mem_rtrn_i_rtype : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_dcache_signals_mem_rtrn_i_data : in STD_LOGIC_VECTOR ( 127 downto 0 );
    rp_dcache_signals_mem_rtrn_i_data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_dcache_signals_mem_rtrn_i_user : in STD_LOGIC_VECTOR ( 127 downto 0 );
    rp_dcache_signals_mem_rtrn_i_user : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_dcache_signals_mem_rtrn_i_inv_vld : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_mem_rtrn_i_inv_vld : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_mem_rtrn_i_inv_all : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_mem_rtrn_i_inv_all : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_mem_rtrn_i_inv_idx : in STD_LOGIC_VECTOR ( 11 downto 0 );
    rp_dcache_signals_mem_rtrn_i_inv_idx : out STD_LOGIC_VECTOR ( 11 downto 0 );
    s_dcache_signals_mem_rtrn_i_inv_way : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rp_dcache_signals_mem_rtrn_i_inv_way : out STD_LOGIC_VECTOR ( 2 downto 0 );
    s_dcache_signals_mem_rtrn_i_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rp_dcache_signals_mem_rtrn_i_tid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_dcache_signals_mem_data_req_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_mem_data_req_o : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_mem_data_ack_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_mem_data_ack_i : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_mem_data_o_rtype : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rp_dcache_signals_mem_data_o_rtype : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_dcache_signals_mem_data_o_size : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rp_dcache_signals_mem_data_o_size : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_dcache_signals_mem_data_o_way : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rp_dcache_signals_mem_data_o_way : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_dcache_signals_mem_data_o_paddr : out STD_LOGIC_VECTOR ( 55 downto 0 );
    rp_dcache_signals_mem_data_o_paddr : in STD_LOGIC_VECTOR ( 55 downto 0 );
    s_dcache_signals_mem_data_o_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_mem_data_o_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_mem_data_o_user : out STD_LOGIC_VECTOR ( 63 downto 0 );
    rp_dcache_signals_mem_data_o_user : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_dcache_signals_mem_data_o_nc : out STD_LOGIC_VECTOR ( 0 to 0 );
    rp_dcache_signals_mem_data_o_nc : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_dcache_signals_mem_data_o_tid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rp_dcache_signals_mem_data_o_tid : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_dcache_signals_mem_data_o_amo_op : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rp_dcache_signals_mem_data_o_amo_op : in STD_LOGIC_VECTOR ( 3 downto 0 );
    decouple : in STD_LOGIC
  );

end dfx_decoupler;

architecture stub of dfx_decoupler is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_dcache_signals_clk_i[0:0],rp_dcache_signals_clk_i[0:0],s_dcache_signals_rst_ni[0:0],rp_dcache_signals_rst_ni[0:0],s_dcache_signals_enable_i[0:0],rp_dcache_signals_enable_i[0:0],s_dcache_signals_flush_i[0:0],rp_dcache_signals_flush_i[0:0],s_dcache_signals_flush_ack_o[0:0],rp_dcache_signals_flush_ack_o[0:0],s_dcache_signals_miss_o[0:0],rp_dcache_signals_miss_o[0:0],s_dcache_signals_wbuffer_empty_o[0:0],rp_dcache_signals_wbuffer_empty_o[0:0],s_dcache_signals_wbuffer_not_ni_o[0:0],rp_dcache_signals_wbuffer_not_ni_o[0:0],s_dcache_signals_amo_req_i_req[0:0],rp_dcache_signals_amo_req_i_req[0:0],s_dcache_signals_amo_req_i_amo_op[3:0],rp_dcache_signals_amo_req_i_amo_op[3:0],s_dcache_signals_amo_req_i_size[1:0],rp_dcache_signals_amo_req_i_size[1:0],s_dcache_signals_amo_req_i_operand_a[63:0],rp_dcache_signals_amo_req_i_operand_a[63:0],s_dcache_signals_amo_req_i_operand_b[63:0],rp_dcache_signals_amo_req_i_operand_b[63:0],s_dcache_signals_amo_resp_o_ack[0:0],rp_dcache_signals_amo_resp_o_ack[0:0],s_dcache_signals_amo_resp_o_result[63:0],rp_dcache_signals_amo_resp_o_result[63:0],s_dcache_signals_req_ports_i_address_index1[11:0],rp_dcache_signals_req_ports_i_address_index1[11:0],s_dcache_signals_req_ports_i_address_tag1[43:0],rp_dcache_signals_req_ports_i_address_tag1[43:0],s_dcache_signals_req_ports_i_data_wdata1[63:0],rp_dcache_signals_req_ports_i_data_wdata1[63:0],s_dcache_signals_req_ports_i_data_wuser1[63:0],rp_dcache_signals_req_ports_i_data_wuser1[63:0],s_dcache_signals_req_ports_i_data_req1[0:0],rp_dcache_signals_req_ports_i_data_req1[0:0],s_dcache_signals_req_ports_i_data_we1[0:0],rp_dcache_signals_req_ports_i_data_we1[0:0],s_dcache_signals_req_ports_i_data_be1[7:0],rp_dcache_signals_req_ports_i_data_be1[7:0],s_dcache_signals_req_ports_i_data_size1[1:0],rp_dcache_signals_req_ports_i_data_size1[1:0],s_dcache_signals_req_ports_i_data_id1[0:0],rp_dcache_signals_req_ports_i_data_id1[0:0],s_dcache_signals_req_ports_i_kill_req1[0:0],rp_dcache_signals_req_ports_i_kill_req1[0:0],s_dcache_signals_req_ports_i_tag_valid1[0:0],rp_dcache_signals_req_ports_i_tag_valid1[0:0],s_dcache_signals_req_ports_o_data_gnt1[0:0],rp_dcache_signals_req_ports_o_data_gnt1[0:0],s_dcache_signals_req_ports_o_data_rvalid1[0:0],rp_dcache_signals_req_ports_o_data_rvalid1[0:0],s_dcache_signals_req_ports_o_data_rid1[0:0],rp_dcache_signals_req_ports_o_data_rid1[0:0],s_dcache_signals_req_ports_o_data_rdata1[63:0],rp_dcache_signals_req_ports_o_data_rdata1[63:0],s_dcache_signals_req_ports_o_data_ruser1[63:0],rp_dcache_signals_req_ports_o_data_ruser1[63:0],s_dcache_signals_req_ports_i_address_index2[11:0],rp_dcache_signals_req_ports_i_address_index2[11:0],s_dcache_signals_req_ports_i_address_tag2[43:0],rp_dcache_signals_req_ports_i_address_tag2[43:0],s_dcache_signals_req_ports_i_data_wdata2[63:0],rp_dcache_signals_req_ports_i_data_wdata2[63:0],s_dcache_signals_req_ports_i_data_wuser2[63:0],rp_dcache_signals_req_ports_i_data_wuser2[63:0],s_dcache_signals_req_ports_i_data_req2[0:0],rp_dcache_signals_req_ports_i_data_req2[0:0],s_dcache_signals_req_ports_i_data_we2[0:0],rp_dcache_signals_req_ports_i_data_we2[0:0],s_dcache_signals_req_ports_i_data_be2[7:0],rp_dcache_signals_req_ports_i_data_be2[7:0],s_dcache_signals_req_ports_i_data_size2[1:0],rp_dcache_signals_req_ports_i_data_size2[1:0],s_dcache_signals_req_ports_i_data_id2[0:0],rp_dcache_signals_req_ports_i_data_id2[0:0],s_dcache_signals_req_ports_i_kill_req2[0:0],rp_dcache_signals_req_ports_i_kill_req2[0:0],s_dcache_signals_req_ports_i_tag_valid2[0:0],rp_dcache_signals_req_ports_i_tag_valid2[0:0],s_dcache_signals_req_ports_o_data_gnt2[0:0],rp_dcache_signals_req_ports_o_data_gnt2[0:0],s_dcache_signals_req_ports_o_data_rvalid2[0:0],rp_dcache_signals_req_ports_o_data_rvalid2[0:0],s_dcache_signals_req_ports_o_data_rid2[0:0],rp_dcache_signals_req_ports_o_data_rid2[0:0],s_dcache_signals_req_ports_o_data_rdata2[63:0],rp_dcache_signals_req_ports_o_data_rdata2[63:0],s_dcache_signals_req_ports_o_data_ruser2[63:0],rp_dcache_signals_req_ports_o_data_ruser2[63:0],s_dcache_signals_req_ports_i_address_index3[11:0],rp_dcache_signals_req_ports_i_address_index3[11:0],s_dcache_signals_req_ports_i_address_tag3[43:0],rp_dcache_signals_req_ports_i_address_tag3[43:0],s_dcache_signals_req_ports_i_data_wdata3[63:0],rp_dcache_signals_req_ports_i_data_wdata3[63:0],s_dcache_signals_req_ports_i_data_wuser3[63:0],rp_dcache_signals_req_ports_i_data_wuser3[63:0],s_dcache_signals_req_ports_i_data_req3[0:0],rp_dcache_signals_req_ports_i_data_req3[0:0],s_dcache_signals_req_ports_i_data_we3[0:0],rp_dcache_signals_req_ports_i_data_we3[0:0],s_dcache_signals_req_ports_i_data_be3[7:0],rp_dcache_signals_req_ports_i_data_be3[7:0],s_dcache_signals_req_ports_i_data_size3[1:0],rp_dcache_signals_req_ports_i_data_size3[1:0],s_dcache_signals_req_ports_i_data_id3[0:0],rp_dcache_signals_req_ports_i_data_id3[0:0],s_dcache_signals_req_ports_i_kill_req3[0:0],rp_dcache_signals_req_ports_i_kill_req3[0:0],s_dcache_signals_req_ports_i_tag_valid3[0:0],rp_dcache_signals_req_ports_i_tag_valid3[0:0],s_dcache_signals_req_ports_o_data_gnt3[0:0],rp_dcache_signals_req_ports_o_data_gnt3[0:0],s_dcache_signals_req_ports_o_data_rvalid3[0:0],rp_dcache_signals_req_ports_o_data_rvalid3[0:0],s_dcache_signals_req_ports_o_data_rid3[0:0],rp_dcache_signals_req_ports_o_data_rid3[0:0],s_dcache_signals_req_ports_o_data_rdata3[63:0],rp_dcache_signals_req_ports_o_data_rdata3[63:0],s_dcache_signals_req_ports_o_data_ruser3[63:0],rp_dcache_signals_req_ports_o_data_ruser3[63:0],s_dcache_signals_miss_vld_bits_o_1[7:0],rp_dcache_signals_miss_vld_bits_o_1[7:0],s_dcache_signals_miss_vld_bits_o_2[7:0],rp_dcache_signals_miss_vld_bits_o_2[7:0],s_dcache_signals_miss_vld_bits_o_3[7:0],rp_dcache_signals_miss_vld_bits_o_3[7:0],s_dcache_signals_mem_rtrn_vld_i[0:0],rp_dcache_signals_mem_rtrn_vld_i[0:0],s_dcache_signals_mem_rtrn_i_rtype[2:0],rp_dcache_signals_mem_rtrn_i_rtype[2:0],s_dcache_signals_mem_rtrn_i_data[127:0],rp_dcache_signals_mem_rtrn_i_data[127:0],s_dcache_signals_mem_rtrn_i_user[127:0],rp_dcache_signals_mem_rtrn_i_user[127:0],s_dcache_signals_mem_rtrn_i_inv_vld[0:0],rp_dcache_signals_mem_rtrn_i_inv_vld[0:0],s_dcache_signals_mem_rtrn_i_inv_all[0:0],rp_dcache_signals_mem_rtrn_i_inv_all[0:0],s_dcache_signals_mem_rtrn_i_inv_idx[11:0],rp_dcache_signals_mem_rtrn_i_inv_idx[11:0],s_dcache_signals_mem_rtrn_i_inv_way[2:0],rp_dcache_signals_mem_rtrn_i_inv_way[2:0],s_dcache_signals_mem_rtrn_i_tid[1:0],rp_dcache_signals_mem_rtrn_i_tid[1:0],s_dcache_signals_mem_data_req_o[0:0],rp_dcache_signals_mem_data_req_o[0:0],s_dcache_signals_mem_data_ack_i[0:0],rp_dcache_signals_mem_data_ack_i[0:0],s_dcache_signals_mem_data_o_rtype[1:0],rp_dcache_signals_mem_data_o_rtype[1:0],s_dcache_signals_mem_data_o_size[2:0],rp_dcache_signals_mem_data_o_size[2:0],s_dcache_signals_mem_data_o_way[2:0],rp_dcache_signals_mem_data_o_way[2:0],s_dcache_signals_mem_data_o_paddr[55:0],rp_dcache_signals_mem_data_o_paddr[55:0],s_dcache_signals_mem_data_o_data[63:0],rp_dcache_signals_mem_data_o_data[63:0],s_dcache_signals_mem_data_o_user[63:0],rp_dcache_signals_mem_data_o_user[63:0],s_dcache_signals_mem_data_o_nc[0:0],rp_dcache_signals_mem_data_o_nc[0:0],s_dcache_signals_mem_data_o_tid[1:0],rp_dcache_signals_mem_data_o_tid[1:0],s_dcache_signals_mem_data_o_amo_op[3:0],rp_dcache_signals_mem_data_o_amo_op[3:0],decouple";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dfx_decoupler_dfx_decoupler,Vivado 2022.2";
begin
end;