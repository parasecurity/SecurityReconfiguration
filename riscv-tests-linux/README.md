*************************************************************************
Benchmarks for RISCV Processor on buildroot-linux
-------------------------------------------------------------------------

This folder contains benchmarks whose source code is modified so that they use default C library functions that run on linux.
Also changed machine mode registers to user mode registers since we can't access machine mode registers in user space of linux.
Removed syscalls.c, stack.S and link.ld files since they are not needed anymore.
Modified makefile by changing riscv cross-compiler and removing uneccessary flags.

**Important** : you have to specify the folder in which the buildroot cross-compiler is located, in the makefile. (e.g. buildoort_dir = /home/$user/cva6-sdk/buildroot/output/host/bin/)

`make all` to compile the benchmarks\
`make clean` to remove
