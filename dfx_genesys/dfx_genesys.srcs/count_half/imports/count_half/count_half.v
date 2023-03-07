//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2005-2020 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, Inc.
// All Rights Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /   Vendor: Xilinx
// \   \   \/    Version: 11.4
//  \   \        Application: Dynamic Function eXchange
//  /   /        Filename: count_up.v
// /___/   /\    Date Last Modified: 14 FEB 2020
// \   \  /  \
//  \___\/\___\
// Board:  KC705 Rev B 
// Device: xc7k325t-1-ffg900
// Design Name: module_count
// Purpose: Dynamic Function eXchange Tutorial
///////////////////////////////////////////////////////////////////////////////
// Reconfigurable Module: module_count
// Binary count up visable on 4 LEDs


//count only from 0 to 7, with 4th LED being always 1
module count (
   rst,
   clk,
   count_out
);

   input rst;                // Active high reset
   input clk;                // 200MHz input clock
   output [3:0] count_out;   // Output to LEDs

   reg [24:0] count;
   reg [2:0]  count_out_s;
   reg [3:0]  count_en = 4'b0101;  // Special init register to test REST_AFTER_RECONFIG(aka GSR)

   //Counter to reduce speed of output
   always @(posedge clk)
      if (rst) begin
         count <= 0;
      end
      else begin
         count <= count + 1;
      end

    always @(posedge clk)
      if (rst)
         count_out_s <= 3'b000;
      else begin
         if (count == 25'b1111111111111111111111111 && count_en == 4'b0101) begin
            count_out_s <= count_out_s + 1;
         end
      end
      
      assign count_out[3] = 1'b1;
      assign count_out[2:0] = count_out_s;
endmodule
