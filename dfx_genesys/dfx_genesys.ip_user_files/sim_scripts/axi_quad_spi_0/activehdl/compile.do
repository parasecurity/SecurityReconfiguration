vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/dist_mem_gen_v8_0_13
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/fifo_generator_v13_2_7
vlib activehdl/lib_fifo_v1_0_16
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/interrupt_control_v3_1_4
vlib activehdl/axi_quad_spi_v3_2_26
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap dist_mem_gen_v8_0_13 activehdl/dist_mem_gen_v8_0_13
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap fifo_generator_v13_2_7 activehdl/fifo_generator_v13_2_7
vmap lib_fifo_v1_0_16 activehdl/lib_fifo_v1_0_16
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 activehdl/interrupt_control_v3_1_4
vmap axi_quad_spi_v3_2_26 activehdl/axi_quad_spi_v3_2_26
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 \
"/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_13  -v2k5 \
"../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_pkg_v1_0_2 -93  \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93  \
"../../../ipstatic/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93  \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_16 -93  \
"../../../ipstatic/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93  \
"../../../ipstatic/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_26 -93  \
"../../../ipstatic/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../dfx_genesys.gen/sources_1/ip/axi_quad_spi_0/sim/axi_quad_spi_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

