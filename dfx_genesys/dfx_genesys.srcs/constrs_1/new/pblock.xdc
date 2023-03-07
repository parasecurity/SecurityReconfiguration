create_pblock pblock_inst_count
add_cells_to_pblock [get_pblocks pblock_inst_count] [get_cells -quiet [list inst_count]]
resize_pblock [get_pblocks pblock_inst_count] -add {SLICE_X6Y155:SLICE_X19Y198}
resize_pblock [get_pblocks pblock_inst_count] -add {DSP48_X0Y62:DSP48_X1Y77}
resize_pblock [get_pblocks pblock_inst_count] -add {RAMB18_X0Y62:RAMB18_X0Y77}
resize_pblock [get_pblocks pblock_inst_count] -add {RAMB36_X0Y31:RAMB36_X0Y38}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_inst_count]
set_property SNAPPING_MODE ON [get_pblocks pblock_inst_count]
