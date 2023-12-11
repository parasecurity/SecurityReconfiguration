vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/fifo_generator_v13_2_7
vlib modelsim_lib/msim/axi_clock_converter_v2_1_26
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap fifo_generator_v13_2_7 modelsim_lib/msim/fifo_generator_v13_2_7
vmap axi_clock_converter_v2_1_26 modelsim_lib/msim/axi_clock_converter_v2_1_26
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu  "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../ipstatic/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu  "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -64 -93  \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu  "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_clock_converter_v2_1_26 -64 -incr -mfcu  "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../ipstatic/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../ipstatic/hdl" "+incdir+../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/hdl" \
"../../../../xilinx/xlnx_axi_clock_converter/xlnx_axi_clock_converter.gen/sources_1/ip/xlnx_axi_clock_converter/sim/xlnx_axi_clock_converter.v" \

vlog -work xil_defaultlib \
"glbl.v"

