# Create a programming file for the PROM containing the static and the 
# partial bitstreams
# 
# 

# ------------------------------
# Options for the complete MCS
# ------------------------------
set final_target    "-format MCS"
set options         "-force -checksum FF -size 32"
set spi_options     "-interface SPIx1"

set static  "top"
set partials  { \
                    inst_count_count_down_partial\
                    inst_count_count_half_partial\
                    inst_count_count_up_partial\
              }

# Convert each partial bitfile into a bin file formatted for the ICAP port
#
foreach p $partials {
    set cmd "write_cfgmem -force -format BIN -interface SMAPx32 -disablebitswap -loadbit \"up 0 Bitstreams/$p.bit\" Bitstreams/$p"
    eval $cmd 
}

# Now do the static and pack the partials as datafiles
set cmd "write_cfgmem $options $final_target $spi_options -loadbit \"up 0 Bitstreams/${static}.bit \" -loaddata \""
# append cmd " up 00AEA000 Bitstreams/inst_count_count_up_partial.bin"
# append cmd " up 00B7AC00 Bitstreams/inst_count_count_half_partial.bin"
# append cmd " up 00C0B800 Bitstreams/inst_count_count_down_partial.bin"
append cmd "\" Bitstreams/dfx_prom"

puts $cmd
eval $cmd 


# Now create a report with the sizes
foreach p $partials {
    set ret [file size Bitstreams/$p.bin]
    puts "$p : $ret bytes"
}

#exit

