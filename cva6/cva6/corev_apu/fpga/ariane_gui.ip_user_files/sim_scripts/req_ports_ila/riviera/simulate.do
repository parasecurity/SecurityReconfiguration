onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+req_ports_ila  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.req_ports_ila xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {req_ports_ila.udo}

run 1000ns

endsim

quit -force
