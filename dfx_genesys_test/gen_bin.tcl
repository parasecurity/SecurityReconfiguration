# Convert each partial bitfile into a bin file formatted for the ICAP port
#
set cmd "write_cfgmem -force -format BIN -interface SMAPx32 -disablebitswap -loadbit \"up 0 sdReadtest.runs/impl_1/counter_count_up_partial.bit\" Bitstreams/count_up_partial"
eval $cmd
set cmd "write_cfgmem -force -format BIN -interface SMAPx32 -disablebitswap -loadbit \"up 0 sdReadtest.runs/child_0_impl_1/counter_count_down_partial.bit\" Bitstreams/count_down_partial"
eval $cmd  
