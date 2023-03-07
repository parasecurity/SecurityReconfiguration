set_property SRC_FILE_INFO {cfile:/home/alex/SecurityReconfiguration/dfx_genesys/dfx_genesys.srcs/constrs_1/imports/digilent-xdc-master/Genesys-2-Master.xdc rfile:../../../dfx_genesys.srcs/constrs_1/imports/digilent-xdc-master/Genesys-2-Master.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:/home/alex/SecurityReconfiguration/dfx_genesys/dfx_genesys.srcs/constrs_1/new/pblock.xdc rfile:../../../dfx_genesys.srcs/constrs_1/new/pblock.xdc id:2} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AD11  IOSTANDARD LVDS     } [get_ports { clk_n }]; #IO_L12N_T1_MRCC_33 Sch=sysclk_n
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AD12  IOSTANDARD LVDS     } [get_ports { clk_p }]; #IO_L12P_T1_MRCC_33 Sch=sysclk_p
set_property src_info {type:XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
set icap_clock       [get_clocks -of_objects [get_ports ICAPE2_inst/CLK]]
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS12 } [get_ports { GPIO_SW_C }]; #IO_25_17 Sch=btnc
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M19   IOSTANDARD LVCMOS12 } [get_ports { GPIO_SW_S }]; #IO_0_15 Sch=btnd
set_property src_info {type:XDC file:1 line:18 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B19   IOSTANDARD LVCMOS12 } [get_ports { GPIO_SW_N }]; #IO_L24N_T3_17 Sch=btnu
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T28   IOSTANDARD LVCMOS33 } [get_ports { count_out[5]  }]; #IO_L11N_T1_SRCC_14 Sch=led[0]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports { count_out[4]  }]; #IO_L19P_T3_A10_D26_14 Sch=led[1]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U30   IOSTANDARD LVCMOS33 } [get_ports { count_out[3]  }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=led[2]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U29   IOSTANDARD LVCMOS33 } [get_ports { count_out[2]  }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=led[3]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { count_out[1]  }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=led[4]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V26   IOSTANDARD LVCMOS33 } [get_ports { count_out[0]  }]; #IO_L16P_T2_CSI_B_14 Sch=led[5]
set_property src_info {type:XDC file:1 line:395 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AD27  IOSTANDARD LVCMOS33 } [get_ports { spi_sck }]; #IO_L11P_T1_SRCC_13 Sch=prog_d0/sck
set_property src_info {type:XDC file:1 line:396 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W27   IOSTANDARD LVCMOS33 } [get_ports { spi_mosi}]; #IO_L2P_T0_13 Sch=prog_d1/mosi
set_property src_info {type:XDC file:1 line:397 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W28   IOSTANDARD LVCMOS33 } [get_ports { spi_miso }]; #IO_L2N_T0_13 Sch=prog_d2/miso
set_property src_info {type:XDC file:1 line:398 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W29   IOSTANDARD LVCMOS33 } [get_ports { spi_ss }]; #IO_L4P_T0_13 Sch=prog_d3/ss
set_property src_info {type:XDC file:2 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_pblock pblock_inst_count
add_cells_to_pblock [get_pblocks pblock_inst_count] [get_cells -quiet [list inst_count]]
resize_pblock [get_pblocks pblock_inst_count] -add {SLICE_X6Y155:SLICE_X19Y198}
resize_pblock [get_pblocks pblock_inst_count] -add {DSP48_X0Y62:DSP48_X1Y77}
resize_pblock [get_pblocks pblock_inst_count] -add {RAMB18_X0Y62:RAMB18_X0Y77}
resize_pblock [get_pblocks pblock_inst_count] -add {RAMB36_X0Y31:RAMB36_X0Y38}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_inst_count]
set_property SNAPPING_MODE ON [get_pblocks pblock_inst_count]
