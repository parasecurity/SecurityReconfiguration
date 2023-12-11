onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+dfx_decoupler  -L xpm -L axis_infrastructure_v1_1_0 -L axis_register_slice_v1_1_27 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_27 -L dfx_decoupler_v1_0_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.dfx_decoupler xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {dfx_decoupler.udo}

run

endsim

quit -force
