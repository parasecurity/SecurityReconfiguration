onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+btn_ila  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.btn_ila xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {btn_ila.udo}

run

endsim

quit -force
