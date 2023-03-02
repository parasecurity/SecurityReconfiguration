set_property SRC_FILE_INFO {cfile:/home/askyvalos/files/digilent-xdc-master/Genesys-2-Master.xdc rfile:../../../../files/digilent-xdc-master/Genesys-2-Master.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:/home/askyvalos/dfx_genesys/dfx_genesys.srcs/constrs_1/new/pblock_dfx_genesys.xdc rfile:../../../dfx_genesys.srcs/constrs_1/new/pblock_dfx_genesys.xdc id:2} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AD11 IOSTANDARD LVDS} [get_ports clk_n]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN AD12 IOSTANDARD LVDS} [get_ports clk_p]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS12 } [get_ports { rst_n }]; #IO_25_17 Sch=btnc
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN V20 IOSTANDARD LVCMOS33} [get_ports {count_out[3]}]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN V26 IOSTANDARD LVCMOS33} [get_ports {count_out[2]}]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN W24 IOSTANDARD LVCMOS33} [get_ports {count_out[1]}]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN W23 IOSTANDARD LVCMOS33} [get_ports {count_out[0]}]
set_property src_info {type:XDC file:2 line:1 export:INPUT save:INPUT read:READ} [current_design]
create_pblock pblock_inst_count
add_cells_to_pblock [get_pblocks pblock_inst_count] [get_cells -quiet [list inst_count]]
resize_pblock [get_pblocks pblock_inst_count] -add {SLICE_X8Y152:SLICE_X15Y194}
resize_pblock [get_pblocks pblock_inst_count] -add {DSP48_X0Y62:DSP48_X0Y77}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_inst_count]
set_property SNAPPING_MODE ON [get_pblocks pblock_inst_count]
