# SecurityReconfiguration
Exploring reconfiguration as a security mechanism for RISC-V processors

# Open Source RISC-V Cores

## [CVA6](https://github.com/openhwgroup/cva6)
- Implemented in Verilog

- Runs Linux on Genesys 2

### Papers regarding cva6
- [Prevention of Microarchitectural Covert Channels on an Open-Source 64-bit RISC-V Core (CVA6)](https://carrv.github.io/2020/papers/CARRV2020_paper_10_Wistoff.pdf)

- [CVA6’s Data cache: Structure and Behavior](https://arxiv.org/ftp/arxiv/papers/2202/2202.03749.pdf)


## [Rocket Core](https://github.com/chipsalliance/rocket-chip)

- Implemented in Chisel

- Runs Linux on following FPGAS : Xilinx VC707, Xilinx KC705, Digilent Genesys 2, Digilent Nexys Video, Digilent Nexys A7 100T by using https://github.com/eugene-tarassov/vivado-risc-v 

- Running linux on rocket with litex https://github.com/litex-hub/linux-on-litex-rocket

## [BOOM](https://github.com/riscv-boom/riscv-boom)

Implemented in Chisel, similar to Rocket

Runs Linux on following FPGAS : Xilinx VC707, Xilinx KC705, Digilent Genesys 2, Digilent Nexys Video, Digilent Nexys A7 100T by using https://github.com/eugene-tarassov/vivado-risc-v 

### Papers regarding BOOM Processor
- [Secure Speculative Execution via RISC-V Open Hardware Design](https://carrv.github.io/2021/papers/CARRV2021_paper_22_Sabbagh.pdf) 
  - Runs Spectre v1, v2 and v5 on BOOM using genesys 2 board.
  - Code of the 3 Spectre variants https://github.com/sabbaghm/sonicboom-attacks.
  
- [Replicating and Mitigating Spectre Attacks on a Open Source RISC-V Microarchitecture (BOOM)](https://carrv.github.io/2019/papers/carrv2019_paper_5.pdf)
  - Spectre v1 and v2 attacks on BOOM using FireSim, a FPGA simulation platform.
  - Code of the attacks https://github.com/riscv-boom/boom-attacks
  
- [Experiment on Replication of Side Channel Attack via Cache of RISC-V Berkeley Out-of-Order Machine (BOOM) Implemented on FPGA](https://carrv.github.io/2020/papers/CARRV2020_paper_2_Le.pdf)
  - Runs a Spectre attack on BOOM using Xilinx SoC ZC706 
  
- [Side-Channel Attacks on RISC-V Processors: Current Progress, Challenges, and Opportunities](https://arxiv.org/pdf/2106.08877.pdf)
  - Runs Prime+probe on BOOM using Xilinx Zynq-7000 FPGA board
  
- [A Real-Time Cache Side-Channel Attack Detection System on RISC-V Out-of-Order Processor](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=9645559)
  - Detects attacks by analyzing the data of hardware performance counters with the use of a neural network
  - Runs Spectre v1 and v2 on BOOM using Xilinx VC707
  
## [ORCA](https://github.com/riscveval/orca-1)

- Implemented in VHDL

- No Linux implementation

- Was used in REHAD paper

[REHAD: Using Low-Frequency Reconfigurable Hardware for Cache Side-Channel Attacks Detection](https://hal.laas.fr/hal-02949624/document)

## [VexRiscV](https://github.com/SpinalHDL/VexRiscv)

Implemented in SpinalHDL

Runs Linux on FPGA Boards by using LiteX  https://github.com/litex-hub/linux-on-litex-vexriscv

## [NEORV32](https://github.com/stnolting/neorv32)

Implemented in VHDL

No Linux Implementation

Setups for FPGA https://github.com/stnolting/neorv32-setups


# Papers about Side Channel Attacks

- [Survey of CPU Cache-Based Side-Channel Attacks: Systematic](Analysis, Security Models, and Countermeasures https://downloads.hindawi.com/journals/scn/2021/5559552.pdf)

- [SafeSpec: Banishing the Spectre of a Meltdown with Leakage-Free Speculation](https://arxiv.org/pdf/1806.05179.pdf)

- [A Survey of Microarchitectural Timing Attacks and Countermeasures on Contemporary Hardware](https://eprint.iacr.org/2016/613.pdf)

- [Software Mitigation of RISC-V Spectre Attacks](https://arxiv.org/pdf/2206.04507v1.pdf (Using BOOM))

# Useful Links

- [Mastik : Implementations of 6 micro architectural side-channel attacks on x86 processors](https://github.com/0xADE1A1DE/Mastik)

- [Code of Spectre v1,v2,v5 attacks on BOOM Processor](https://github.com/sabbaghm/sonicboom-attacks)
