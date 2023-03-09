-makelib xcelium_lib/xpm -sv \
  "/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/home/alex/tools/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../dfx_genesys.gen/sources_1/ip/ila_icap_1/sim/ila_icap.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

