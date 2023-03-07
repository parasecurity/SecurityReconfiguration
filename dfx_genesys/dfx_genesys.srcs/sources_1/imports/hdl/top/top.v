////////////////////////////////////////////////////////////////////////////////
//// Copyright (c) 2005-2020 Xilinx, Inc.
//// This design is confidential and proprietary of Xilinx, Inc.
//// All Rights Reserved.
/////////////////////////////////////////////////////////////////////////////////
////   ____  ____
////  /   /\/   /
//// /___/  \  /   Vendor: Xilinx
//// \   \   \/    Version: 12.2
////  \   \        Application: Dynamic Function eXchange using GSR
////  /   /        Filename: top.v
//// /___/   /\    Date Last Modified: 14 FEB 2020
//// \   \  /  \
////  \___\/\___\
////
////
//// Board:  KC705 Rev B 
//// Device: xc7k325t-1-ffg900
//// Design Name: led_shift_count
//// Purpose: Dynamic Function eXchange Tutorial
/////////////////////////////////////////////////////////////////////////////////
////
////    Project : led_shift_count_gsr
//// Description: This design outputs LED patterns based on two reconfigurable
////              modules.  The recon_block_bram module ouput depends on the
////              BRAM contents within the reconfig module.  The recon_block_counter
////              module output depends on the counter within the reconfig
////              module.  Partial bit files can be created and downloaded that
////              change the contents of the BRAM and the behavior of the counter.
////              The fisrt four leds are assigned to the BRAM RM which will rotate the
////              LEDS right or left depending on which RM is configured into the device. 
////              The Counter RM will count up or down depending on which RM in configured into the device.
////              The Center button will reset both RMs. The Counter RM operation depends on
////              the initialized contents of a register called count_en. count_en will be set
////              to 0101 in order for CountUP to work and 1010 in order to get CountDown to work.
////              Button 3 can be used to manually increment the count_en value. This button is
////              designs to manually set the en_count to the correct value. Note that button 3 has  
////              debounce logic on it to avoid getting too many button pushs which would make it
////              hard to set count_en to the correct value. This means you have to push button 3 slowly
////              to manually get the count_en set to the correct value, at which time the COUNT logic will
////              start working after being reconfigured. The GSR will allow you to program without
////              having to reset the init value manually. GSR will mask out all non COUNT_UP/DOWN frames
////              so that the Shutdown and Startup happens. Using the GSR methodology for this design with init values
////              will work without having to manually reset the count_en init value. The methodology to test this
////              in ISE 14.1 is To Program the device with full configuration one where COUNT will count down. Then
////              Program the GST.bit for masking of non count frames. Then program the partial bitstream for Count up.
////              Then run a batch script impact -batch  wei/prog_cor1 This script sets the COR1 bit number 24 so that
////              startup will happen. Then it runs a grestore. The script Prog_shutdown does not set COR1 but it does a
////              shutdown - grestore - startup
////
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
////  Top-level, static design
////////////////////////////////////////////////////////////////////////////////

//module top(
//   input        clk_p,       // 200MHz differential input clock
//   input        clk_n,       // 200MHz differential input clock
//   input        rst_n,       // Reset mapped to center push button
//   output [5:0] count_out   // mapped to general purpose LEDs[4-7]
//);

//   wire        rst;
//   reg [34:0]  count;
//   wire        gclk;
//   wire [35:0] icon_control;
   

//   // Rev A board CPU reset (has active high reset button) and Rev B using board GPUI reset (has active high reset button)
//   assign rst = rst_n;
//   // Rev B board (has active low reset button)
//   // assign rst = ~rst_n;
//   // In module_shift instantiation of inst_shift below
//   //      .en       (~rst),
  

//   // instantiate clock module to divide 200MHz to 100MHz
//   clocks U0_clocks (
//      .clk_p(clk_p),
//      .clk_n(clk_n),
//      .rst(rst),
//      .clk_out(gclk)
//   );

 
//   // instantiate module count
//   count inst_count (
//      .rst       (rst),
//      .clk       (gclk),
//      .count_out (count_out[3:0])
//   );
   
//  dfx_controller_0 dfx_ctrl (
//    .m_axi_mem_araddr(),
//    .m_axi_mem_arlen(),
//    .m_axi_mem_arsize(),
//    .m_axi_mem_arburst(),
//    .m_axi_mem_arprot(),
//    .m_axi_mem_arcache(),
//    .m_axi_mem_aruser(),
//    .m_axi_mem_arvalid(),
//    .m_axi_mem_arready(),
//    .m_axi_mem_rdata(),
//    .m_axi_mem_rresp(),
//    .m_axi_mem_rlast(),
//    .m_axi_mem_rvalid(),
//    .m_axi_mem_rready(),
//    .clk(gclk),
//    .reset(rst),
//    .icap_clk(gclk),
//    .icap_reset(rst),
//    .icap_csib(),
//    .icap_rdwrb(),
//    .icap_i(),
//    .icap_o(),
//    .vsm_counter_hw_triggers(),
//    .vsm_counter_rm_shutdown_req(),
//    .vsm_counter_rm_shutdown_ack(),
//    .vsm_counter_rm_decouple(),
//    .vsm_counter_rm_reset(),
//    .vsm_counter_event_error(),
//    .vsm_counter_sw_shutdown_req(),
//    .vsm_counter_sw_startup_req(),
//    .vsm_counter_m_axis_status_tdata(),
//    .vsm_counter_m_axis_status_tvalid(),
//    .cap_req(),
//    .cap_gnt(),
//    .cap_rel(),
//    .s_axi_reg_awaddr(),
//    .s_axi_reg_awvalid(),
//    .s_axi_reg_awready(),
//    .s_axi_reg_wdata(),
//    .s_axi_reg_wvalid(),
//    .s_axi_reg_wready(),
//    .s_axi_reg_bresp(),
//    .s_axi_reg_bvalid(),
//    .s_axi_reg_bready(),
//    .s_axi_reg_araddr(),
//    .s_axi_reg_arvalid(),
//    .s_axi_reg_arready(),
//    .s_axi_reg_rdata(),
//    .s_axi_reg_rresp(),
//    .s_axi_reg_rvalid(),
//    .s_axi_reg_rready()
//  );
   


//   // MAIN
//    assign count_out[5:4] = 2'b11;

//endmodule

//// black box definition for module_count
////module count(
////   input        rst,
////   input        clk,
////   output [3:0] count_out);
////endmodule


