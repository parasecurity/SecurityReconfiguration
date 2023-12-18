// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// Author: Michael Schaffner <schaffner@iis.ee.ethz.ch>, ETH Zurich
// Date: 15.08.2018
// Description: Ariane cache subsystem that is compatible with the OpenPiton
//              coherent memory system.
//
//              Define PITON_ARIANE if you want to use this cache.
//              Define DCACHE_TYPE if you want to use this cache
//              with a standard 64 bit AXI interface instead of the OpenPiton
//              L1.5 interface.


module wt_cache_subsystem import ariane_pkg::*; import wt_cache_pkg::*; #(
  parameter ariane_pkg::ariane_cfg_t ArianeCfg       = ariane_pkg::ArianeDefaultConfig,  // contains cacheable regions
  parameter int unsigned NumPorts     = 3,
  parameter int unsigned AxiAddrWidth = 0,
  parameter int unsigned AxiDataWidth = 0,
  parameter int unsigned AxiIdWidth   = 0,
  parameter type axi_req_t = ariane_axi::req_t,
  parameter type axi_rsp_t = ariane_axi::resp_t
) (
  input logic                            clk_i,
  input logic                            rst_ni,
  // I$
  input  logic                           icache_en_i,            // enable icache (or bypass e.g: in debug mode)
  input  logic                           icache_flush_i,         // flush the icache, flush and kill have to be asserted together
  output logic                           icache_miss_o,          // to performance counter
  // address translation requests
  input  icache_areq_i_t                 icache_areq_i,          // to/from frontend
  output icache_areq_o_t                 icache_areq_o,
  // data requests
  input  icache_dreq_i_t                 icache_dreq_i,          // to/from frontend
  output icache_dreq_o_t                 icache_dreq_o,
  // D$
  // Cache management
  input  logic                           dcache_enable_i,        // from CSR
  input  logic                           dcache_flush_i,         // high until acknowledged
  output logic                           dcache_flush_ack_o,     // send a single cycle acknowledge signal when the cache is flushed
  output logic                           dcache_miss_o,          // we missed on a ld/st
  // For Performance Counter
  output logic [NumPorts-1:0][DCACHE_SET_ASSOC-1:0]    miss_vld_bits_o,
  // AMO interface
  input amo_req_t                        dcache_amo_req_i,
  output amo_resp_t                      dcache_amo_resp_o,
  // Request ports
  input  dcache_req_i_t   [2:0]          dcache_req_ports_i,     // to/from LSU
  output dcache_req_o_t   [2:0]          dcache_req_ports_o,     // to/from LSU
  // writebuffer status
  output logic                           wbuffer_empty_o,
  output logic                           wbuffer_not_ni_o,
`ifdef PITON_ARIANE
  // L15 (memory side)
  output l15_req_t                       l15_req_o,
  input  l15_rtrn_t                      l15_rtrn_i
`else
  // memory side
  output axi_req_t                       axi_req_o,
  input  axi_rsp_t                       axi_resp_i,
`endif
  input  logic                           rp_reset_i,
  input  logic                           dfx_decouple,
  input  logic                           shutdown_req,
  output logic                           shutdown_ack,
  output logic [7:0]                     led_tests 
  // TODO: interrupt interface
);

  logic icache_adapter_data_req, adapter_icache_data_ack, adapter_icache_rtrn_vld;
  wt_cache_pkg::icache_req_t  icache_adapter;
  wt_cache_pkg::icache_rtrn_t adapter_icache;


  logic dcache_adapter_data_req, adapter_dcache_data_ack, adapter_dcache_rtrn_vld;
  wt_cache_pkg::dcache_req_t  dcache_adapter;
  wt_cache_pkg::dcache_rtrn_t adapter_dcache;

  cva6_icache #(
    // use ID 0 for icache reads
    .RdTxId             ( 0             ),
    .ArianeCfg          ( ArianeCfg     )
  ) i_cva6_icache (
    .clk_i              ( clk_i                   ),
    .rst_ni             ( rst_ni                  ),
    .flush_i            ( icache_flush_i          ),
    .en_i               ( icache_en_i             ),
    .miss_o             ( icache_miss_o           ),
    .areq_i             ( icache_areq_i           ),
    .areq_o             ( icache_areq_o           ),
    .dreq_i             ( icache_dreq_i           ),
    .dreq_o             ( icache_dreq_o           ),
    .mem_rtrn_vld_i     ( adapter_icache_rtrn_vld ),
    .mem_rtrn_i         ( adapter_icache          ),
    .mem_data_req_o     ( icache_adapter_data_req ),
    .mem_data_ack_i     ( adapter_icache_data_ack ),
    .mem_data_o         ( icache_adapter          )
  );

  //Decoupling signals
  logic rp_dcache_adapter_data_req, rp_adapter_dcache_data_ack, rp_adapter_dcache_rtrn_vld;
  wt_cache_pkg::dcache_req_t  rp_dcache_adapter;
  wt_cache_pkg::dcache_rtrn_t rp_adapter_dcache;

  logic   rp_clk_i, rp_rst_ni;
  logic   rp_dcache_enable_i, rp_dcache_flush_i, rp_dcache_flush_ack_o, rp_dcache_miss_o;
//  logic [NumPorts-1:0][DCACHE_SET_ASSOC-1:0]  rp_miss_vld_bits_o;
  ariane_pkg::amo_req_t                       rp_dcache_amo_req_i;
  amo_resp_t                                  rp_dcache_amo_resp_o;
  ariane_pkg::dcache_req_i_t   [2:0]          rp_dcache_req_ports_i;   
  ariane_pkg::dcache_req_o_t   [2:0]          rp_dcache_req_ports_o;    
  logic    rp_wbuffer_empty_o;
  logic    rp_wbuffer_not_ni_o;
  

  logic dcache_rst_n;
  assign dcache_rst_n = rst_ni & ~rp_reset_i;
  

  //Decoupling mechanism for the cache
  dfx_decoupler i_dfx_decoupler (
    .s_dcache_signals_clk_i            ( clk_i                      ),
    .rp_dcache_signals_clk_i           ( rp_clk_i                   ),
    .s_dcache_signals_rst_ni           ( dcache_rst_n               ),
    .rp_dcache_signals_rst_ni          ( rp_rst_ni                  ),
    .s_dcache_signals_enable_i         ( dcache_enable_i            ),
    .rp_dcache_signals_enable_i        ( rp_dcache_enable_i         ),
    .s_dcache_signals_flush_i          ( dcache_flush_i             ),
    .rp_dcache_signals_flush_i         ( rp_dcache_flush_i          ),
    .s_dcache_signals_flush_ack_o      ( dcache_flush_ack_o         ),
    .rp_dcache_signals_flush_ack_o     ( rp_dcache_flush_ack_o      ),
    .s_dcache_signals_miss_o           ( dcache_miss_o              ),
    .rp_dcache_signals_miss_o          ( rp_dcache_miss_o           ),
    .s_dcache_signals_wbuffer_empty_o  ( wbuffer_empty_o            ),
    .rp_dcache_signals_wbuffer_empty_o ( rp_wbuffer_empty_o         ),
    .s_dcache_signals_wbuffer_not_ni_o  ( wbuffer_not_ni_o          ),
    .rp_dcache_signals_wbuffer_not_ni_o ( rp_wbuffer_not_ni_o       ),
    .s_dcache_signals_amo_req_i_req           ( dcache_amo_req_i.req           ),
    .rp_dcache_signals_amo_req_i_req          ( rp_dcache_amo_req_i.req        ),
    .s_dcache_signals_amo_req_i_amo_op        ( dcache_amo_req_i.amo_op        ),
    .rp_dcache_signals_amo_req_i_amo_op       ( rp_dcache_amo_req_i.amo_op     ),
    .s_dcache_signals_amo_req_i_size          ( dcache_amo_req_i.size          ),
    .rp_dcache_signals_amo_req_i_size         ( rp_dcache_amo_req_i.size       ),
    .s_dcache_signals_amo_req_i_operand_a     ( dcache_amo_req_i.operand_a     ),
    .rp_dcache_signals_amo_req_i_operand_a    ( rp_dcache_amo_req_i.operand_a  ),
    .s_dcache_signals_amo_req_i_operand_b     ( dcache_amo_req_i.operand_b     ),
    .rp_dcache_signals_amo_req_i_operand_b    ( rp_dcache_amo_req_i.operand_b  ), 
    .s_dcache_signals_amo_resp_o_ack          ( dcache_amo_resp_o.ack          ),
    .rp_dcache_signals_amo_resp_o_ack         ( rp_dcache_amo_resp_o.ack       ),
    .s_dcache_signals_amo_resp_o_result       ( dcache_amo_resp_o.result       ),
    .rp_dcache_signals_amo_resp_o_result      ( rp_dcache_amo_resp_o.result    ),
    .s_dcache_signals_req_ports_i_address_index1       ( dcache_req_ports_i[0].address_index    ),
    .rp_dcache_signals_req_ports_i_address_index1      ( rp_dcache_req_ports_i[0].address_index ),
    .s_dcache_signals_req_ports_i_address_tag1         ( dcache_req_ports_i[0].address_tag      ),
    .rp_dcache_signals_req_ports_i_address_tag1        ( rp_dcache_req_ports_i[0].address_tag   ),
    .s_dcache_signals_req_ports_i_data_wdata1          ( dcache_req_ports_i[0].data_wdata       ),
    .rp_dcache_signals_req_ports_i_data_wdata1         ( rp_dcache_req_ports_i[0].data_wdata    ),
    .s_dcache_signals_req_ports_i_data_wuser1          ( dcache_req_ports_i[0].data_wuser       ),
    .rp_dcache_signals_req_ports_i_data_wuser1         ( rp_dcache_req_ports_i[0].data_wuser    ),
    .s_dcache_signals_req_ports_i_data_req1            ( dcache_req_ports_i[0].data_req         ),
    .rp_dcache_signals_req_ports_i_data_req1           ( rp_dcache_req_ports_i[0].data_req      ),
    .s_dcache_signals_req_ports_i_data_we1             ( dcache_req_ports_i[0].data_we          ),
    .rp_dcache_signals_req_ports_i_data_we1            ( rp_dcache_req_ports_i[0].data_we       ),
    .s_dcache_signals_req_ports_i_data_be1             ( dcache_req_ports_i[0].data_be          ),
    .rp_dcache_signals_req_ports_i_data_be1            ( rp_dcache_req_ports_i[0].data_be       ),
    .s_dcache_signals_req_ports_i_data_size1           ( dcache_req_ports_i[0].data_size        ),
    .rp_dcache_signals_req_ports_i_data_size1          ( rp_dcache_req_ports_i[0].data_size     ),
    .s_dcache_signals_req_ports_i_data_id1             ( dcache_req_ports_i[0].data_id          ),
    .rp_dcache_signals_req_ports_i_data_id1            ( rp_dcache_req_ports_i[0].data_id       ),
    .s_dcache_signals_req_ports_i_kill_req1            ( dcache_req_ports_i[0].kill_req         ),
    .rp_dcache_signals_req_ports_i_kill_req1           ( rp_dcache_req_ports_i[0].kill_req      ),
    .s_dcache_signals_req_ports_i_tag_valid1           ( dcache_req_ports_i[0].tag_valid        ),
    .rp_dcache_signals_req_ports_i_tag_valid1          ( rp_dcache_req_ports_i[0].tag_valid     ),
    .s_dcache_signals_req_ports_o_data_gnt1            ( dcache_req_ports_o[0].data_gnt         ),
    .rp_dcache_signals_req_ports_o_data_gnt1           ( rp_dcache_req_ports_o[0].data_gnt      ),
    .s_dcache_signals_req_ports_o_data_rvalid1         ( dcache_req_ports_o[0].data_rvalid      ),
    .rp_dcache_signals_req_ports_o_data_rvalid1        ( rp_dcache_req_ports_o[0].data_rvalid   ),
    .s_dcache_signals_req_ports_o_data_rid1            ( dcache_req_ports_o[0].data_rid         ),
    .rp_dcache_signals_req_ports_o_data_rid1           ( rp_dcache_req_ports_o[0].data_rid      ),
    .s_dcache_signals_req_ports_o_data_rdata1          ( dcache_req_ports_o[0].data_rdata       ),
    .rp_dcache_signals_req_ports_o_data_rdata1         ( rp_dcache_req_ports_o[0].data_rdata    ),
    .s_dcache_signals_req_ports_o_data_ruser1          ( dcache_req_ports_o[0].data_ruser       ),
    .rp_dcache_signals_req_ports_o_data_ruser1         ( rp_dcache_req_ports_o[0].data_ruser    ),
    .s_dcache_signals_req_ports_i_address_index2       ( dcache_req_ports_i[1].address_index    ),
    .rp_dcache_signals_req_ports_i_address_index2      ( rp_dcache_req_ports_i[1].address_index ),
    .s_dcache_signals_req_ports_i_address_tag2         ( dcache_req_ports_i[1].address_tag      ),
    .rp_dcache_signals_req_ports_i_address_tag2        ( rp_dcache_req_ports_i[1].address_tag   ),
    .s_dcache_signals_req_ports_i_data_wdata2          ( dcache_req_ports_i[1].data_wdata       ),
    .rp_dcache_signals_req_ports_i_data_wdata2         ( rp_dcache_req_ports_i[1].data_wdata    ),
    .s_dcache_signals_req_ports_i_data_wuser2          ( dcache_req_ports_i[1].data_wuser       ),
    .rp_dcache_signals_req_ports_i_data_wuser2         ( rp_dcache_req_ports_i[1].data_wuser    ),
    .s_dcache_signals_req_ports_i_data_req2            ( dcache_req_ports_i[1].data_req         ),
    .rp_dcache_signals_req_ports_i_data_req2           ( rp_dcache_req_ports_i[1].data_req      ),
    .s_dcache_signals_req_ports_i_data_we2             ( dcache_req_ports_i[1].data_we          ),
    .rp_dcache_signals_req_ports_i_data_we2            ( rp_dcache_req_ports_i[1].data_we       ),
    .s_dcache_signals_req_ports_i_data_be2             ( dcache_req_ports_i[1].data_be          ),
    .rp_dcache_signals_req_ports_i_data_be2            ( rp_dcache_req_ports_i[1].data_be       ),
    .s_dcache_signals_req_ports_i_data_size2           ( dcache_req_ports_i[1].data_size        ),
    .rp_dcache_signals_req_ports_i_data_size2          ( rp_dcache_req_ports_i[1].data_size     ),
    .s_dcache_signals_req_ports_i_data_id2             ( dcache_req_ports_i[1].data_id          ),
    .rp_dcache_signals_req_ports_i_data_id2            ( rp_dcache_req_ports_i[1].data_id       ),
    .s_dcache_signals_req_ports_i_kill_req2            ( dcache_req_ports_i[1].kill_req         ),
    .rp_dcache_signals_req_ports_i_kill_req2           ( rp_dcache_req_ports_i[1].kill_req      ),
    .s_dcache_signals_req_ports_i_tag_valid2           ( dcache_req_ports_i[1].tag_valid        ),
    .rp_dcache_signals_req_ports_i_tag_valid2          ( rp_dcache_req_ports_i[1].tag_valid     ),
    .s_dcache_signals_req_ports_o_data_gnt2            ( dcache_req_ports_o[1].data_gnt         ),
    .rp_dcache_signals_req_ports_o_data_gnt2           ( rp_dcache_req_ports_o[1].data_gnt      ),
    .s_dcache_signals_req_ports_o_data_rvalid2         ( dcache_req_ports_o[1].data_rvalid      ),
    .rp_dcache_signals_req_ports_o_data_rvalid2        ( rp_dcache_req_ports_o[1].data_rvalid   ),
    .s_dcache_signals_req_ports_o_data_rid2            ( dcache_req_ports_o[1].data_rid         ),
    .rp_dcache_signals_req_ports_o_data_rid2           ( rp_dcache_req_ports_o[1].data_rid      ),
    .s_dcache_signals_req_ports_o_data_rdata2          ( dcache_req_ports_o[1].data_rdata       ),
    .rp_dcache_signals_req_ports_o_data_rdata2         ( rp_dcache_req_ports_o[1].data_rdata    ),
    .s_dcache_signals_req_ports_o_data_ruser2          ( dcache_req_ports_o[1].data_ruser       ),
    .rp_dcache_signals_req_ports_o_data_ruser2         ( rp_dcache_req_ports_o[1].data_ruser    ),
    .s_dcache_signals_req_ports_i_address_index3       ( dcache_req_ports_i[2].address_index    ),
    .rp_dcache_signals_req_ports_i_address_index3      ( rp_dcache_req_ports_i[2].address_index ),
    .s_dcache_signals_req_ports_i_address_tag3         ( dcache_req_ports_i[2].address_tag      ),
    .rp_dcache_signals_req_ports_i_address_tag3        ( rp_dcache_req_ports_i[2].address_tag   ),
    .s_dcache_signals_req_ports_i_data_wdata3          ( dcache_req_ports_i[2].data_wdata       ),
    .rp_dcache_signals_req_ports_i_data_wdata3         ( rp_dcache_req_ports_i[2].data_wdata    ),
    .s_dcache_signals_req_ports_i_data_wuser3          ( dcache_req_ports_i[2].data_wuser       ),
    .rp_dcache_signals_req_ports_i_data_wuser3         ( rp_dcache_req_ports_i[2].data_wuser    ),
    .s_dcache_signals_req_ports_i_data_req3            ( dcache_req_ports_i[2].data_req         ),
    .rp_dcache_signals_req_ports_i_data_req3           ( rp_dcache_req_ports_i[2].data_req      ),
    .s_dcache_signals_req_ports_i_data_we3             ( dcache_req_ports_i[2].data_we          ),
    .rp_dcache_signals_req_ports_i_data_we3            ( rp_dcache_req_ports_i[2].data_we       ),
    .s_dcache_signals_req_ports_i_data_be3             ( dcache_req_ports_i[2].data_be          ),
    .rp_dcache_signals_req_ports_i_data_be3            ( rp_dcache_req_ports_i[2].data_be       ),
    .s_dcache_signals_req_ports_i_data_size3           ( dcache_req_ports_i[2].data_size        ),
    .rp_dcache_signals_req_ports_i_data_size3          ( rp_dcache_req_ports_i[2].data_size     ),
    .s_dcache_signals_req_ports_i_data_id3             ( dcache_req_ports_i[2].data_id          ),
    .rp_dcache_signals_req_ports_i_data_id3            ( rp_dcache_req_ports_i[2].data_id       ),
    .s_dcache_signals_req_ports_i_kill_req3            ( dcache_req_ports_i[2].kill_req         ),
    .rp_dcache_signals_req_ports_i_kill_req3           ( rp_dcache_req_ports_i[2].kill_req      ),
    .s_dcache_signals_req_ports_i_tag_valid3           ( dcache_req_ports_i[2].tag_valid        ),
    .rp_dcache_signals_req_ports_i_tag_valid3          ( rp_dcache_req_ports_i[2].tag_valid     ),
    .s_dcache_signals_req_ports_o_data_gnt3            ( dcache_req_ports_o[2].data_gnt         ),
    .rp_dcache_signals_req_ports_o_data_gnt3           ( rp_dcache_req_ports_o[2].data_gnt      ),
    .s_dcache_signals_req_ports_o_data_rvalid3         ( dcache_req_ports_o[2].data_rvalid      ),
    .rp_dcache_signals_req_ports_o_data_rvalid3        ( rp_dcache_req_ports_o[2].data_rvalid   ),
    .s_dcache_signals_req_ports_o_data_rid3            ( dcache_req_ports_o[2].data_rid         ),
    .rp_dcache_signals_req_ports_o_data_rid3           ( rp_dcache_req_ports_o[2].data_rid      ),
    .s_dcache_signals_req_ports_o_data_rdata3          ( dcache_req_ports_o[2].data_rdata       ),
    .rp_dcache_signals_req_ports_o_data_rdata3         ( rp_dcache_req_ports_o[2].data_rdata    ),
    .s_dcache_signals_req_ports_o_data_ruser3          ( dcache_req_ports_o[2].data_ruser       ),
    .rp_dcache_signals_req_ports_o_data_ruser3         ( rp_dcache_req_ports_o[2].data_ruser    ),
    .s_dcache_signals_miss_vld_bits_o_1       (             ),
    .rp_dcache_signals_miss_vld_bits_o_1      (    '0      ),
    .s_dcache_signals_miss_vld_bits_o_2       (             ),
    .rp_dcache_signals_miss_vld_bits_o_2      ( '0         ),
    .s_dcache_signals_miss_vld_bits_o_3       (             ),
    .rp_dcache_signals_miss_vld_bits_o_3      ( '0        ),
    .s_dcache_signals_mem_rtrn_vld_i      ( adapter_dcache_rtrn_vld    ),
    .rp_dcache_signals_mem_rtrn_vld_i     ( rp_adapter_dcache_rtrn_vld ),
    .s_dcache_signals_mem_rtrn_i_rtype        ( adapter_dcache.rtype          ),
    .rp_dcache_signals_mem_rtrn_i_rtype       ( rp_adapter_dcache.rtype       ),
    .s_dcache_signals_mem_rtrn_i_data         ( adapter_dcache.data           ),
    .rp_dcache_signals_mem_rtrn_i_data        ( rp_adapter_dcache.data        ),
    .s_dcache_signals_mem_rtrn_i_user         ( adapter_dcache.user           ),
    .rp_dcache_signals_mem_rtrn_i_user        ( rp_adapter_dcache.user        ),
    .s_dcache_signals_mem_rtrn_i_inv_vld      ( adapter_dcache.inv.vld        ),
    .rp_dcache_signals_mem_rtrn_i_inv_vld     ( rp_adapter_dcache.inv.vld     ),
    .s_dcache_signals_mem_rtrn_i_inv_all      ( adapter_dcache.inv.all        ),
    .rp_dcache_signals_mem_rtrn_i_inv_all     ( rp_adapter_dcache.inv.all     ),
    .s_dcache_signals_mem_rtrn_i_inv_idx      ( adapter_dcache.inv.idx        ),
    .rp_dcache_signals_mem_rtrn_i_inv_idx     ( rp_adapter_dcache.inv.idx     ),
    .s_dcache_signals_mem_rtrn_i_inv_way      ( adapter_dcache.inv.way        ),
    .rp_dcache_signals_mem_rtrn_i_inv_way     (      ), //dont connect inv.way output from axi_adapter to cache, since its not used anyways
    .s_dcache_signals_mem_rtrn_i_tid          ( adapter_dcache.tid            ),
    .rp_dcache_signals_mem_rtrn_i_tid         ( rp_adapter_dcache.tid         ),
    .s_dcache_signals_mem_data_req_o   ( dcache_adapter_data_req    ),
    .rp_dcache_signals_mem_data_req_o  ( rp_dcache_adapter_data_req ),
    .s_dcache_signals_mem_data_ack_i   ( adapter_dcache_data_ack    ),
    .rp_dcache_signals_mem_data_ack_i  ( rp_adapter_dcache_data_ack ),
    .s_dcache_signals_mem_data_o_rtype        ( dcache_adapter.rtype          ),
    .rp_dcache_signals_mem_data_o_rtype       ( rp_dcache_adapter.rtype       ),
    .s_dcache_signals_mem_data_o_size         ( dcache_adapter.size           ),
    .rp_dcache_signals_mem_data_o_size        ( rp_dcache_adapter.size        ),
    .s_dcache_signals_mem_data_o_way          ( dcache_adapter.way            ),
    .rp_dcache_signals_mem_data_o_way         ( '0         ), //way output from cache to mem is not used so just assign 0 to it
    .s_dcache_signals_mem_data_o_paddr        ( dcache_adapter.paddr          ),
    .rp_dcache_signals_mem_data_o_paddr       ( rp_dcache_adapter.paddr       ),
    .s_dcache_signals_mem_data_o_data         ( dcache_adapter.data           ),
    .rp_dcache_signals_mem_data_o_data        ( rp_dcache_adapter.data        ),
    .s_dcache_signals_mem_data_o_user         ( dcache_adapter.user           ),
    .rp_dcache_signals_mem_data_o_user        ( rp_dcache_adapter.user        ),
    .s_dcache_signals_mem_data_o_nc           ( dcache_adapter.nc             ),
    .rp_dcache_signals_mem_data_o_nc          ( rp_dcache_adapter.nc          ),
    .s_dcache_signals_mem_data_o_tid          ( dcache_adapter.tid            ),
    .rp_dcache_signals_mem_data_o_tid         ( rp_dcache_adapter.tid         ),
    .s_dcache_signals_mem_data_o_amo_op       ( dcache_adapter.amo_op         ),
    .rp_dcache_signals_mem_data_o_amo_op      ( rp_dcache_adapter.amo_op      ),
    .decouple                             (dfx_decouple)
  );



  reg rm_shutdown_ack = 0;
  reg[15:0] shutdown_cntr = '0;
  always @(posedge clk_i) begin
    if(shutdown_req) begin
      shutdown_cntr <= shutdown_cntr +1;
      //give the cache 2000 cycles  to finish any req before partial reconfiguration begins
      if(shutdown_cntr == 16'd2000) begin
        rm_shutdown_ack <= 1;
      end
    end
    else begin
      shutdown_cntr <= '0;
      rm_shutdown_ack <= 0;
    end
  end
  
  assign shutdown_ack = rm_shutdown_ack;
  
  //count time cost of partial reconfiguration
  reg [31:0] pr_cycles;
  initial pr_cycles = '0;
  
  always @(posedge clk_i) begin
    if(shutdown_req) begin
        pr_cycles <= pr_cycles +1;
    end
    else begin
        pr_cycles <= '0;
    end
  end  

  // Note:
  // Ports 0/1 for PTW and LD unit are read only.
  // they have equal prio and are RR arbited
  // Port 2 is write only and goes into the merging write buffer
  wt_dcache dcache (
    .clk_i           ( rp_clk_i                   ),
    .rst_ni          ( rp_rst_ni                  ),
    .enable_i        ( rp_dcache_enable_i         ),
    .flush_i         ( rp_dcache_flush_i          ),
    .flush_ack_o     ( rp_dcache_flush_ack_o      ),
    .miss_o          ( rp_dcache_miss_o           ),
    .wbuffer_empty_o ( rp_wbuffer_empty_o         ),
    .wbuffer_not_ni_o ( rp_wbuffer_not_ni_o       ),
    .amo_req_i_req          ( rp_dcache_amo_req_i.req        ),
    .amo_req_i_amo_op       ( rp_dcache_amo_req_i.amo_op     ),
    .amo_req_i_size         ( rp_dcache_amo_req_i.size       ),
    .amo_req_i_operand_a    ( rp_dcache_amo_req_i.operand_a  ),
    .amo_req_i_operand_b    ( rp_dcache_amo_req_i.operand_b  ), 
    .amo_resp_o_ack         ( rp_dcache_amo_resp_o.ack       ),
    .amo_resp_o_result      ( rp_dcache_amo_resp_o.result    ),
    .req_ports_i_address_index1      ( rp_dcache_req_ports_i[0].address_index ),
    .req_ports_i_address_tag1        ( rp_dcache_req_ports_i[0].address_tag   ),
    .req_ports_i_data_wdata1         ( rp_dcache_req_ports_i[0].data_wdata    ),
    .req_ports_i_data_wuser1         ( rp_dcache_req_ports_i[0].data_wuser    ),
    .req_ports_i_data_req1           ( rp_dcache_req_ports_i[0].data_req      ),
    .req_ports_i_data_we1            ( rp_dcache_req_ports_i[0].data_we       ),
    .req_ports_i_data_be1            ( rp_dcache_req_ports_i[0].data_be       ),
    .req_ports_i_data_size1          ( rp_dcache_req_ports_i[0].data_size     ),
    .req_ports_i_data_id1            ( rp_dcache_req_ports_i[0].data_id       ),
    .req_ports_i_kill_req1           ( rp_dcache_req_ports_i[0].kill_req      ),
    .req_ports_i_tag_valid1          ( rp_dcache_req_ports_i[0].tag_valid     ),
    .req_ports_o_data_gnt1           ( rp_dcache_req_ports_o[0].data_gnt      ),
    .req_ports_o_data_rvalid1        ( rp_dcache_req_ports_o[0].data_rvalid   ),
    .req_ports_o_data_rid1           ( rp_dcache_req_ports_o[0].data_rid      ),
    .req_ports_o_data_rdata1         ( rp_dcache_req_ports_o[0].data_rdata    ),
    .req_ports_o_data_ruser1         ( rp_dcache_req_ports_o[0].data_ruser    ),
    .req_ports_i_address_index2      ( rp_dcache_req_ports_i[1].address_index ),
    .req_ports_i_address_tag2        ( rp_dcache_req_ports_i[1].address_tag   ),
    .req_ports_i_data_wdata2         ( rp_dcache_req_ports_i[1].data_wdata    ),
    .req_ports_i_data_wuser2         ( rp_dcache_req_ports_i[1].data_wuser    ),
    .req_ports_i_data_req2           ( rp_dcache_req_ports_i[1].data_req      ),
    .req_ports_i_data_we2            ( rp_dcache_req_ports_i[1].data_we       ),
    .req_ports_i_data_be2            ( rp_dcache_req_ports_i[1].data_be       ),
    .req_ports_i_data_size2          ( rp_dcache_req_ports_i[1].data_size     ),
    .req_ports_i_data_id2            ( rp_dcache_req_ports_i[1].data_id       ),
    .req_ports_i_kill_req2           ( rp_dcache_req_ports_i[1].kill_req      ),
    .req_ports_i_tag_valid2          ( rp_dcache_req_ports_i[1].tag_valid     ),
    .req_ports_o_data_gnt2           ( rp_dcache_req_ports_o[1].data_gnt      ),
    .req_ports_o_data_rvalid2        ( rp_dcache_req_ports_o[1].data_rvalid   ),
    .req_ports_o_data_rid2           ( rp_dcache_req_ports_o[1].data_rid      ),
    .req_ports_o_data_rdata2         ( rp_dcache_req_ports_o[1].data_rdata    ),
    .req_ports_o_data_ruser2         ( rp_dcache_req_ports_o[1].data_ruser    ),
    .req_ports_i_address_index3      ( rp_dcache_req_ports_i[2].address_index ),
    .req_ports_i_address_tag3        ( rp_dcache_req_ports_i[2].address_tag   ),
    .req_ports_i_data_wdata3         ( rp_dcache_req_ports_i[2].data_wdata    ),
    .req_ports_i_data_wuser3         ( rp_dcache_req_ports_i[2].data_wuser    ),
    .req_ports_i_data_req3           ( rp_dcache_req_ports_i[2].data_req      ),
    .req_ports_i_data_we3            ( rp_dcache_req_ports_i[2].data_we       ),
    .req_ports_i_data_be3            ( rp_dcache_req_ports_i[2].data_be       ),
    .req_ports_i_data_size3          ( rp_dcache_req_ports_i[2].data_size     ),
    .req_ports_i_data_id3            ( rp_dcache_req_ports_i[2].data_id       ),
    .req_ports_i_kill_req3           ( rp_dcache_req_ports_i[2].kill_req      ),
    .req_ports_i_tag_valid3          ( rp_dcache_req_ports_i[2].tag_valid     ),
    .req_ports_o_data_gnt3           ( rp_dcache_req_ports_o[2].data_gnt      ),
    .req_ports_o_data_rvalid3        ( rp_dcache_req_ports_o[2].data_rvalid   ),
    .req_ports_o_data_rid3           ( rp_dcache_req_ports_o[2].data_rid      ),
    .req_ports_o_data_rdata3         ( rp_dcache_req_ports_o[2].data_rdata    ),
    .req_ports_o_data_ruser3         ( rp_dcache_req_ports_o[2].data_ruser    ),
    //disconnect miss vld bits ports
//    .miss_vld_bits_o_1      (         ),
//    .miss_vld_bits_o_2      (         ),
//    .miss_vld_bits_o_3      (         ),
    .mem_rtrn_vld_i     ( rp_adapter_dcache_rtrn_vld ),
    .mem_rtrn_i_rtype       ( rp_adapter_dcache.rtype       ),
    .mem_rtrn_i_data        ( rp_adapter_dcache.data        ),
    .mem_rtrn_i_user        ( rp_adapter_dcache.user        ),
    .mem_rtrn_i_inv_vld     ( rp_adapter_dcache.inv.vld     ),
    .mem_rtrn_i_inv_all     ( rp_adapter_dcache.inv.all     ),
    .mem_rtrn_i_inv_idx     ( rp_adapter_dcache.inv.idx     ),
//    .mem_rtrn_i_inv_way     ( rp_adapter_dcache.inv.way     ),
    .mem_rtrn_i_tid         ( rp_adapter_dcache.tid         ),
    .mem_data_req_o  ( rp_dcache_adapter_data_req ),
    .mem_data_ack_i  ( rp_adapter_dcache_data_ack ),
    .mem_data_o_rtype       ( rp_dcache_adapter.rtype       ),
    .mem_data_o_size        ( rp_dcache_adapter.size        ),
//    .mem_data_o_way         ( rp_dcache_adapter.way         ),
    .mem_data_o_paddr       ( rp_dcache_adapter.paddr       ),
    .mem_data_o_data        ( rp_dcache_adapter.data        ),
    .mem_data_o_user        ( rp_dcache_adapter.user        ),
    .mem_data_o_nc          ( rp_dcache_adapter.nc          ),
    .mem_data_o_tid         ( rp_dcache_adapter.tid         ),
    .mem_data_o_amo_op      ( rp_dcache_adapter.amo_op      ),
    .led_tests              ( led_tests )
  );

assign miss_vld_bits_o[0] = '0;
assign miss_vld_bits_o[1] = '0;
assign miss_vld_bits_o[2] = '0;


///////////////////////////////////////////////////////
// memory plumbing, either use 64bit AXI port or native
// L15 cache interface (derived from OpenSPARC CCX).
///////////////////////////////////////////////////////

`ifdef PITON_ARIANE
  wt_l15_adapter #(
    .SwapEndianess   ( ArianeCfg.SwapEndianess )
  ) i_adapter (
    .clk_i              ( clk_i                   ),
    .rst_ni             ( rst_ni                  ),
    .icache_data_req_i  ( icache_adapter_data_req ),
    .icache_data_ack_o  ( adapter_icache_data_ack ),
    .icache_data_i      ( icache_adapter          ),
    .icache_rtrn_vld_o  ( adapter_icache_rtrn_vld ),
    .icache_rtrn_o      ( adapter_icache          ),
    .dcache_data_req_i  ( dcache_adapter_data_req ),
    .dcache_data_ack_o  ( adapter_dcache_data_ack ),
    .dcache_data_i      ( dcache_adapter          ),
    .dcache_rtrn_vld_o  ( adapter_dcache_rtrn_vld ),
    .dcache_rtrn_o      ( adapter_dcache          ),
    .l15_req_o          ( l15_req_o               ),
    .l15_rtrn_i         ( l15_rtrn_i              )
  );
