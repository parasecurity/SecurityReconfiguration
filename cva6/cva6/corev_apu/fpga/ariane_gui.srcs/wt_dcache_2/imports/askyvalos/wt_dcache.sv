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
// Date: 13.09.2018
// Description: Write-Through Data cache that is compatible with openpiton.

module wt_dcache_2 import ariane_pkg::*; import wt_cache_pkg::*; #(
  parameter int unsigned                 AxiDataWidth       = 64,
  parameter int unsigned                 NumPorts           = 3,    // number of miss ports
  // ID to be used for read and AMO transactions.
  // note that the write buffer uses all IDs up to DCACHE_MAX_TX-1 for write transactions
  parameter logic [CACHE_ID_WIDTH-1:0]   RdAmoTxId          = 1,
  // contains cacheable regions
  parameter ariane_pkg::ariane_cfg_t     ArianeCfg          = ariane_pkg::ArianeDefaultConfig   
) (
  input  logic                           clk_i,       // Clock
  input  logic                           rst_ni,      // Asynchronous reset active low

  // Cache management
  input  logic                           enable_i,    // from CSR
  input  logic                           flush_i,     // high until acknowledged
  output logic                           flush_ack_o, // send a single cycle acknowledge signal when the cache is flushed
  output logic                           miss_o,      // we missed on a ld/st
  output logic                           wbuffer_empty_o,
  output logic                           wbuffer_not_ni_o,

  // AMO interface
  input  logic                           amo_req_i_req,
  input  ariane_pkg::amo_t               amo_req_i_amo_op,
  input  logic [1:0]                     amo_req_i_size,
  input  logic [63:0]                    amo_req_i_operand_a,
  input  logic [63:0]                    amo_req_i_operand_b,
  output logic                           amo_resp_o_ack,
  output logic [63:0]                    amo_resp_o_result,

  // Request ports
  input logic [DCACHE_INDEX_WIDTH-1:0] req_ports_i_address_index1,
  input logic [DCACHE_TAG_WIDTH-1:0]   req_ports_i_address_tag1,
  input riscv::xlen_t                  req_ports_i_data_wdata1,
  input logic [DCACHE_USER_WIDTH-1:0]  req_ports_i_data_wuser1,
  input logic                          req_ports_i_data_req1,
  input logic                          req_ports_i_data_we1,
  input logic [(riscv::XLEN/8)-1:0]    req_ports_i_data_be1,
  input logic [1:0]                    req_ports_i_data_size1,
  input logic [DCACHE_TID_WIDTH-1:0]   req_ports_i_data_id1,
  input logic                          req_ports_i_kill_req1,
  input logic                          req_ports_i_tag_valid1,
  output logic                         req_ports_o_data_gnt1,
  output logic                         req_ports_o_data_rvalid1,
  output logic [DCACHE_TID_WIDTH-1:0]  req_ports_o_data_rid1,
  output riscv::xlen_t                 req_ports_o_data_rdata1,
  output logic [DCACHE_USER_WIDTH-1:0] req_ports_o_data_ruser1,
  
  input logic [DCACHE_INDEX_WIDTH-1:0] req_ports_i_address_index2,
  input logic [DCACHE_TAG_WIDTH-1:0]   req_ports_i_address_tag2,
  input riscv::xlen_t                  req_ports_i_data_wdata2,
  input logic [DCACHE_USER_WIDTH-1:0]  req_ports_i_data_wuser2,
  input logic                          req_ports_i_data_req2,
  input logic                          req_ports_i_data_we2,
  input logic [(riscv::XLEN/8)-1:0]    req_ports_i_data_be2,
  input logic [1:0]                    req_ports_i_data_size2,
  input logic [DCACHE_TID_WIDTH-1:0]   req_ports_i_data_id2,
  input logic                          req_ports_i_kill_req2,
  input logic                          req_ports_i_tag_valid2,
  output logic                         req_ports_o_data_gnt2,
  output logic                         req_ports_o_data_rvalid2,
  output logic [DCACHE_TID_WIDTH-1:0]  req_ports_o_data_rid2,
  output riscv::xlen_t                 req_ports_o_data_rdata2,
  output logic [DCACHE_USER_WIDTH-1:0] req_ports_o_data_ruser2,
  
  input logic [DCACHE_INDEX_WIDTH-1:0] req_ports_i_address_index3,
  input logic [DCACHE_TAG_WIDTH-1:0]   req_ports_i_address_tag3,
  input riscv::xlen_t                  req_ports_i_data_wdata3,
  input logic [DCACHE_USER_WIDTH-1:0]  req_ports_i_data_wuser3,
  input logic                          req_ports_i_data_req3,
  input logic                          req_ports_i_data_we3,
  input logic [(riscv::XLEN/8)-1:0]    req_ports_i_data_be3,
  input logic [1:0]                    req_ports_i_data_size3,
  input logic [DCACHE_TID_WIDTH-1:0]   req_ports_i_data_id3,
  input logic                          req_ports_i_kill_req3,
  input logic                          req_ports_i_tag_valid3,
  output logic                         req_ports_o_data_gnt3,
  output logic                         req_ports_o_data_rvalid3,
  output logic [DCACHE_TID_WIDTH-1:0]  req_ports_o_data_rid3,
  output riscv::xlen_t                 req_ports_o_data_rdata3,
  output logic [DCACHE_USER_WIDTH-1:0] req_ports_o_data_ruser3,

  output logic [DCACHE_SET_ASSOC-1:0]    miss_vld_bits_o_1,
  output logic [DCACHE_SET_ASSOC-1:0]    miss_vld_bits_o_2,
  output logic [DCACHE_SET_ASSOC-1:0]    miss_vld_bits_o_3,

  input  logic                           mem_rtrn_vld_i,
  input  wt_cache_pkg::dcache_in_t                        mem_rtrn_i_rtype,       // see definitions above
  input  logic [ariane_pkg::DCACHE_LINE_WIDTH-1:0]        mem_rtrn_i_data,        // full cache line width
  input  logic [ariane_pkg::DCACHE_USER_LINE_WIDTH-1:0]   mem_rtrn_i_user,        // user bits
  input  logic                                            mem_rtrn_i_inv_vld,
  input  logic                                            mem_rtrn_i_inv_all,
  input  logic [ariane_pkg::DCACHE_INDEX_WIDTH-1:0]       mem_rtrn_i_inv_idx,
  input  logic [L15_WAY_WIDTH-1:0]                        mem_rtrn_i_inv_way,
  input  logic [CACHE_ID_WIDTH-1:0]                       mem_rtrn_i_tid,         // threadi id (used as transaction id in Ariane)
  
  output logic                           mem_data_req_o,
  input  logic                           mem_data_ack_i,
  output wt_cache_pkg::dcache_out_t                       mem_data_o_rtype,       // see definitions above
  output logic [2:0]                                      mem_data_o_size,        // transaction size: 000=Byte 001=2Byte; 010=4Byte; 011=8Byte; 111=Cache line (16/32Byte)
  output logic [L1D_WAY_WIDTH-1:0]                        mem_data_o_way,         // way to replace
  output logic [riscv::PLEN-1:0]                          mem_data_o_paddr,       // physical address
  output riscv::xlen_t                                    mem_data_o_data,        // word width of processor (no block stores at the moment)
  output logic [ariane_pkg::DATA_USER_WIDTH-1:0]          mem_data_o_user,        // user width of processor (no block stores at the moment)
  output logic                                            mem_data_o_nc,          // noncacheable
  output logic [CACHE_ID_WIDTH-1:0]                       mem_data_o_tid,         // threadi id (used as transaction id in Ariane)
  output ariane_pkg::amo_t                                mem_data_o_amo_op      // amo opcode
);

  logic [2:0][DCACHE_SET_ASSOC-1:0] miss_vld_bits_o;
  assign miss_vld_bits_o_1 = miss_vld_bits_o[0];
  assign miss_vld_bits_o_2 = miss_vld_bits_o[1];
  assign miss_vld_bits_o_3 = miss_vld_bits_o[2];
  //struct declaration
  ariane_pkg::amo_req_t amo_req_i;
  ariane_pkg::amo_resp_t amo_resp_o;
  
  assign amo_req_i.req = amo_req_i_req;
  assign amo_req_i.amo_op = amo_req_i_amo_op;
  assign amo_req_i.size = amo_req_i_size;
  assign amo_req_i.operand_a = amo_req_i_operand_a;
  assign amo_req_i.operand_b = amo_req_i_operand_b;
  
  assign amo_resp_o.ack = amo_resp_o_ack;
  assign amo_resp_o.result = amo_resp_o_result;
  
  ariane_pkg::dcache_req_i_t[2:0] req_ports_i;
  assign req_ports_i[0].address_index = req_ports_i_address_index1;
  assign req_ports_i[0].address_tag   = req_ports_i_address_tag1;
  assign req_ports_i[0].data_wdata    = req_ports_i_data_wdata1;
  assign req_ports_i[0].data_wuser    = req_ports_i_data_wuser1;
  assign req_ports_i[0].data_req      = req_ports_i_data_req1;
  assign req_ports_i[0].data_we       = req_ports_i_data_we1;
  assign req_ports_i[0].data_be       = req_ports_i_data_be1;
  assign req_ports_i[0].data_size     = req_ports_i_data_size1;
  assign req_ports_i[0].data_id       = req_ports_i_data_id1;
  assign req_ports_i[0].kill_req      = req_ports_i_kill_req1;
  assign req_ports_i[0].tag_valid     = req_ports_i_tag_valid1;
  
  assign req_ports_i[1].address_index = req_ports_i_address_index2;
  assign req_ports_i[1].address_tag   = req_ports_i_address_tag2;
  assign req_ports_i[1].data_wdata    = req_ports_i_data_wdata2;
  assign req_ports_i[1].data_wuser    = req_ports_i_data_wuser2;
  assign req_ports_i[1].data_req      = req_ports_i_data_req2;
  assign req_ports_i[1].data_we       = req_ports_i_data_we2;
  assign req_ports_i[1].data_be       = req_ports_i_data_be2;
  assign req_ports_i[1].data_size     = req_ports_i_data_size2;
  assign req_ports_i[1].data_id       = req_ports_i_data_id2;
  assign req_ports_i[1].kill_req      = req_ports_i_kill_req2;
  assign req_ports_i[1].tag_valid     = req_ports_i_tag_valid2;
  
  assign req_ports_i[2].address_index = req_ports_i_address_index3;
  assign req_ports_i[2].address_tag   = req_ports_i_address_tag3;
  assign req_ports_i[2].data_wdata    = req_ports_i_data_wdata3;
  assign req_ports_i[2].data_wuser    = req_ports_i_data_wuser3;
  assign req_ports_i[2].data_req      = req_ports_i_data_req3;
  assign req_ports_i[2].data_we       = req_ports_i_data_we3;
  assign req_ports_i[2].data_be       = req_ports_i_data_be3;
  assign req_ports_i[2].data_size     = req_ports_i_data_size3;
  assign req_ports_i[2].data_id       = req_ports_i_data_id3;
  assign req_ports_i[2].kill_req      = req_ports_i_kill_req3;
  assign req_ports_i[2].tag_valid     = req_ports_i_tag_valid3;  

  ariane_pkg::dcache_req_o_t[2:0]   req_ports_o;

  assign req_ports_o_data_gnt1      = req_ports_o[0].data_gnt;
  assign req_ports_o_data_rvalid1   = req_ports_o[0].data_rvalid;
  assign req_ports_o_data_rid1      = req_ports_o[0].data_rid;
  assign req_ports_o_data_rdata1    = req_ports_o[0].data_rdata;
  assign req_ports_o_data_ruser1    = req_ports_o[0].data_ruser;
  
  assign req_ports_o_data_gnt2      = req_ports_o[1].data_gnt;
  assign req_ports_o_data_rvalid2   = req_ports_o[1].data_rvalid;
  assign req_ports_o_data_rid2      = req_ports_o[1].data_rid;
  assign req_ports_o_data_rdata2    = req_ports_o[1].data_rdata;
  assign req_ports_o_data_ruser2    = req_ports_o[1].data_ruser;
  
  assign req_ports_o_data_gnt3      = req_ports_o[2].data_gnt;
  assign req_ports_o_data_rvalid3   = req_ports_o[2].data_rvalid;
  assign req_ports_o_data_rid3      = req_ports_o[2].data_rid;
  assign req_ports_o_data_rdata3    = req_ports_o[2].data_rdata;
  assign req_ports_o_data_ruser3    = req_ports_o[2].data_ruser;
  
  wt_cache_pkg::dcache_rtrn_t  mem_rtrn_i;
  assign mem_rtrn_i.rtype       = mem_rtrn_i_rtype;       
  assign mem_rtrn_i.data        = mem_rtrn_i_data;       
  assign mem_rtrn_i.user        = mem_rtrn_i_user;        
  assign mem_rtrn_i.inv.vld     = mem_rtrn_i_inv_vld;
  assign mem_rtrn_i.inv.all     = mem_rtrn_i_inv_all;
  assign mem_rtrn_i.inv.idx     = mem_rtrn_i_inv_idx;
  assign mem_rtrn_i.inv.way     = mem_rtrn_i_inv_way;        
  assign mem_rtrn_i.tid         = mem_rtrn_i_tid;
  
  wt_cache_pkg::dcache_req_t  mem_data_o;         
  assign  mem_data_o_rtype  = mem_data_o.rtype;
  assign  mem_data_o_size   = mem_data_o.size;
  assign  mem_data_o_way    = mem_data_o.way;
  assign  mem_data_o_paddr  = mem_data_o.paddr;
  assign  mem_data_o_data   = mem_data_o.data;
  assign  mem_data_o_user   = mem_data_o.user;
  assign  mem_data_o_nc     = mem_data_o.nc;
  assign  mem_data_o_tid    = mem_data_o.tid;
  assign  mem_data_o_amo_op = mem_data_o.amo_op; 
  
  // miss unit <-> read controllers
  logic cache_en;

  // miss unit <-> memory
  logic                           wr_cl_vld;
  logic                           wr_cl_nc;
  logic [DCACHE_SET_ASSOC-1:0]    wr_cl_we;
  logic [DCACHE_TAG_WIDTH-1:0]    wr_cl_tag;
  logic [DCACHE_CL_IDX_WIDTH-1:0] wr_cl_idx;
  logic [DCACHE_OFFSET_WIDTH-1:0] wr_cl_off;
  logic [DCACHE_LINE_WIDTH-1:0]   wr_cl_data;
  logic [DCACHE_USER_LINE_WIDTH-1:0]   wr_cl_user;
  logic [DCACHE_LINE_WIDTH/8-1:0] wr_cl_data_be;
  logic [DCACHE_SET_ASSOC-1:0]    wr_vld_bits;
  logic [DCACHE_SET_ASSOC-1:0]    wr_req;
  logic                           wr_ack;
  logic [DCACHE_CL_IDX_WIDTH-1:0] wr_idx;
  logic [DCACHE_OFFSET_WIDTH-1:0] wr_off;
  riscv::xlen_t                   wr_data;
  logic [(riscv::XLEN/8)-1:0]     wr_data_be;
  logic [DCACHE_USER_WIDTH-1:0]   wr_user;

  // miss unit <-> controllers/wbuffer
  logic [NumPorts-1:0]                          miss_req;
  logic [NumPorts-1:0]                          miss_ack;
  logic [NumPorts-1:0]                          miss_nc;
  logic [NumPorts-1:0]                          miss_we;
  logic [NumPorts-1:0][riscv::XLEN-1:0]         miss_wdata;
  logic [NumPorts-1:0][DCACHE_USER_WIDTH-1:0]   miss_wuser;
  logic [NumPorts-1:0][riscv::PLEN-1:0]         miss_paddr;
  logic [NumPorts-1:0][2:0]                     miss_size;
  logic [NumPorts-1:0][CACHE_ID_WIDTH-1:0]      miss_id;
  logic [NumPorts-1:0]                          miss_replay;
  logic [NumPorts-1:0]                          miss_rtrn_vld;
  logic [CACHE_ID_WIDTH-1:0]                    miss_rtrn_id;

  // memory <-> read controllers/miss unit
  logic [NumPorts-1:0]                          rd_prio;
  logic [NumPorts-1:0]                          rd_tag_only;
  logic [NumPorts-1:0]                          rd_req;
  logic [NumPorts-1:0]                          rd_ack;
  logic [NumPorts-1:0][DCACHE_TAG_WIDTH-1:0]    rd_tag;
  logic [NumPorts-1:0][DCACHE_CL_IDX_WIDTH-1:0] rd_idx;
  logic [NumPorts-1:0][DCACHE_OFFSET_WIDTH-1:0] rd_off;
  riscv::xlen_t                                 rd_data;
  logic [DCACHE_USER_WIDTH-1:0]                 rd_user;
  logic [DCACHE_SET_ASSOC-1:0]                  rd_vld_bits;
  logic [DCACHE_SET_ASSOC-1:0]                  rd_hit_oh;

  // miss unit <-> wbuffer
  logic [DCACHE_MAX_TX-1:0][riscv::PLEN-1:0]    tx_paddr;
  logic [DCACHE_MAX_TX-1:0]                     tx_vld;

  // wbuffer <-> memory
  wbuffer_t [DCACHE_WBUF_DEPTH-1:0]             wbuffer_data;


