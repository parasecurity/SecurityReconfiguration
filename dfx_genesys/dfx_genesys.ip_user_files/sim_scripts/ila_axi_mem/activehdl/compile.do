vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../dfx_genesys.gen/sources_1/ip/ila_axi_mem/hdl/verilog" \
"/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../dfx_genesys.gen/sources_1/ip/ila_axi_mem/hdl/verilog" \
"../../../../dfx_genesys.gen/sources_1/ip/ila_axi_mem/sim/ila_axi_mem.v" \

vlog -work xil_defaultlib \
"glbl.v"

