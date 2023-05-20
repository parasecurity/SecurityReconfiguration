module sdTest(
    // ddr ports
    inout  wire  [31:0]  ddr3_dq     ,
    inout  wire  [ 3:0]  ddr3_dqs_n  ,
    inout  wire  [ 3:0]  ddr3_dqs_p  ,
    output logic [14:0]  ddr3_addr   ,
    output logic [ 2:0]  ddr3_ba     ,
    output logic         ddr3_ras_n  ,
    output logic         ddr3_cas_n  ,
    output logic         ddr3_we_n   ,
    output logic         ddr3_reset_n,
    output logic [ 0:0]  ddr3_ck_p   ,
    output logic [ 0:0]  ddr3_ck_n   ,
    output logic [ 0:0]  ddr3_cke    ,
    output logic [ 0:0]  ddr3_cs_n   ,
    output logic [ 3:0]  ddr3_dm     ,
    output logic [ 0:0]  ddr3_odt    ,
    //  differential clocks
    input  logic         clk_p,
    input  logic         clk_n,
    // rst_n active-low, You can re-scan and re-read SDcard by pushing the reset button.
    input  logic         p_resetn,
    //up and down buttons for partial reconf
	input  logic		 btn_up,
	input  logic		 btn_down,
    // when sdcard_pwr_n = 0, SDcard power on
    output logic         sdcard_pwr_n,
    // signals connect to SD SPI bus
    output logic         sd_spi_ssn,
    output logic         sd_spi_sck,
    output logic         sd_spi_mosi,
    input  logic         sd_spi_miso,
    // 8 bit led to show the status of SDcard
    output logic[7:0]    led    
);

assign sdcard_pwr_n = 1'b0;

logic       outen;
logic[7:0]  outbyte;

localparam C_S_AXI_ID_WIDTH             = 3;
                                             // Width of all master and slave ID signals.
                                             // # = >= 1.
localparam C_S_AXI_ADDR_WIDTH            = 32;
                                             // Width of S_AXI_AWADDR, S_AXI_ARADDR, M_AXI_AWADDR and
                                             // M_AXI_ARADDR for all SI/MI slots.
                                             // # = 32.
localparam C_S_AXI_DATA_WIDTH            = 32;
                                             // Width of WDATA and RDATA on SI slot.
                                             // Must be <= APP_DATA_WIDTH.
                                             // # = 32, 64, 128, 256.
                                             
localparam BITSIZE                      = 644428;


wire                              mmcm_locked;
wire                              app_sr_active;
wire                              app_ref_ack;
wire                              app_zq_ack;
wire                              init_calib_complete;


wire resetn;
wire sd_resetn;
wire clk100Mhz;
wire clk200Mhz;
wire rst;

reg aresetn;

  // Slave Interface Write Address Ports