`else
  wt_axi_adapter #(
    .AxiAddrWidth       ( AxiAddrWidth ),
    .AxiDataWidth       ( AxiDataWidth ),
    .AxiIdWidth         ( AxiIdWidth ),
    .axi_req_t          ( axi_req_t ),
    .axi_rsp_t          ( axi_rsp_t )
  ) i_adapter (
    .clk_i              ( clk_i                   ),
    .rst_ni             ( rst_ni                  ),
    .icache_data_req_i  ( icache_adapter_data_req ),
    .icache_data_ack_o  ( adapter_icache_data_ack ),
    .icache_data_i      ( icache_adapter          ),
    .icache_rtrn_vld_o  ( adapter_icache_rtrn_vld ),
    .icache_rtrn_o      ( adapter_icache          ),
    .dcache_data_req_i  ( dcache_adapter_data_req ),
    .dcache_data_ack_o  ( adapter_dcache_data_ack ),
    .dcache_data_i      ( dcache_adapter          ),
    .dcache_rtrn_vld_o  ( adapter_dcache_rtrn_vld ),
    .dcache_rtrn_o      ( adapter_dcache          ),
    .axi_req_o          ( axi_req_o               ),
    .axi_resp_i         ( axi_resp_i              )
  );
`endif



///////////////////////////////////////////////////////
// assertions
///////////////////////////////////////////////////////