///////////////////////////////////////////////////////
// miss handling unit
///////////////////////////////////////////////////////

  wt_dcache_missunit #(
    .AxiCompliant ( ArianeCfg.AxiCompliant ),
    .AmoTxId      ( RdAmoTxId              ),
    .NumPorts     ( NumPorts               ),
    .AxiDataWidth ( AxiDataWidth           )
  ) i_wt_dcache_missunit (
    .clk_i              ( clk_i              ),
    .rst_ni             ( rst_ni             ),
    .enable_i           ( enable_i           ),
    .flush_i            ( flush_i            ),
    .flush_ack_o        ( flush_ack_o        ),
    .miss_o             ( miss_o             ),
    .wbuffer_empty_i    ( wbuffer_empty_o    ),
    .cache_en_o         ( cache_en           ),
    // amo interface
    .amo_req_i          ( amo_req_i          ),
    .amo_resp_o         ( amo_resp_o         ),
    // miss handling interface
    .miss_req_i         ( miss_req           ),
    .miss_ack_o         ( miss_ack           ),
    .miss_nc_i          ( miss_nc            ),
    .miss_we_i          ( miss_we            ),
    .miss_wdata_i       ( miss_wdata         ),
    .miss_wuser_i       ( miss_wuser         ),
    .miss_paddr_i       ( miss_paddr         ),
    .miss_vld_bits_i    ( miss_vld_bits_o    ),
    .miss_size_i        ( miss_size          ),
    .miss_id_i          ( miss_id            ),
    .miss_replay_o      ( miss_replay        ),
    .miss_rtrn_vld_o    ( miss_rtrn_vld      ),
    .miss_rtrn_id_o     ( miss_rtrn_id       ),
    // from writebuffer
    .tx_paddr_i         ( tx_paddr           ),
    .tx_vld_i           ( tx_vld             ),
    // cache memory interface
    .wr_cl_vld_o        ( wr_cl_vld          ),
    .wr_cl_nc_o         ( wr_cl_nc           ),
    .wr_cl_we_o         ( wr_cl_we           ),
    .wr_cl_tag_o        ( wr_cl_tag          ),
    .wr_cl_idx_o        ( wr_cl_idx          ),
    .wr_cl_off_o        ( wr_cl_off          ),
    .wr_cl_data_o       ( wr_cl_data         ),
    .wr_cl_user_o       ( wr_cl_user         ),
    .wr_cl_data_be_o    ( wr_cl_data_be      ),
    .wr_vld_bits_o      ( wr_vld_bits        ),
    // memory interface
    .mem_rtrn_vld_i     ( mem_rtrn_vld_i     ),
    .mem_rtrn_i         ( mem_rtrn_i         ),
    .mem_data_req_o     ( mem_data_req_o     ),
    .mem_data_ack_i     ( mem_data_ack_i     ),
    .mem_data_o         ( mem_data_o         )
  );

