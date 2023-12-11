onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+xlnx_mig_7_ddr3  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.xlnx_mig_7_ddr3 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {xlnx_mig_7_ddr3.udo}

run 1000ns

endsim

quit -force
