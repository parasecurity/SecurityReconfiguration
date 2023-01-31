#script to send the executable to the gateway
DIR=$PWD
scp $DIR/bin/primeprobe.riscv $DIR/bin/evictreload.riscv $DIR/bin/evicttime.riscv askyvalos@147.27.39.179:/home/askyvalos/alex