///////////////////////////////////////////////////////
// read controllers (LD unit and PTW/MMU)
///////////////////////////////////////////////////////

  // note: last read port is used by the write buffer
  for(genvar k=0; k<NumPorts-1; k++) begin : gen_rd_ports
    // set these to high prio ports
    assign rd_prio[k] = 1'b1;

    wt_dcache_ctrl #(
      .RdTxId        ( RdAmoTxId     ),
      .ArianeCfg     ( ArianeCfg     )
    ) i_wt_dcache_ctrl (
      .clk_i           ( clk_i             ),
      .rst_ni          ( rst_ni            ),
      .cache_en_i      ( cache_en          ),
      // reqs from core
      .req_port_i      ( req_ports_i   [k] ),
      .req_port_o      ( req_ports_o   [k] ),
      // miss interface
      .miss_req_o      ( miss_req      [k] ),
      .miss_ack_i      ( miss_ack      [k] ),
      .miss_we_o       ( miss_we       [k] ),
      .miss_wdata_o    ( miss_wdata    [k] ),
      .miss_wuser_o    ( miss_wuser    [k] ),
      .miss_vld_bits_o ( miss_vld_bits_o[k]),
      .miss_paddr_o    ( miss_paddr    [k] ),
      .miss_nc_o       ( miss_nc       [k] ),
      .miss_size_o     ( miss_size     [k] ),
      .miss_id_o       ( miss_id       [k] ),
      .miss_replay_i   ( miss_replay   [k] ),
      .miss_rtrn_vld_i ( miss_rtrn_vld [k] ),
      // used to detect readout mux collisions
      .wr_cl_vld_i     ( wr_cl_vld         ),
      // cache mem interface
      .rd_tag_o        ( rd_tag        [k] ),
      .rd_idx_o        ( rd_idx        [k] ),
      .rd_off_o        ( rd_off        [k] ),
      .rd_req_o        ( rd_req        [k] ),
      .rd_tag_only_o   ( rd_tag_only   [k] ),
      .rd_ack_i        ( rd_ack        [k] ),
      .rd_data_i       ( rd_data           ),
      .rd_user_i       ( rd_user           ),
      .rd_vld_bits_i   ( rd_vld_bits       ),
      .rd_hit_oh_i     ( rd_hit_oh         )
    );
  end
