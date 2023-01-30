# CVA6 Cache based side channel attacks

This folder contains implementations of a prime and probe attack on the CVA6 core developed by openhwgroup https://github.com/openhwgroup/cva6

The code is based on the Prime and Probe attack by Valentin Martinoli, Elouan Tourneur, Yannick Teglia and Régis Leveugle https://github.com/CCALK-work/CCALK

`make allrv` builds the binaries in the binrv folder to run in Verilator.

`make all` builds linux binaries in the bin folder to run on the CVA6 that is configured onto the genesys 2 board.