wire [C_S_AXI_ID_WIDTH-1:0]       s_axi_awid = '0;
wire [C_S_AXI_ADDR_WIDTH-1:0]     s_axi_awaddr;
wire [7:0]                        s_axi_awlen;
wire [2:0]                        s_axi_awsize;
wire [1:0]                        s_axi_awburst;
wire [0:0]                        s_axi_awlock;
wire [3:0]                        s_axi_awcache;
wire [2:0]                        s_axi_awprot;
wire [3:0]                        s_axi_awqos;
wire                              s_axi_awvalid;
wire                              s_axi_awready;                             
// Slave Interface Write Data Ports
wire [C_S_AXI_DATA_WIDTH-1:0]     s_axi_wdata;
wire [(C_S_AXI_DATA_WIDTH/8)-1:0] s_axi_wstrb;
wire                              s_axi_wlast;
wire                              s_axi_wvalid;
wire                              s_axi_wready;
// Slave Interface Write Response Ports
wire                              s_axi_bready;
wire [C_S_AXI_ID_WIDTH-1:0]       s_axi_bid;
wire [1:0]                        s_axi_bresp;
wire                              s_axi_bvalid;
// Slave Interface Read Address Ports
wire [C_S_AXI_ID_WIDTH-1:0]       s_axi_arid = '0;
wire [C_S_AXI_ADDR_WIDTH-1:0]     s_axi_araddr;
wire [7:0]                        s_axi_arlen;
wire [2:0]                        s_axi_arsize;
wire [1:0]                        s_axi_arburst;
wire [0:0]                        s_axi_arlock = '0;
wire [3:0]                        s_axi_arcache;
wire [2:0]                        s_axi_arprot;
wire [3:0]                        s_axi_arqos = '0;
wire                              s_axi_arvalid;
wire                              s_axi_arready;
// Slave Interface Read Data Ports
wire                              s_axi_rready;
wire [C_S_AXI_ID_WIDTH-1:0]       s_axi_rid;
wire [C_S_AXI_DATA_WIDTH-1:0]     s_axi_rdata;
wire [1:0]                        s_axi_rresp;
wire                              s_axi_rlast;
wire                              s_axi_rvalid;
// Master Interface Write Address Ports
wire [C_S_AXI_ID_WIDTH-1:0]       m_axi_awid;
wire [C_S_AXI_ADDR_WIDTH-1:0]     m_axi_awaddr;
wire [7:0]                        m_axi_awlen;
wire [2:0]                        m_axi_awsize;
wire [1:0]                        m_axi_awburst;
wire [0:0]                        m_axi_awlock = '0;
wire [3:0]                        m_axi_awcache;
wire [3:0]                        m_axi_awuser;
wire [2:0]                        m_axi_awprot;
wire [3:0]                        m_axi_awqos = '0;
wire                              m_axi_awvalid;
wire                              m_axi_awready;                             
// Master Interface Write Data Ports
wire [C_S_AXI_DATA_WIDTH-1:0]     m_axi_wdata;
wire [(C_S_AXI_DATA_WIDTH/8)-1:0] m_axi_wstrb;
wire                              m_axi_wlast;
wire                              m_axi_wvalid;
wire                              m_axi_wready;
// Master Interface Write Response Ports
wire                              m_axi_bready;
wire [C_S_AXI_ID_WIDTH-1:0]       m_axi_bid;
wire [1:0]                        m_axi_bresp;
wire                              m_axi_bvalid;
// Master Interface Read Address Ports
wire [C_S_AXI_ID_WIDTH-1:0]       m_axi_arid;
wire [C_S_AXI_ADDR_WIDTH-1:0]     m_axi_araddr ='0;
wire [7:0]                        m_axi_arlen = '0;
wire [2:0]                        m_axi_arsize = '0;
wire [1:0]                        m_axi_arburst = '0;
wire [0:0]                        m_axi_arlock = '0;
wire [3:0]                        m_axi_arcache = '0;
wire [2:0]                        m_axi_arprot = '0;
wire [3:0]                        m_axi_arqos = '0;
wire                              m_axi_arvalid = '0;
wire                              m_axi_arready;
// Master Interface Read Data Ports
wire                              m_axi_rready = '0;
wire [C_S_AXI_ID_WIDTH-1:0]       m_axi_rid;
wire [C_S_AXI_DATA_WIDTH-1:0]     m_axi_rdata;
wire [1:0]                        m_axi_rresp;
wire                              m_axi_rlast;
wire                              m_axi_rvalid;
// Master CMD signals for datamover
reg                               m_axis_cmd_tvalid;
wire                              m_axis_cmd_tready;
reg[71:0]                         m_axis_cmd_tdata;
//Axi stream signals
reg [7:0]                         m_axis_tdata;
wire                              m_axis_tkeep;
wire                              m_axis_tlast;
reg                               m_axis_tvalid;
wire                              m_axis_tready;
//Datamover status signals
wire [7:0]                        m_axis_s2mm_sts_tdata;
wire                              m_axis_s2mm_sts_tvalid;
//jtag write master ports
wire [31:0] 			m_axi_jtag_awaddr;
wire					m_axi_jtag_awvalid;
wire					m_axi_jtag_awready;
wire [31:0]				m_axi_jtag_wdata;
wire					m_axi_jtag_wvalid;
wire					m_axi_jtag_wready;
wire [1:0]				m_axi_jtag_bresp;
wire					m_axi_jtag_bvalid;
wire					m_axi_jtag_bready;
wire [31:0]				m_axi_jtag_araddr;
wire					m_axi_jtag_arvalid;
wire					m_axi_jtag_arready;
wire [31:0]				m_axi_jtag_rdata;
wire [1:0]				m_axi_jtag_rresp;
wire					m_axi_jtag_rvalid;
wire					m_axi_jtag_rready;

