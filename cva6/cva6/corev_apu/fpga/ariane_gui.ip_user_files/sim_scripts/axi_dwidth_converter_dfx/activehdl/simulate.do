onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axi_dwidth_converter_dfx  -L xpm -L generic_baseblocks_v2_1_0 -L fifo_generator_v13_2_7 -L axi_data_fifo_v2_1_26 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_27 -L axi_protocol_converter_v2_1_27 -L axi_clock_converter_v2_1_26 -L blk_mem_gen_v8_4_5 -L axi_dwidth_converter_v2_1_27 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_dwidth_converter_dfx xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {axi_dwidth_converter_dfx.udo}

run

endsim

quit -force
