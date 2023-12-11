vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../ariane_gui.gen/sources_1/ip/lsu_dcache_ila/hdl/verilog" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../ariane_gui.gen/sources_1/ip/lsu_dcache_ila/hdl/verilog" \
"../../../../ariane_gui.gen/sources_1/ip/lsu_dcache_ila/sim/lsu_dcache_ila.v" \

vlog -work xil_defaultlib \
"glbl.v"

