onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+xlnx_axi_clock_converter  -L xpm -L axi_infrastructure_v1_1_0 -L fifo_generator_v13_2_7 -L axi_clock_converter_v2_1_26 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.xlnx_axi_clock_converter xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {xlnx_axi_clock_converter.udo}

run 1000ns

endsim

quit -force
