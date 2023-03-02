create_pblock pblock_inst_count
add_cells_to_pblock [get_pblocks pblock_inst_count] [get_cells -quiet [list inst_count]]
resize_pblock [get_pblocks pblock_inst_count] -add {SLICE_X8Y152:SLICE_X15Y194}
resize_pblock [get_pblocks pblock_inst_count] -add {DSP48_X0Y62:DSP48_X0Y77}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_inst_count]
set_property SNAPPING_MODE ON [get_pblocks pblock_inst_count]