///////////////////////////////////////////////////////
// store unit controller
///////////////////////////////////////////////////////

  // set read port to low priority
  assign rd_prio[2] = 1'b0;

  wt_dcache_wbuffer #(
    .ArianeCfg     ( ArianeCfg     )
  ) i_wt_dcache_wbuffer (
    .clk_i           ( clk_i               ),
    .rst_ni          ( rst_ni              ),
    .empty_o         ( wbuffer_empty_o     ),
    .not_ni_o        ( wbuffer_not_ni_o    ),
    // TODO: fix this
    .cache_en_i      ( cache_en            ),
    // .cache_en_i      ( '0                  ),
    // request ports from core (store unit)
    .req_port_i      ( req_ports_i   [2]   ),
    .req_port_o      ( req_ports_o   [2]   ),
    // miss unit interface
    .miss_req_o      ( miss_req      [2]   ),
    .miss_ack_i      ( miss_ack      [2]   ),
    .miss_we_o       ( miss_we       [2]   ),
    .miss_wdata_o    ( miss_wdata    [2]   ),
    .miss_wuser_o    ( miss_wuser    [2]   ),
    .miss_vld_bits_o ( miss_vld_bits_o[2]  ),
    .miss_paddr_o    ( miss_paddr    [2]   ),
    .miss_nc_o       ( miss_nc       [2]   ),
    .miss_size_o     ( miss_size     [2]   ),
    .miss_id_o       ( miss_id       [2]   ),
    .miss_rtrn_vld_i ( miss_rtrn_vld [2]   ),
    .miss_rtrn_id_i  ( miss_rtrn_id        ),
    // cache read interface
    .rd_tag_o        ( rd_tag        [2]   ),
    .rd_idx_o        ( rd_idx        [2]   ),
    .rd_off_o        ( rd_off        [2]   ),
    .rd_req_o        ( rd_req        [2]   ),
    .rd_tag_only_o   ( rd_tag_only   [2]   ),
    .rd_ack_i        ( rd_ack        [2]   ),
    .rd_data_i       ( rd_data             ),
    .rd_vld_bits_i   ( rd_vld_bits         ),
    .rd_hit_oh_i     ( rd_hit_oh           ),
     // incoming invalidations/cache refills
    .wr_cl_vld_i     ( wr_cl_vld           ),
    .wr_cl_idx_i     ( wr_cl_idx           ),
    // single word write interface
    .wr_req_o        ( wr_req              ),
    .wr_ack_i        ( wr_ack              ),
    .wr_idx_o        ( wr_idx              ),
    .wr_off_o        ( wr_off              ),
    .wr_data_o       ( wr_data             ),
    .wr_user_o       ( wr_user             ),
    .wr_data_be_o    ( wr_data_be          ),
    // write buffer forwarding
    .wbuffer_data_o  ( wbuffer_data        ),
    .tx_paddr_o      ( tx_paddr            ),
    .tx_vld_o        ( tx_vld              )
  );