//pragma translate_off
`ifndef VERILATOR
  a_invalid_instruction_fetch: assert property (
    @(posedge clk_i) disable iff (!rst_ni) icache_dreq_o.valid |-> (|icache_dreq_o.data) !== 1'hX)
  else $warning(1,"[l1 dcache] reading invalid instructions: vaddr=%08X, data=%08X",
    icache_dreq_o.vaddr, icache_dreq_o.data);

  for (genvar j=0; j<riscv::XLEN/8; j++) begin : gen_invalid_write_assertion
    a_invalid_write_data: assert property (
      @(posedge clk_i) disable iff (!rst_ni) dcache_req_ports_i[2].data_req |-> dcache_req_ports_i[2].data_be[j] |-> (|dcache_req_ports_i[2].data_wdata[j*8+:8] !== 1'hX))
    else $warning(1,"[l1 dcache] writing invalid data: paddr=%016X, be=%02X, data=%016X, databe=%016X",
      {dcache_req_ports_i[2].address_tag, dcache_req_ports_i[2].address_index}, dcache_req_ports_i[2].data_be, dcache_req_ports_i[2].data_wdata, dcache_req_ports_i[2].data_be & dcache_req_ports_i[2].data_wdata);
  end


  for (genvar j=0; j<2; j++) begin : gen_assertion
    a_invalid_read_data: assert property (
      @(posedge clk_i) disable iff (!rst_ni) dcache_req_ports_o[j].data_rvalid && ~dcache_req_ports_i[j].kill_req |-> (|dcache_req_ports_o[j].data_rdata) !== 1'hX)
    else $warning(1,"[l1 dcache] reading invalid data on port %01d: data=%016X",
      j, dcache_req_ports_o[j].data_rdata);
  end
`endif
//pragma translate_on


endmodule // wt_cache_subsystem
