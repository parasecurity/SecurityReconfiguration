/* Copyright 2018 ETH Zurich and University of Bologna.
 * Copyright and related rights are licensed under the Solderpad Hardware
 * License, Version 0.51 (the "License"); you may not use this file except in
 * compliance with the License.  You may obtain a copy of the License at
 * http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
 * or agreed to in writing, software, hardware and materials distributed under
 * this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 *
 * File: $filename.v
 *
 * Description: Auto-generated bootrom
 */

// Auto-generated code
module bootrom_64 (
   input  logic         clk_i,
   input  logic         req_i,
   input  logic [63:0]  addr_i,
   output logic [63:0]  rdata_o
);
    localparam int RomSize = 907;

    const logic [RomSize-1:0][63:0] mem = {
        64'h00000000_00000000,
        64'h0a0d2165_6e6f6420,
        64'h00000000_20303030,
        64'h30303037_39783020,
        64'h6f742032_206d6165,
        64'h72747374_6962206c,
        64'h61697472_61702067,
        64'h6e697970_6f630a0d,
        64'h00000000_20303030,
        64'h30303035_39783020,
        64'h6f742031_206d6165,
        64'h72747374_6962206c,
        64'h61697472_61702067,
        64'h6e697970_6f630a0d,
        64'h00000000_00206567,
        64'h616d6920_746f6f62,
        64'h20676e69_79706f63,
        64'h00000000_00000009,
        64'h3a656d61_6e090a0d,
        64'h00093a73_65747562,
        64'h69727474_61090a0d,
        64'h00000009_3a61626c,
        64'h20747361_6c090a0d,
        64'h0000093a_61626c20,
        64'h74737269_66090a0d,
        64'h00000000_00000000,
        64'h09202020_20203a64,
        64'h69756720_6e6f6974,
        64'h69747261_70090a0d,
        64'h00000000_00000000,
        64'h093a6469_75672065,
        64'h70797420_6e6f6974,
        64'h69747261_70090a0d,
        64'h00000000_20797274,
        64'h6e65206e_6f697469,
        64'h74726170_20747067,
        64'h00000009_20203a73,
        64'h65697274_6e65206e,
        64'h6f697469_74726170,
        64'h20657a69_73090a0d,
        64'h00000009_3a736569,
        64'h72746e65_206e6f69,
        64'h74697472_61702072,
        64'h65626d75_6e090a0d,
        64'h00000009_2020203a,
        64'h61626c20_73656972,
        64'h746e6520_6e6f6974,
        64'h69747261_70090a0d,
        64'h00093a61_646c2070,
        64'h756b6361_62090a0d,
        64'h00000000_00000000,
        64'h093a6162_6c20746e,
        64'h65727275_63090a0d,
        64'h00000009_3a646576,
        64'h72657365_72090a0d,
        64'h00093a72_65646165,
        64'h685f6372_63090a0d,
        64'h00000000_00000909,
        64'h3a657a69_73090a0d,
        64'h00000009_3a6e6f69,
        64'h73697665_72090a0d,
        64'h0000093a_65727574,
        64'h616e6769_73090a0d,
        64'h00000000_003a7265,
        64'h64616568_20656c62,
        64'h6174206e_6f697469,
        64'h74726170_20747067,
        64'h0000203a_65756c61,
        64'h76206e72_75746572,
        64'h2079706f_63206473,
        64'h00000000_0000000a,
        64'h0d216465_6c696166,
        64'h20647261_63204453,
        64'h00000000_0000000a,
        64'h0d216465_7a696c61,
        64'h6974696e_69206473,
        64'h00000000_0a0d676e,
        64'h69746978_65202e2e,
        64'h2e647320_657a696c,
        64'h61697469_6e692074,
        64'h6f6e2064_6c756f63,
        64'h00000000_0000002e,
        64'h00000000_0000000a,
        64'h0d6b636f_6c622044,
        64'h53206461_65722074,
        64'h6f6e2064_6c756f63,
        64'h0000000a_0d202e2e,
        64'h2e445320_676e697a,
        64'h696c6169_74696e69,
        64'h00000031_34646d63,
        64'h00000035_35646d63,
        64'h00000000_30646d63,
        64'h00000020_3a206573,
        64'h6e6f7073_65720920,
        64'h00000000_0020646e,
        64'h616d6d6f_63204453,
        64'h00000000_203f3f79,
        64'h74706d65_20746f6e,
        64'h206f6669_66207872,
        64'h00000000_00000a0d,
        64'h2164657a_696c6169,
        64'h74696e69_20495053,
        64'h00000000_00007830,
        64'h203a7375_74617473,
        64'h00000000_00000a0d,
        64'h49505320_74696e69,
        64'h00000a0d_21646c72,
        64'h6f57206f_6c6c6548,
        64'h00000000_00000032,
        64'h2d746c75_61666564,
        64'h2d697274_2c786e6c,
        64'h7800746c_75616665,
        64'h642d6972_742c786e,
        64'h6c78006c_6175642d,
        64'h73692c78_6e6c7800,
        64'h746e6573_6572702d,
        64'h74707572_7265746e,
        64'h692c786e_6c780068,
        64'h74646977_2d326f69,
        64'h70672c78_6e6c7800,
        64'h68746469_772d6f69,
        64'h70672c78_6e6c7800,
        64'h322d746c_75616665,
        64'h642d7475_6f642c78,
        64'h6e6c7800_746c7561,
        64'h6665642d_74756f64,
        64'h2c786e6c_7800322d,
        64'h73747570_6e692d6c,
        64'h6c612c78_6e6c7800,
        64'h73747570_6e692d6c,
        64'h6c612c78_6e6c7800,
        64'h72656c6c_6f72746e,
        64'h6f632d6f_69706700,
        64'h736c6c65_632d6f69,
        64'h70672300_73736572,
        64'h6464612d_63616d2d,
        64'h6c61636f_6c007077,
        64'h2d656c62_61736964,
        64'h00736567_6e61722d,
        64'h65676174_6c6f7600,
        64'h79636e65_75716572,
        64'h662d7861_6d2d6970,
        64'h73006f69_7461722d,
        64'h6b63732c_786e6c78,
        64'h00737469_622d7265,
        64'h66736e61_72742d6d,
        64'h756e2c78_6e6c7800,
        64'h73746962_2d73732d,
        64'h6d756e2c_786e6c78,
        64'h00747369_78652d6f,
        64'h6669662c_786e6c78,
        64'h00796c69_6d61662c,
        64'h786e6c78_00687464,
        64'h69772d6f_692d6765,
        64'h72007466_6968732d,
        64'h67657200_73747075,
        64'h72726574_6e690074,
        64'h6e657261_702d7470,
        64'h75727265_746e6900,
        64'h64656570_732d746e,
        64'h65727275_63007665,
        64'h646e2c76_63736972,
        64'h00797469_726f6972,
        64'h702d7861_6d2c7663,
        64'h73697200_73656d61,
        64'h6e2d6765_72006465,
        64'h646e6574_78652d73,
        64'h74707572_7265746e,
        64'h69007365_676e6172,
        64'h00646564_6e657073,
        64'h75732d65_74617473,
        64'h2d6e6961_74657200,
        64'h72656767_6972742d,
        64'h746c7561_6665642c,
        64'h78756e69_6c00736f,
        64'h69706700_656c646e,
        64'h61687000_72656c6c,
        64'h6f72746e_6f632d74,
        64'h70757272_65746e69,
        64'h00736c6c_65632d74,
        64'h70757272_65746e69,
        64'h23007469_6c70732d,
        64'h626c7400_65707974,
        64'h2d756d6d_00617369,
        64'h2c766373_69720073,
        64'h75746174_73006765,
        64'h72006570_79745f65,
        64'h63697665_64007963,
        64'h6e657571_6572662d,
        64'h6b636f6c_63007963,
        64'h6e657571_6572662d,
        64'h65736162_656d6974,
        64'h00687461_702d7475,
        64'h6f647473_006c6564,
        64'h6f6d0065_6c626974,
        64'h61706d6f_6300736c,
        64'h6c65632d_657a6973,
        64'h2300736c_6c65632d,
        64'h73736572_64646123,
        64'h09000000_02000000,
        64'h02000000_02000000,
        64'h01000000_b5000000,
        64'h04000000_03000000,
        64'hffffffff_bf020000,
        64'h04000000_03000000,
        64'hffffffff_ae020000,
        64'h04000000_03000000,
        64'h01000000_a1020000,
        64'h04000000_03000000,
        64'h00000000_8a020000,
        64'h04000000_03000000,
        64'h08000000_79020000,
        64'h04000000_03000000,
        64'h08000000_69020000,
        64'h04000000_03000000,
        64'h00000000_55020000,
        64'h04000000_03000000,
        64'h00000000_43020000,
        64'h04000000_03000000,
        64'h00000000_31020000,
        64'h04000000_03000000,
        64'h00000000_21020000,
        64'h04000000_03000000,
        64'h00000100_00000000,
        64'h00000040_00000000,
        64'h67000000_10000000,
        64'h03000000_11020000,
        64'h00000000_03000000,
        64'h00000000_612e3030,
        64'h2e312d6f_6970672d,
        64'h7370782c_786e6c78,
        64'h1b000000_15000000,
        64'h03000000_02000000,
        64'h05020000_04000000,
        64'h03000000_00000030,
        64'h30303030_30303440,
        64'h6f697067_01000000,
        64'h02000000_00800000,
        64'h00000000_00000030,
        64'h00000000_67000000,
        64'h10000000_03000000,
        64'h00007fe3_023e1800,
        64'hf3010000_06000000,
        64'h03000000_00000000,
        64'h03000000_52010000,
        64'h08000000_03000000,
        64'h03000000_41010000,
        64'h04000000_03000000,
        64'h006b726f_7774656e,
        64'h5b000000_08000000,
        64'h03000000_00687465,
        64'h2d637369_72776f6c,
        64'h1b000000_0c000000,
        64'h03000000_00000000,
        64'h30303030_30303033,
        64'h40687465_2d637369,
        64'h72776f6c_01000000,
        64'h02000000_02000000,
        64'he8010000_00000000,
        64'h03000000_e40c0000,
        64'he40c0000_d9010000,
        64'h08000000_03000000,
        64'h20bcbe00_c7010000,
        64'h04000000_03000000,
        64'h00000000_67000000,
        64'h04000000_03000000,
        64'h00000000_746f6c73,
        64'h2d697073_2d636d6d,
        64'h1b000000_0d000000,
        64'h03000000_00000030,
        64'h40636d6d_01000000,
        64'h04000000_b8010000,
        64'h04000000_03000000,
        64'h08000000_a1010000,
        64'h04000000_03000000,
        64'h01000000_90010000,
        64'h04000000_03000000,
        64'h01000000_80010000,
        64'h04000000_03000000,
        64'h00377865_746e696b,
        64'h74010000_08000000,
        64'h03000000_00100000,
        64'h00000000_00000020,
        64'h00000000_67000000,
        64'h10000000_03000000,
        64'h02000000_02000000,
        64'h52010000_08000000,
        64'h03000000_03000000,
        64'h41010000_04000000,
        64'h03000000_00000000,
        64'h0f000000_04000000,
        64'h03000000_01000000,
        64'h00000000_04000000,
        64'h03000000_00612e30,
        64'h302e322d_6970732d,
        64'h7370782c_786e6c78,
        64'h00622e30_302e322d,
        64'h6970732d_7370782c,
        64'h786e6c78_1b000000,
        64'h28000000_03000000,
        64'h00000000_30303030,
        64'h30303032_40697073,
        64'h2d737078_01000000,
        64'h02000000_006c6f72,
        64'h746e6f63_0b010000,
        64'h08000000_03000000,
        64'h03000000_41010000,
        64'h04000000_03000000,
        64'h00100000_00000000,
        64'h00000018_00000000,
        64'h67000000_10000000,
        64'h03000000_07000000,
        64'h06000000_05000000,
        64'h04000000_52010000,
        64'h10000000_03000000,
        64'h00007265_6d69745f,
        64'h6270612c_706c7570,
        64'h1b000000_0f000000,
        64'h03000000_00003030,
        64'h30303030_38314072,
        64'h656d6974_01000000,
        64'h02000000_04000000,
        64'h67010000_04000000,
        64'h03000000_02000000,
        64'h5d010000_04000000,
        64'h03000000_01000000,
        64'h52010000_04000000,
        64'h03000000_03000000,
        64'h41010000_04000000,
        64'h03000000_00c20100,
        64'h33010000_04000000,
        64'h03000000_80f0fa02,
        64'h4b000000_04000000,
        64'h03000000_00100000,
        64'h00000000_00000010,
        64'h00000000_67000000,
        64'h10000000_03000000,
        64'h00000000_61303535,
        64'h3631736e_1b000000,
        64'h09000000_03000000,
        64'h00000030_30303030,
        64'h30303140_74726175,
        64'h01000000_02000000,
        64'h03000000_b5000000,
        64'h04000000_03000000,
        64'h1e000000_28010000,
        64'h04000000_03000000,
        64'h07000000_15010000,
        64'h04000000_03000000,
        64'h00000004_00000000,
        64'h0000000c_00000000,
        64'h67000000_10000000,
        64'h03000000_09000000,
        64'h02000000_0b000000,
        64'h02000000_f7000000,
        64'h10000000_03000000,
        64'ha0000000_00000000,
        64'h03000000_00306369,
        64'h6c702c76_63736972,
        64'h1b000000_0c000000,
        64'h03000000_01000000,
        64'h8f000000_04000000,
        64'h03000000_00000000,
        64'h00000000_04000000,
        64'h03000000_00000000,
        64'h30303030_30306340,
        64'h72656c6c_6f72746e,
        64'h6f632d74_70757272,
        64'h65746e69_01000000,
        64'h02000000_006c6f72,
        64'h746e6f63_0b010000,
        64'h08000000_03000000,
        64'h00000c00_00000000,
        64'h00000002_00000000,
        64'h67000000_10000000,
        64'h03000000_07000000,
        64'h02000000_03000000,
        64'h02000000_f7000000,
        64'h10000000_03000000,
        64'h00000000_30746e69,
        64'h6c632c76_63736972,
        64'h1b000000_0d000000,
        64'h03000000_00000030,
        64'h30303030_30324074,
        64'h6e696c63_01000000,
        64'hf0000000_00000000,
        64'h03000000_00007375,
        64'h622d656c_706d6973,
        64'h00636f73_2d657261,
        64'h622d656e_61697261,
        64'h2c687465_1b000000,
        64'h1f000000_03000000,
        64'h02000000_0f000000,
        64'h04000000_03000000,
        64'h02000000_00000000,
        64'h04000000_03000000,
        64'h00636f73_01000000,
        64'h02000000_02000000,
        64'hd9000000_00000000,
        64'h03000000_00000074,
        64'h61656274_72616568,
        64'hc3000000_0a000000,
        64'h03000000_00000000,
        64'h01000000_01000000,
        64'hbd000000_0c000000,
        64'h03000000_00000064,
        64'h656c2d74_61656274,
        64'h72616568_01000000,
        64'h00000073_64656c2d,
        64'h6f697067_1b000000,
        64'h0a000000_03000000,
        64'h00000000_7364656c,
        64'h01000000_02000000,
        64'h00000040_00000000,
        64'h00000080_00000000,
        64'h67000000_10000000,
        64'h03000000_00007972,
        64'h6f6d656d_5b000000,
        64'h07000000_03000000,
        64'h00303030_30303030,
        64'h38407972_6f6d656d,
        64'h01000000_02000000,
        64'h02000000_02000000,
        64'h02000000_b5000000,
        64'h04000000_03000000,
        64'h00006374_6e692d75,
        64'h70632c76_63736972,
        64'h1b000000_0f000000,
        64'h03000000_a0000000,
        64'h00000000_03000000,
        64'h01000000_8f000000,
        64'h04000000_03000000,
        64'h00000000_72656c6c,
        64'h6f72746e_6f632d74,
        64'h70757272_65746e69,
        64'h01000000_85000000,
        64'h00000000_03000000,
        64'h00003933_76732c76,
        64'h63736972_7c000000,
        64'h0b000000_03000000,
        64'h00006364_66616d69,
        64'h34367672_72000000,
        64'h0b000000_03000000,
        64'h00000076_63736972,
        64'h00656e61_69726120,
        64'h2c687465_1b000000,
        64'h12000000_03000000,
        64'h00000000_79616b6f,
        64'h6b000000_05000000,
        64'h03000000_00000000,
        64'h67000000_04000000,
        64'h03000000_00757063,
        64'h5b000000_04000000,
        64'h03000000_80f0fa02,
        64'h4b000000_04000000,
        64'h03000000_00000030,
        64'h40757063_01000000,
        64'h40787d01_38000000,
        64'h04000000_03000000,
        64'h00000000_0f000000,
        64'h04000000_03000000,
        64'h01000000_00000000,
        64'h04000000_03000000,
        64'h00000000_73757063,
        64'h01000000_02000000,
        64'h00000030_30323531,
        64'h313a3030_30303030,
        64'h30314074_7261752f,
        64'h636f732f_2c000000,
        64'h1a000000_03000000,
        64'h00006e65_736f6863,
        64'h01000000_00657261,
        64'h622d656e_61697261,
        64'h2c687465_26000000,
        64'h10000000_03000000,
        64'h00766564_2d657261,
        64'h622d656e_61697261,
        64'h2c687465_1b000000,
        64'h14000000_03000000,
        64'h02000000_0f000000,
        64'h04000000_03000000,
        64'h02000000_00000000,
        64'h04000000_03000000,
        64'h00000000_01000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'he8080000_d2020000,
        64'h00000000_10000000,
        64'h11000000_28000000,
        64'h20090000_38000000,
        64'hf20b0000_edfe0dd0,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h46454443_42413938,
        64'h37363534_33323130,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h0000a001_840219e5,
        64'h85930000_059701f4,
        64'h14130010_041be911,
        64'hc6dff0ef_057e65a1,
        64'h4505e2af_f0efdb65,
        64'h05130000_1517df2f,
        64'hf0efe406_08050513,
        64'h20058593_114102fa,
        64'hf53765f1_b1d9e4ef,
        64'hf0ef12a5_05130000,
        64'h1517bb25_e2450513,
        64'h00001517_ee6ff0ef,
        64'h8526e6af_f0eff265,
        64'h05130000_1517e76f,
        64'hf0eff1a5_05130000,
        64'h1517c50d_84aab7df,
        64'hf0ef0562_9e0d2605,
        64'h09700513_1a04a583,
        64'h1a84b603_e9cff0ef,
        64'h14850513_00001517,
        64'hb359e725_05130000,
        64'h1517f34f_f0ef854a,
        64'heb8ff0ef_f7450513,
        64'h00001517_ec4ff0ef,
        64'hf6850513_00001517,
        64'hc50d892a_bcbff0ef,
        64'h05629e0d_26050950,
        64'h05131204_a5831284,
        64'hb603eeaf_f0ef1665,
        64'h05130000_1517bbd1,
        64'hec050513_00001517,
        64'hf82ff0ef_854af06f,
        64'hf0effc25_05130000,
        64'h1517f12f_f0effb65,
        64'h05130000_1517bbf5,
        64'hee850513_00001517,
        64'hfaaff0ef_854af2ef,
        64'hf0effea5_05130000,
        64'h1517f3af_f0effde5,
        64'h05130000_1517c929,
        64'h892ac41f_f0ef9e0d,
        64'h2605855a_508c7490,
        64'hf58ff0ef_1bc50513,
        64'h00001517_f3791de3,
        64'h08098993_080a0a13,
        64'hf70ff0ef_2905f3e5,
        64'h05130000_1517ff5a,
        64'h1be3847f_f0ef0a85,
        64'h000ac503_f8cff0ef,
        64'h1e050513_00001517,
        64'h81bff0ef_0109b503,
        64'hfa0ff0ef_1e450513,
        64'h00001517_82fff0ef,
        64'h0089b503_fb4ff0ef,
        64'h1e850513_00001517,
        64'h843ff0ef_fb8a0a93,
        64'h0009b503_fccff0ef,
        64'h1f050513_00001517,
        64'hff3a9be3_8a1ff0ef,
        64'h0a85000a_c503f90a,
        64'h0a93feaf_f0ef1ee5,
        64'h05130000_1517ff8a,
        64'h99e38bff_f0ef0a85,
        64'h0007c503_015c87b3,
        64'h4a8180bf_f0eff80a,
        64'h0c931f25_05130000,
        64'h15178dff_f0ef0ff9,
        64'h7513823f_f0ef1ee5,
        64'h05130000_15174b91,
        64'h4c411005_1c630201,
        64'h09930801_0a13892a,
        64'h848ad39f_f0ef850a,
        64'h46057101_04892583,
        64'h851ff0ef_01c50513,
        64'h00001517_89fff0ef,
        64'h4556863f_f0ef20e5,
        64'h05130000_15178b1f,
        64'hf0ef4546_875ff0ef,
        64'h20050513_00001517,
        64'h903ff0ef_6526887f,
        64'hf0ef1f25_05130000,
        64'h1517915f_f0ef7502,
        64'h899ff0ef_1f450513,
        64'h00001517_927ff0ef,
        64'h65628abf_f0ef1ee5,
        64'h05130000_15178f9f,
        64'hf0ef4552_8bdff0ef,
        64'h1f050513_00001517,
        64'h90bff0ef_45428cff,
        64'hf0ef1f25_05130000,
        64'h151791df_f0ef4532,
        64'h8e1ff0ef_1f450513,
        64'h00001517_92fff0ef,
        64'h45228f3f_f0ef1f65,
        64'h05130000_1517981f,
        64'hf0ef6502_905ff0ef,
        64'h1f850513_00001517,
        64'h911ff0ef_1e450513,
        64'h00001517_bf5954f9,
        64'h921ff0ef_0ec50513,
        64'h00001517_9afff0ef,
        64'h8526933f_f0ef1ee5,
        64'h05130000_151793ff,
        64'hf0ef1e25_05130000,
        64'h1517c905_84aa890a,
        64'he47ff0ef_850a4585,
        64'h46057101_95dff0ef,
        64'h1e850513_00001517,
        64'h80826125_6ca26c42,
        64'h6be27b02_7aa27a42,
        64'h79e26906_64a66446,
        64'h852660e6_fa040113,
        64'h54fd98bf_f0ef1ee5,
        64'h05130000_1517c905,
        64'hdf3ff0ef_8b2a1080,
        64'he466e862_ec5ef456,
        64'hf852fc4e_e0cae4a6,
        64'hec86f05a_e8a2711d,
        64'hb7655479_80826169,
        64'h6baa6b4a_6aea7a0a,
        64'h79aa794a_74ea640e,
        64'h60ae8522_547d9d7f,
        64'hf0ef2125_05130000,
        64'h1517c61f_f0efc65f,
        64'hf0efc69f_f0efc6df,
        64'hf0efc71f_f0efc75f,
        64'hf0efc79f_f0efc7df,
        64'hf0efa805_c83ff0ef,
        64'hc8dff0ef_45314581,
        64'h46054401_f93046e3,
        64'h20048493_19fda1ff,
        64'hf0ef27a5_05130000,
        64'h1517e799_0369e7b3,
        64'h06891c63_90412901,
        64'h14428c49_cbbff0ef,
        64'h90410305_14130085,
        64'h151bcc9f_f0effc94,
        64'h1ae30404_0413ff7a,
        64'h17e3892a_f15ff0ef,
        64'h0a05854a_0007c583,
        64'h014407b3_04000b93,
        64'h4a01c6df_f0ef850a,
        64'h04000593_86224901,
        64'hff551ee3_d03ff0ef,
        64'he0048413_3e800b13,
        64'h0fe00a93_e9512004,
        64'h8493d1ff_f0ef4549,
        64'h85a20ff6_76130016,
        64'h66130015_161bf4df,
        64'hf0ef0ff4_7593f55f,
        64'hf0ef0ff5_f5930084,
        64'h559bf61f_f0ef0ff5,
        64'hf5930104_559bf6df,
        64'hf0ef4501_0184559b,
        64'hfee79be3_078500c6,
        64'h802300f1_06b30800,
        64'h0713567d_47810209,
        64'hd993842e_84aae55e,
        64'he95aed56_f152f94a,
        64'he586fd26_e1a20206,
        64'h1993f54e_71558082,
        64'h91411542_8d3d8ff9,
        64'h0057979b_17016709,
        64'h0107d79b_0105179b,
        64'h4105551b_0105151b,
        64'h8d2d00c5_95138da9,
        64'h893d0045_d51b8da9,
        64'h91411542_8d5d0522,
        64'h0085579b_808207f5,
        64'h75138d2d_00451593,
        64'h8d2d8d3d_0045d51b,
        64'h0075d79b_8de98082,
        64'h0141853e_640260a2,
        64'h57f5e111_4781f89f,
        64'hf0efc511_57f9efbf,
        64'hf0efc911_57fdeb7f,
        64'hf0effc6d_e0bff0ef,
        64'h347d4429_b95ff0ef,
        64'h3b850513_00001517,
        64'hc8fff0ef_e022e406,
        64'h11418082_61050015,
        64'h351364a2_644260e2,
        64'h0004051b_fc940ce3,
        64'he3fff0ef_eb5ff0ef,
        64'h3e050513_00001517,
        64'h85aa842a_e59ff0ef,
        64'h02900513_400005b7,
        64'h07700613_fbdff0ef,
        64'h4485e822_ec06e426,
        64'h11018082_01410015,
        64'h3513157d_640260a2,
        64'h0004051b_ef5ff0ef,
        64'h41a50513_85a20000,
        64'h1517e91f_f0ef842a,
        64'he9dff0ef_e022e406,
        64'h03700513_45810650,
        64'h06131141_80826105,
        64'h690264a2_644260e2,
        64'h00153513_f5650513,
        64'h0004051b_01249863,
        64'h88bd00f9_1b634501,
        64'h4785ed1f_f0efed5f,
        64'hf0ef842a_edbff0ef,
        64'h84aaee1f_f0efee5f,
        64'hf0efee9f_f0ef892a,
        64'hef5ff0ef_e04ae426,
        64'he822ec06_45211aa0,
        64'h05930870_06131101,
        64'hbfcd4501_80826105,
        64'h690264a2_644260e2,
        64'h4505f8bf_f0ef4585,
        64'h4a850513_00001517,
        64'hfe9915e3_c00df2df,
        64'hf0ef892a_347df3bf,
        64'hf0ef4501_45810950,
        64'h06134485_71040413,
        64'he04aec06_e4266409,
        64'he8221101_b9c96105,
        64'h4a050513_00001517,
        64'h60e26442_da9ff0ef,
        64'h852e65a2_cedff0ef,
        64'h4e850513_00001517,
        64'hcf9ff0ef_8522cfff,
        64'hf0efe42e_ec064ee5,
        64'h05130000_1517842a,
        64'he8221101_80826145,
        64'h64e27402_70a2f47d,
        64'h147d0007_d4634187,
        64'hd79b0185_179bfadf,
        64'hf0efeb7f_f0ef8532,
        64'h06400413_6622ec3f,
        64'hf0ef0ff4_7513ecbf,
        64'hf0ef0ff5_75130084,
        64'h551bed7f_f0ef0ff5,
        64'h75130104_551bee3f,
        64'hf0ef0184_551beebf,
        64'hf0ef0404_e513fedf,
        64'hf0ef84aa_842eec26,
        64'hf022e432_f4067179,
        64'hb7090ff0_05138082,
        64'h557db7d9_00d70023,
        64'h078500f6_073306c8,
        64'h2683ff69_8b055178,
        64'hb77dd6b8_07850007,
        64'h470300f5_07338082,
        64'h4501d3b8_4719dbb8,
        64'h577d2000_07b702b6,
        64'he1630007_869b2000,
        64'h08372000_0537fff5,
        64'h8b85537c_20000737,
        64'hd3b82000_07b71060,
        64'h0713fff5_37fd0001,
        64'h03200793_04b76163,
        64'h0007871b_47812000,
        64'h06b7dbb8_57792000,
        64'h07b706b7_ee631000,
        64'h07938082_610564a2,
        64'hd3b84719_dbb86442,
        64'h60e20ff4_7513577d,
        64'h200007b7_e25ff0ef,
        64'h5f050513_00001517,
        64'heb3ff0ef_91011502,
        64'h4088e3bf_f0ef60e5,
        64'h05130000_1517e395,
        64'h8b852401_53fc57e0,
        64'hff658b05_06478493,
        64'h53f8d3b8_10600713,
        64'h200007b7_fff537fd,
        64'h00010640_0793d7a8,
        64'hdbb85779_e426e822,
        64'hec062000_07b71101,
        64'hbdbd6105_63c50513,
        64'h00001517_64a260e2,
        64'h6442d03c_4799e97f,
        64'hf0ef6625_05130000,
        64'h1517f25f_f0ef9101,
        64'h02049513_2481eaff,
        64'hf0ef65a5_05130000,
        64'h15175064_d03c1660,
        64'h0793ec3f_f0ef68e5,
        64'h05130000_1517f51f,
        64'hf0ef9101_02049513,
        64'h2481edbf_f0ef6865,
        64'h05130000_15175064,
        64'hd03c1040_07932000,
        64'h0437fff5_37fd0001,
        64'h47a9c3b8_47292000,
        64'h07b7f03f_f0efe426,
        64'he822ec06_6a650513,
        64'h11010000_15178082,
        64'h25014108_8082c10c,
        64'h80826105_60e2ecff,
        64'hf0ef0091_4503ed7f,
        64'hf0ef0081_4503f55f,
        64'hf0efec06_002c1101,
        64'h80826145_694264e2,
        64'h740270a2_fe9410e3,
        64'hef9ff0ef_00914503,
        64'hf01ff0ef_34610081,
        64'h4503f81f_f0ef0ff5,
        64'h7513002c_00895533,
        64'h54e10380_0413892a,
        64'hf406e84a_ec26f022,
        64'h71798082_61456942,
        64'h64e27402_70a2fe94,
        64'h10e3f3bf_f0ef0091,
        64'h4503f43f_f0ef3461,
        64'h00814503_fc3ff0ef,
        64'h0ff57513_002c0089,
        64'h553b54e1_4461892a,
        64'hf406e84a_ec26f022,
        64'h71798082_00f58023,
        64'h0007c783_00e580a3,
        64'h97aa8111_00074703,
        64'h973e00f5_7713a6e7,
        64'h87930000_1797b7f5,
        64'h0405f93f_f0ef8082,
        64'h01416402_60a2e509,
        64'h00044503_842ae406,
        64'he0221141_808200e7,
        64'h88230200_071300e7,
        64'h8423fc70_071300e7,
        64'h8623470d_00a78223,
        64'h0ff57513_00e78023,
        64'h0085551b_0ff57713,
        64'h00e78623_f8000713,
        64'h00078223_100007b7,
        64'h02b5553b_0045959b,
        64'h808200a7_0023dfe5,
        64'h0207f793_01474783,
        64'h10000737_80820205,
        64'h75130147_c5031000,
        64'h07b78082_00054503,
        64'h808200b5_00238082,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00000000_00000000,
        64'h00048067_01f49493,
        64'h0010049b_c8458593,
        64'h00001597_f1402573,
        64'hff24c6e3_4009091b,
        64'h02000937_00448493,
        64'hfe091ee3_0004a903,
        64'h00092023_00990933,
        64'h00291913_f1402973,
        64'h020004b7_fe090ae3,
        64'h00897913_34402973,
        64'h10500073_ff24c6e3,
        64'h4009091b_02000937,
        64'h00448493_0124a023,
        64'h00100913_020004b7,
        64'h311000ef_01a11113,
        64'h0210011b_03249663,
        64'hf1402973_00000493,
        64'h30491073_00800913
    };

    logic [$clog2(RomSize)-1:0] addr_q;

    always_ff @(posedge clk_i) begin
        if (req_i) begin
            addr_q <= addr_i[$clog2(RomSize)-1+3:3];
        end
    end

    // this prevents spurious Xes from propagating into
    // the speculative fetch stage of the core
    assign rdata_o = (addr_q < RomSize) ? mem[addr_q] : '0;
endmodule