//icap ports
wire					icap_csib;
wire					icap_rdwrb;
wire [31:0]				s_icap_i;
wire [31:0]				s_icap_o;
wire					cap_req = '1;
wire					cap_gnt = '1;
wire					cap_rel = '0;
	
//vsm ports
wire                    vsm_counter_sw_startup_req;
wire                    vsm_counter_rm_shutdown_req;
wire                    vsm_counter_sw_shutdown_req;
wire                    vsm_counter_rm_decouple;
reg [1:0]				vsm_counter_hw_triggers;
wire					counter_rst;

//sd port signals declaration
wire sd_spi_ssn_1;
wire sd_spi_ssn_2;
wire sd_spi_sck_1;
wire sd_spi_sck_2;
wire sd_spi_mosi_1;
wire sd_spi_mosi_2;


clk_wiz_0 i_clk_wiz(
    .reset(0),
    .clk_in1_p(clk_p),
    .clk_in1_n(clk_n),
    .clk_out1(clk200Mhz),
    .locked(locked)
);

//Reads first partial bitstream
sd_spi_file_reader #(
    .FILE_NAME      ( "count_up_partial.bin"       ),  // file name to read
    .SPI_CLK_DIV    ( 100            )   // because clk=100MHz, SPI_CLK_DIV is set to 100
) sd_spi_file_reader_i (
    .rstn           ( sd_resetn      ),
    .clk            ( clk100Mhz      ),
    .spi_ssn        ( sd_spi_ssn_1     ),
    .spi_sck        ( sd_spi_sck_1     ),
    .spi_mosi       ( sd_spi_mosi_1    ),
    .spi_miso       ( sd_spi_miso    ),
    .card_type      (                ),  // 0=Unknown, 1=SDv1.1 , 2=SDv2 , 3=SDHCv2
    .card_stat      (                ),
    .filesystem_type(                ),  // 0=Unknown, 1=invalid, 2=FAT16, 3=FAT32
    .filesystem_stat(                ),
    .file_found     ( led[0]         ),  // 0=file not found, 1=file found
    .outen          ( outen          ),
    .outbyte        ( outbyte        )
);


wire sd_resetn2;
wire outen2;
wire[7:0] outbyte2;

//Reads second partial bitstream
sd_spi_file_reader #(
    .FILE_NAME      ( "count_down_partial.bin"       ),  // file name to read
    .SPI_CLK_DIV    ( 100            )   // because clk=100MHz, SPI_CLK_DIV is set to 100
) sd_spi_file_reader_i2 (
    .rstn           ( sd_resetn2      ),
    .clk            ( clk100Mhz      ),
    .spi_ssn        ( sd_spi_ssn_2     ),
    .spi_sck        ( sd_spi_sck_2     ),
    .spi_mosi       ( sd_spi_mosi_2    ),
    .spi_miso       ( sd_spi_miso    ),
    .card_type      (                ),  // 0=Unknown, 1=SDv1.1 , 2=SDv2 , 3=SDHCv2
    .card_stat      (                ),
    .filesystem_type(                ),  // 0=Unknown, 1=invalid, 2=FAT16, 3=FAT32
    .filesystem_stat(                ),
    .file_found     ( led[1]         ),  // 0=file not found, 1=file found
    .outen          ( outen2          ),
    .outbyte        ( outbyte2        )
);

//Create a reset signal to the circuit for the first 0x80000 cycles
reg [31:0] count;
reg sys_resetn;

