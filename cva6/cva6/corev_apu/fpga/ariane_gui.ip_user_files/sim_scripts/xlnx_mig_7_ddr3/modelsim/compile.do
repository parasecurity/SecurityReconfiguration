vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -mfcu  -sv \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_upsizer.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_aw_channel.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_top.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_a_upsizer.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_addr_decode.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_w_channel.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_incr_cmd.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wrap_cmd.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_command_fifo.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_w_upsizer.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_fsm.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_b_channel.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_write.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel_static.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_fifo.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_r_channel.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg_bank.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_translator.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_register_slice.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_or.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_simple_fifo.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_arbiter.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_and.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_r_upsizer.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wr_cmd_fsm.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_axic_register_slice.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_and.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_read.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_axi_mc_ar_channel.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_or.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_axi.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/xlnx_mig_7_ddr3_mig_sim.v" \
"../../../../xilinx/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3.gen/sources_1/ip/xlnx_mig_7_ddr3/xlnx_mig_7_ddr3/user_design/rtl/xlnx_mig_7_ddr3.v" \

vlog -work xil_defaultlib \
"glbl.v"

