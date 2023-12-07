# Convert each partial bitfile into a bin file formatted for the ICAP port
#
set curDir [pwd]
#folder where the partial bitstreams are located
set dirName $curDir/cva6/corev_apu/fpga/ariane_gui.runs
set cmd "write_cfgmem -force -format BIN -interface SMAPx32 -disablebitswap -loadbit \"up 0 $dirName/impl_1/i_ariane_i_cva6_i_cache_subsystem_dcache_wt_dcache_partial.bit\" $curDir/dcache_1_partial"
eval $cmd
set cmd "write_cfgmem -force -format BIN -interface SMAPx32 -disablebitswap -loadbit \"up 0 $dirName/child_1_impl_1/i_ariane_i_cva6_i_cache_subsystem_dcache_wt_dcache_2_partial.bit\" $curDir/dcache_2_partial"
eval $cmd 