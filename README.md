# SecurityReconfiguration
Exploring reconfiguration as a security mechanism for RISC-V processors

This repository contains 4 folders

## cva6attacks

This folder contains 2 implementations of a cache based side channel attack : Prime and Probe and Evict and Reload.
Both attacks are tested on the [CVA6 RISC-V CPU](https://github.com/openhwgroup/cva6) which runs on the [Genesys 2](https://digilent.com/reference/programmable-logic/genesys-2/start) development board.

## cva6

This folder contains all files necessary to run the modified CVA6 onto the Genesys 2 board.

## riscv-tests-linux

This folder contains benchmarks that run on CVA6 with linux.

## Documentation

Holds all documentation found so far on the different RISC-V CPU's and on cache based side channel attacks.
