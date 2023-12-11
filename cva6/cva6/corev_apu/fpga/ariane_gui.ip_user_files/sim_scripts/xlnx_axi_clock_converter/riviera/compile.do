vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/fifo_generator_v13_2_7
vlib riviera/axi_clock_converter_v2_1_26
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap fifo_generator_v13_2_7 riviera/fifo_generator_v13_2_7
vmap axi_clock_converter_v2_1_26 riviera/axi_clock_converter_v2_1_26
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93  \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_clock_converter_v2_1_26  -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../ipstatic/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/sim/xlnx_axi_clock_converter.v" \

vlog -work xil_defaultlib \
"glbl.v"