initial count = '0;
always @(posedge clk200Mhz)
begin
    if(count < 32'h0000_0008_0000) begin
        count <= count + 8'b1;
        sys_resetn <= '0;
    end
    else begin
        sys_resetn <= '1;
    end
end

//jtag to axi
jtag_axi_0 i_jtag_axi_0(
  .aclk(clk100Mhz),
  .aresetn(resetn),
  .m_axi_awid(),
  .m_axi_awaddr(m_axi_jtag_awaddr),
  .m_axi_awlen(),
  .m_axi_awsize(),
  .m_axi_awburst(),
  .m_axi_awlock(),
  .m_axi_awcache(),
  .m_axi_awprot(),
  .m_axi_awqos(),
  .m_axi_awvalid(m_axi_jtag_awvalid),
  .m_axi_awready(m_axi_jtag_awready),
  .m_axi_wdata(m_axi_jtag_wdata),
  .m_axi_wstrb(),
  .m_axi_wlast(),
  .m_axi_wvalid(m_axi_jtag_wvalid),
  .m_axi_wready(m_axi_jtag_wready),
  .m_axi_bid('0),
  .m_axi_bresp(m_axi_jtag_bresp),
  .m_axi_bvalid(m_axi_jtag_bvalid),
  .m_axi_bready(m_axi_jtag_bready),
  .m_axi_arid(),
  .m_axi_araddr(m_axi_jtag_araddr),
  .m_axi_arlen(),
  .m_axi_arsize(),
  .m_axi_arburst(),
  .m_axi_arlock(),
  .m_axi_arcache(),
  .m_axi_arprot(),
  .m_axi_arqos(),
  .m_axi_arvalid(m_axi_jtag_arvalid),
  .m_axi_arready(m_axi_jtag_arready),
  .m_axi_rid('0),
  .m_axi_rdata(m_axi_jtag_rdata),
  .m_axi_rresp(m_axi_jtag_rresp),
  .m_axi_rlast('0),
  .m_axi_rvalid(m_axi_jtag_rvalid),
 . m_axi_rready(m_axi_jtag_rready)
);



mig_7series_0 ddr_mem(
             
// Memory interface ports
       .ddr3_addr                      (ddr3_addr),
       .ddr3_ba                        (ddr3_ba),
       .ddr3_cas_n                     (ddr3_cas_n),
       .ddr3_ck_n                      (ddr3_ck_n),
       .ddr3_ck_p                      (ddr3_ck_p),
       .ddr3_cke                       (ddr3_cke),
       .ddr3_ras_n                     (ddr3_ras_n),
       .ddr3_we_n                      (ddr3_we_n),
       .ddr3_dq                        (ddr3_dq),
       .ddr3_dqs_n                     (ddr3_dqs_n),
       .ddr3_dqs_p                     (ddr3_dqs_p),
       .ddr3_reset_n                   (ddr3_reset_n),
       .init_calib_complete            (init_calib_complete),
      
       .ddr3_cs_n                      (ddr3_cs_n),
       .ddr3_dm                        (ddr3_dm),
       .ddr3_odt                       (ddr3_odt),
// Application interface ports
       .ui_clk                         (clk100Mhz),
       .ui_clk_sync_rst                (rst),

       .mmcm_locked                    (mmcm_locked),
       .aresetn                        (aresetn),
       .app_sr_req                     (1'b0),
       .app_ref_req                    (1'b0),
       .app_zq_req                     (1'b0),
       .app_sr_active                  (app_sr_active),
       .app_ref_ack                    (app_ref_ack),
       .app_zq_ack                     (app_zq_ack),

// Slave Interface Write Address Ports
       .s_axi_awid                     (m_axi_awid),
       .s_axi_awaddr                   (m_axi_awaddr[29:0]),
       .s_axi_awlen                    (m_axi_awlen),
       .s_axi_awsize                   (m_axi_awsize),
       .s_axi_awburst                  (m_axi_awburst),
       .s_axi_awlock                   (m_axi_awlock),
       .s_axi_awcache                  (m_axi_awcache),
       .s_axi_awprot                   (m_axi_awprot),
       .s_axi_awqos                    (m_axi_awqos),
       .s_axi_awvalid                  (m_axi_awvalid),
       .s_axi_awready                  (m_axi_awready),
// Slave Interface Write Data Ports
       .s_axi_wdata                    (m_axi_wdata),
       .s_axi_wstrb                    (m_axi_wstrb),
       .s_axi_wlast                    (m_axi_wlast),
       .s_axi_wvalid                   (m_axi_wvalid),
       .s_axi_wready                   (m_axi_wready),
// Slave Interface Write Response Ports
       .s_axi_bid                      (m_axi_bid),
       .s_axi_bresp                    (m_axi_bresp),
       .s_axi_bvalid                   (m_axi_bvalid),
       .s_axi_bready                   (m_axi_bready),
// Slave Interface Read Address Ports
       .s_axi_arid                     (s_axi_arid),
       .s_axi_araddr                   (s_axi_araddr[29:0]),
       .s_axi_arlen                    (s_axi_arlen),
       .s_axi_arsize                   (s_axi_arsize),
       .s_axi_arburst                  (s_axi_arburst),
       .s_axi_arlock                   (s_axi_arlock),
       .s_axi_arcache                  (s_axi_arcache),
       .s_axi_arprot                   (s_axi_arprot),
       .s_axi_arqos                    (s_axi_arqos),
       .s_axi_arvalid                  (s_axi_arvalid),
       .s_axi_arready                  (s_axi_arready),
// Slave Interface Read Data Ports
       .s_axi_rid                      (s_axi_rid),
       .s_axi_rdata                    (s_axi_rdata),
       .s_axi_rresp                    (s_axi_rresp),
       .s_axi_rlast                    (s_axi_rlast),
       .s_axi_rvalid                   (s_axi_rvalid),
       .s_axi_rready                   (s_axi_rready),
      
// System Clock Ports
       .sys_clk_i                      (clk200Mhz),
       .device_temp                    (         ),      
       .sys_rst                        (sys_resetn)
);

assign resetn = ~rst;

always @(posedge clk100Mhz)
    aresetn <= resetn;

axi_datamover_0 datamover(
    .m_axi_s2mm_aclk            (clk100Mhz),
    .m_axi_s2mm_aresetn         (resetn),
    .s2mm_err                   (      ),
    .m_axis_s2mm_cmdsts_awclk   (clk100Mhz),
    .m_axis_s2mm_cmdsts_aresetn (resetn),
    .s_axis_s2mm_cmd_tvalid     (m_axis_cmd_tvalid),
    .s_axis_s2mm_cmd_tready     (m_axis_cmd_tready),
    .s_axis_s2mm_cmd_tdata      (m_axis_cmd_tdata),
    .m_axis_s2mm_sts_tvalid     (m_axis_s2mm_sts_tvalid),
    .m_axis_s2mm_sts_tready     ('1),
    .m_axis_s2mm_sts_tdata      (m_axis_s2mm_sts_tdata),
    .m_axis_s2mm_sts_tkeep      (  ),
    .m_axis_s2mm_sts_tlast      (  ),
    .m_axi_s2mm_awid            (m_axi_awid),
    .m_axi_s2mm_awaddr          (m_axi_awaddr),
    .m_axi_s2mm_awlen           (m_axi_awlen),
    .m_axi_s2mm_awsize          (m_axi_awsize),
    .m_axi_s2mm_awburst         (m_axi_awburst),
    .m_axi_s2mm_awprot          (m_axi_awprot),
    .m_axi_s2mm_awcache         (m_axi_awcache),
    .m_axi_s2mm_awuser          (m_axi_awuser),
    .m_axi_s2mm_awvalid         (m_axi_awvalid),
    .m_axi_s2mm_awready         (m_axi_awready),
    .m_axi_s2mm_wdata           (m_axi_wdata),
    .m_axi_s2mm_wstrb           (m_axi_wstrb),
    .m_axi_s2mm_wlast           (m_axi_wlast),
    .m_axi_s2mm_wvalid          (m_axi_wvalid),
    .m_axi_s2mm_wready          (m_axi_wready),
    .m_axi_s2mm_bresp           (m_axi_bresp),
    .m_axi_s2mm_bvalid          (m_axi_bvalid),
    .m_axi_s2mm_bready          (m_axi_bready),
    .s_axis_s2mm_tdata          (m_axis_tdata),
    .s_axis_s2mm_tkeep          ('1),
    .s_axis_s2mm_tlast          (m_axis_tlast),
    .s_axis_s2mm_tvalid         (m_axis_tvalid),
    .s_axis_s2mm_tready         (m_axis_tready)
);

//Choosing which SD File Reader to use
reg[31:0] byte_cnt = '0;    //counter to know when all bytes from the first file are read
reg sd1_done;   //signal that lets us know when the first file reader is done
reg sd_en;  // 0 = first file reader , 1 = second file reader

//count how many bytes have been read from the first file reader
always @(posedge clk100Mhz) begin
    if(outen)
        byte_cnt <= byte_cnt + 1;
end

//count number of bytes read from the second file
reg[31:0] byte_cnt2 = 0;
always @(posedge clk100Mhz) begin
    if(outen2)
        byte_cnt2 <= byte_cnt2 + 1;
end

//assert t_last on the axi stream after first file is read    
assign m_axis_tlast = ((byte_cnt == BITSIZE) && (byte_cnt2 == '0)) ? 1'b1 : 1'b0;
        
initial sd1_done = '0;     
always @(posedge clk100Mhz) begin        
    if (byte_cnt == BITSIZE) //after all bytes from the first file are read turn on second file reader
        sd1_done <= '1; 
end

//turn on second file reader 128 cycles after the first file reader has finished 
reg[7:0] sd2_cnt;
initial sd2_cnt = '0;
always @(posedge clk100Mhz) begin
    if (sd1_done)
        sd2_cnt <= sd2_cnt +1;
end;

initial sd_en = '0;
always @(posedge clk100Mhz) begin
    if (sd2_cnt > 8'b10000000)
        sd_en <= '1;
end;

//create a sd_en pulse to send a new command to the datamover
reg sd_en_pulse;
reg sd_en_pulse2;
initial sd_en_pulse ='0;
initial sd_en_pulse2 = '1;
always @(posedge clk100Mhz) begin
    if(sd_en && sd_en_pulse2) begin
        sd_en_pulse <= 1;
        sd_en_pulse2 <= 0;
    end
    else if(sd_en_pulse2 == 0) begin
        sd_en_pulse <= 0;
    end
end;

//release reset from second file reader when the first file reader is finished
assign sd_resetn2 = sd_en;

//connect to sd ports based on sd_en
assign sd_spi_ssn = (sd_en)? sd_spi_ssn_2 : sd_spi_ssn_1;  //if sd_en is 1 output the sd_spi_ssn port from the second file reader
assign sd_spi_sck = (sd_en)? sd_spi_sck_2 : sd_spi_sck_1;
assign sd_spi_mosi = (sd_en)? sd_spi_mosi_2 : sd_spi_mosi_1;

reg sd_resetn_gen; 
assign sd_resetn = p_resetn & sd_resetn_gen & (~sd_en);   //if sd_en is 1 put the first file reader on reset

initial sd_resetn_gen = '0;
always @(posedge clk100Mhz or negedge resetn)
begin
    if(init_calib_complete) begin
        sd_resetn_gen <= '1;     //after mig is calibrated, enable the first sd card file reader
    end
    if(resetn == 0) begin
        sd_resetn_gen <= '0;
    end
end

//choose which sd file reader's data goes to the datamover
always @(posedge clk100Mhz) begin
    if (sd_en) begin
        m_axis_tdata <= outbyte2;
    end
    else begin
        m_axis_tdata <= outbyte;
    end
end;

always @(posedge clk100Mhz) begin
    if (sd_en) begin
        m_axis_tvalid <= outen2;
    end
    else begin
        m_axis_tvalid <= outen;
    end
end;

//send a cmd signal to datamover
wire[71:0] cmd;
wire[22:0] btt = BITSIZE;  
wire[31:0] address;
wire[31:0] address1 = 32'h0000_0000_1000;    //start address where we write our data
wire[31:0] address2 = 32'h0000_000D_0000;
assign address = (sd_en) ? address2 : address1;
assign cmd = {4'b0000, 4'b0000, address, 1'b0, 1'b1, 6'b000000, 1'b1, btt};
initial m_axis_cmd_tdata <= '0;

reg pulse;
initial pulse = '0;
always @(posedge clk100Mhz or negedge p_resetn)
begin
    if(p_resetn == 0 || sd_en_pulse) begin
        pulse <= '0;
        m_axis_cmd_tvalid <= '0;
        m_axis_cmd_tdata <= '0;
    end
    else if(m_axis_cmd_tready == 1 && pulse == 0) begin
        m_axis_cmd_tvalid <= '1;
        m_axis_cmd_tdata <= cmd;
        pulse <= '1;
    end
    else if(m_axis_cmd_tready == 1 && pulse == 1) begin
        m_axis_cmd_tvalid <= '0;
        m_axis_cmd_tdata <= '0;
    end  
end

//assign vsm_counter_hw_triggers[0] = btn_up;
//assign vsm_counter_hw_triggers[1] = btn_down;

wire[31:0] data_o;
wire[11:0] r_addr_o;
wire r_en;
wire w_en;
//counter from 0 to 31
count_up counter(
    .clk(clk100Mhz),
    .rst(counter_rst),
    .count(led[7:3]),
    .data_o(data_o),
    .r_addr_o(r_addr_o),
    .r_en(r_en),
    .w_en(w_en)
);

//enable led 2 when both files are read
wire sd_read_done;
assign sd_read_done = ((byte_cnt == BITSIZE) && (byte_cnt2 == BITSIZE)) ? 1'b1 : 1'b0;
assign led[2] = sd_read_done;

//////////Counters to measure time to read both file sfrom sd card, and to measure the partial reconfiguration time
reg [40:0]  sd_counter;
initial sd_counter = '0;
//start counting as soon as the first file reader is starting
always @(posedge clk100Mhz) begin
    if(init_calib_complete) begin
        //if both files havent been read yet keep counting
        if(~sd_read_done) begin
            sd_counter <= sd_counter + 1;
        end;
    end
end


reg [31:0]  partial_timer;
reg         partial_id; //check with partial was loaded so we load a different one
initial partial_timer = '0;
initial partial_id = 0;
always @(posedge clk100Mhz) begin
    //start loading partials after both partial bitstreams are written into memory
    if(sd_read_done) begin
        //start the timer after both partials are written into memory
        partial_timer <= partial_timer + 1;
    end
    //when timer reaches 4294967295 cycles (42 secs) load the next partial
    if (partial_timer == 32'b11111111111111111111111111111111) begin
        //if the first partial was loaded we enable the second trigger to load the second partial
        if(partial_id == 0) begin
            vsm_counter_hw_triggers[1] <= 1;
            partial_id <= 1;
        end
        //if the second partial was loaded we enable the first trigger to load the first partial
        else begin
            vsm_counter_hw_triggers[0] <= 1;
            partial_id <= 0;
        end;
    end
    else begin
        vsm_counter_hw_triggers[1] <= 0;
        vsm_counter_hw_triggers[0] <= 0;
    end
 end
    
     
    
reg start_counter;
reg [40:0] pr_counter;
reg dec_activated = 0;
initial pr_counter = '0;
initial start_counter = '0;
always @(posedge clk100Mhz) begin
    //start counting when one of the triggers is enabled
    if(vsm_counter_hw_triggers[0] == 1 || vsm_counter_hw_triggers[1] == 1) begin
        pr_counter <= '0;
        start_counter <= '1;
    end
    if(start_counter == 1) begin
        pr_counter <= pr_counter + 1;
        if(vsm_counter_rm_decouple == 1) begin           
            dec_activated <= 1;
        end
        else if(dec_activated) begin    //if the decoupling signal had started and it finished make start_Counter 0
            start_counter <= '0;
            dec_activated <= 0;
        end
    end
end


//debug ila
ila_0 i_ila(
    .clk(clk100Mhz),
    .probe0(sd_counter),
    .probe1(vsm_counter_rm_decouple),
    .probe2(vsm_counter_hw_triggers),
    .probe3(pr_counter),
    .probe4(start_counter),
    .probe5(dec_activated),
    .probe6(led[7:0]),
    .probe7(counter_rst),
    .probe8(vsm_counter_rm_shutdown_req),
    .probe9(vsm_counter_sw_startup_req),
    .probe10(vsm_counter_sw_shutdown_req),
    .probe11(data_o),
    .probe12(r_addr_o),
    .probe13(r_en),
    .probe14(w_en)
);



dfx_controller_0 i_dfx_controller(
	.clk           (clk100Mhz),
	.reset         (~resetn),
	//ICAP signals
	.icap_clk      (clk100Mhz),
	.icap_reset    (~resetn),
	.icap_csib     (icap_csib),
	.icap_rdwrb    (icap_rdwrb),
	.icap_i        (s_icap_o),
	.icap_o        (s_icap_i),
	.cap_req       (cap_req),
	.cap_gnt       (cap_gnt),
	.cap_rel       (cap_rel),
	//Virtual Socket signals
	.vsm_counter_hw_triggers           (vsm_counter_hw_triggers),
	.vsm_counter_rm_shutdown_req       (vsm_counter_rm_shutdown_req),
	.vsm_counter_rm_shutdown_ack       ('0),
	.vsm_counter_rm_decouple           (vsm_counter_rm_decouple),
	.vsm_counter_rm_reset              (counter_rst),
	.vsm_counter_event_error           (),
	.vsm_counter_sw_shutdown_req       (vsm_counter_sw_shutdown_req),
	.vsm_counter_sw_startup_req        (vsm_counter_sw_startup_req),
	.vsm_counter_m_axis_status_tdata   (),
	.vsm_counter_m_axis_status_tvalid  (),
	//Memory interface ports
	.m_axi_mem_araddr                   (s_axi_araddr),
    .m_axi_mem_arlen                    (s_axi_arlen),
    .m_axi_mem_arsize                   (s_axi_arsize),
    .m_axi_mem_arburst                  (s_axi_arburst),
    .m_axi_mem_arprot                   (s_axi_arprot),
    .m_axi_mem_arcache                  (s_axi_arcache),
    .m_axi_mem_aruser                   (  ),
    .m_axi_mem_arvalid                  (s_axi_arvalid),
    .m_axi_mem_arready                  (s_axi_arready),
    .m_axi_mem_rdata                    (s_axi_rdata),
    .m_axi_mem_rresp                    (s_axi_rresp),
    .m_axi_mem_rlast                    (s_axi_rlast),
    .m_axi_mem_rvalid                   (s_axi_rvalid),
    .m_axi_mem_rready                   (s_axi_rready),
	// JTAG interface ports
	.s_axi_reg_awaddr                   (m_axi_jtag_awaddr),
    .s_axi_reg_awvalid                  (m_axi_jtag_awvalid),
    .s_axi_reg_awready                  (m_axi_jtag_awready),
    .s_axi_reg_wdata                    (m_axi_jtag_wdata),
    .s_axi_reg_wvalid                   (m_axi_jtag_wvalid),
    .s_axi_reg_wready                   (m_axi_jtag_wready),
    .s_axi_reg_bresp                    (m_axi_jtag_bresp),
    .s_axi_reg_bvalid                   (m_axi_jtag_bvalid),
    .s_axi_reg_bready                   (m_axi_jtag_bready),
    .s_axi_reg_araddr                   (m_axi_jtag_araddr),
    .s_axi_reg_arvalid                  (m_axi_jtag_arvalid),
    .s_axi_reg_arready                  (m_axi_jtag_arready),
    .s_axi_reg_rdata                    (m_axi_jtag_rdata),
    .s_axi_reg_rresp                    (m_axi_jtag_rresp),
    .s_axi_reg_rvalid                   (m_axi_jtag_rvalid),
    .s_axi_reg_rready                   (m_axi_jtag_rready)
);


ICAPE2#(
		.DEVICE_ID(32'h3651093),          //Device ID code for Kintex-7 XC7K325T-2FFG900C
		.ICAP_WIDTH("X32")                //Specifies the input and output data width to be used with the ICAPE2.
)
ICAPE2_inst(
		.O        (s_icap_o),               // 32-bit output: Configuration data output bus
		.CLK      (clk100Mhz),              // 1-bit input: Clock Input
		.CSIB     (icap_csib),              // 1-bit input: Active-Low ICAP Enable
		.I        (s_icap_i),               // 32-bit input: Configuration data input bus
		.RDWRB    (icap_rdwrb)              // 1-bit input: Read/Write Select input
);
         
  
endmodule