///////////////////////////////////////////////////////
// memory arrays, arbitration and tag comparison
///////////////////////////////////////////////////////

  wt_dcache_mem #(
    .AxiCompliant ( ArianeCfg.AxiCompliant ),
    .AxiDataWidth ( AxiDataWidth           ),
    .NumPorts     ( NumPorts               )
  ) i_wt_dcache_mem (
    .clk_i             ( clk_i              ),
    .rst_ni            ( rst_ni             ),
    // read ports
    .rd_prio_i         ( rd_prio            ),
    .rd_tag_i          ( rd_tag             ),
    .rd_idx_i          ( rd_idx             ),
    .rd_off_i          ( rd_off             ),
    .rd_req_i          ( rd_req             ),
    .rd_tag_only_i     ( rd_tag_only        ),
    .rd_ack_o          ( rd_ack             ),
    .rd_vld_bits_o     ( rd_vld_bits        ),
    .rd_hit_oh_o       ( rd_hit_oh          ),
    .rd_data_o         ( rd_data            ),
    .rd_user_o         ( rd_user            ),
    // cacheline write port
    .wr_cl_vld_i       ( wr_cl_vld          ),
    .wr_cl_nc_i        ( wr_cl_nc           ),
    .wr_cl_we_i        ( wr_cl_we           ),
    .wr_cl_tag_i       ( wr_cl_tag          ),
    .wr_cl_idx_i       ( wr_cl_idx          ),
    .wr_cl_off_i       ( wr_cl_off          ),
    .wr_cl_data_i      ( wr_cl_data         ),
    .wr_cl_user_i      ( wr_cl_user         ),
    .wr_cl_data_be_i   ( wr_cl_data_be      ),
    .wr_vld_bits_i     ( wr_vld_bits        ),
    // single word write port
    .wr_req_i          ( wr_req             ),
    .wr_ack_o          ( wr_ack             ),
    .wr_idx_i          ( wr_idx             ),
    .wr_off_i          ( wr_off             ),
    .wr_data_i         ( wr_data            ),
    .wr_user_i         ( wr_user            ),
    .wr_data_be_i      ( wr_data_be         ),
    // write buffer forwarding
    .wbuffer_data_i    ( wbuffer_data       )
  );

///////////////////////////////////////////////////////
// assertions
///////////////////////////////////////////////////////

// check for concurrency issues


//pragma translate_off
`ifndef VERILATOR
  flush: assert property (
    @(posedge clk_i) disable iff (!rst_ni) flush_i |-> flush_ack_o |-> wbuffer_empty_o)
     else $fatal(1,"[l1 dcache] flushed cache implies flushed wbuffer");

   initial begin
    // assert wrong parameterizations
    assert (DCACHE_INDEX_WIDTH<=12)
      else $fatal(1,"[l1 dcache] cache index width can be maximum 12bit since VM uses 4kB pages");
   end
`endif
//pragma translate_on

endmodule // wt_dcache
