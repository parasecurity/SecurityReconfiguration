#script to send the executable to the gateway
DIR=$PWD
scp $DIR/bin/primeprobe.riscv $DIR/bin/evictreload.riscv $DIR/bin/printest.riscv root@192.168.1.20:/root/
