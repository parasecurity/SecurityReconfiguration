# This folder contains all folders and components necessary to run the modified CVA6 RISC-V CPU on the Genesys 2 board.\

cva6 folder contains the source code. Open /cva6/corev_apu/fpga/ariane_gui.xpr in Vivado to open the project. From there you can run synthesis and generate bitstreams. (CVA6 source code is from commit 24841d307b77a6031f64377cb184dc8157902739 of Fri May 12 19:13:15 2023)\

gen_bins.tcl script takes the generated partial bitstreams and converts them into binary files formatted for the ICAP port.\
Run `source gen_bin.tcl` with vivado and copy the 2 generated partial bistream .bin files to the cva6-sdk folder.\

cva6-sdk contains the linux image and bootloader that are written to the sd card.\
We have modified the makefile so that it writes the 2 partial bitstreams into the sd card aswell.\
Go into the cva6-sdk folder and run `git submodule update --init --recursive`.\
Run `make images` to create the linux image and bootloader. (Make sure you have all the requirements for your system installed, which are specificied in the README.md file of cva6-sdk. make images may take a while to complete and also takes around 10gb of your space.)\
Finally run sudo -E make flash-sdcard SDDEVICE=/dev/sd$ (where $ is the letter that matches your sd card (run lsblk to see which device letter correlates to your sd card)), which will write the linux image, payload.bin, and 2 partial bitstreams to your sd card.\


Insert the sd card onto the Genesys 2 board and load the ariane_xilinx.bit bitstream through Vivado hardware manager.\

Bitstreams folder contains ready bitstreams for different type of reconfiguration periods. You can take the partial bitstreams from there and copy them to the cva6-sdk folder and write them to the SD card.\

## Setting up ssh connection on CVA6\
Connect to cva6 through uart (Open serial connection on /dev/ttyUSB0 with 115200 baudrate (u can use puTTY for this)).\
After CVA6 has finished loading linux go to /etc/ssh. Run `vi sshd_config` to open the sshd configuration and modify the line #PermitRootLogin prohibit-password to PermitRootLogin yes (edit with i, :wq to save). Then go to /etc/init.d and run `./S50sshd restart`.\
To set up ethernet run `ifup eth0`. It will automatically assign an ip address to CVA6 (usually 192.168.1.20).\
Finally run `passwd` to set up a new passwd.\
Now you can connect to CVA6 through ssh by running ssh root@192.168.1.20 and entering the password you created.\
