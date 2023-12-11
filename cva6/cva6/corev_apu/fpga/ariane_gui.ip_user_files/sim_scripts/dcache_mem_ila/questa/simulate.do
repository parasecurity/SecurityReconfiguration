onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib dcache_mem_ila_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {dcache_mem_ila.udo}

run 1000ns

quit -force
