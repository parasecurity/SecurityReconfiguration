onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib dfx_decoupler_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {dfx_decoupler.udo}

run 1000ns

quit -force
