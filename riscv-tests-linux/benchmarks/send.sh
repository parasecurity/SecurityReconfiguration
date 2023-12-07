#script to send the executable to the gateway
DIR=$PWD
scp $DIR/dhrystone.riscv $DIR/median.riscv $DIR/multiply.riscv $DIR/qsort.riscv $DIR/rsort.riscv $DIR/towers.riscv $DIR/vvadd.riscv root@192.168.1.20:/root/