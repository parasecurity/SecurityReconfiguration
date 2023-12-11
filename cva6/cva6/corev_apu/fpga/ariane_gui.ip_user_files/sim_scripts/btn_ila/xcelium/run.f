-makelib xcelium_lib/xpm -sv \
  "/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/home/askyvalos/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../ariane_gui.gen/sources_1/ip/btn_ila/sim/btn_ila.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

