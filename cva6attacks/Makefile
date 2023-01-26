# Makefile for cva6-attacks


# Folders
SRC:=src
INC:=inc
LNK:=link
OBJ:=obj
BIN:=bin
DMP:=dump
DEP:=dep
## For Verilator
SRCRV:=src/verilator
OBJRV:=objrv
BINRV:=binrv
DMPRV:=dumprv

# Commands and flags
CC:=/home/alex/cva6-sdk/buildroot/output/host/bin/riscv64-buildroot-linux-gnu-gcc
OBJDUMP:=/home/alex/cva6-sdk/buildroot/output/host/bin/riscv64-buildroot-linux-gnu-objdump -S
LDFLAGS:=-static -lgcc
## For Verilator
CCRV:=/riscv-gnu-toolchain/bin/riscv64-unknown-elf-gcc
OBJDUMPRV:=/riscv-gnu-toolchain/bin/riscv64-unknown-elf-objdump -S
LDFLAGSRV:=-static -nostdlib -nostartfiles -lgcc

CFLAGS=-mcmodel=medany -l -std=gnu99 -O0 -g -fno-common -fno-builtin-printf -Wall -I$(INC) -Wno-unused-function -Wno-unused-variable -Wno-unused
DEPFLAGS=-MT $@ -MMD -MP -MF $(DEP)/$*.d
RM=rm -rf

# Programs to compile
PROGRAMS=primeprobe
BINS=$(addprefix $(BIN)/,$(addsuffix .riscv,$(PROGRAMS)))
DUMPS=$(addprefix $(DMP)/,$(addsuffix .dump,$(PROGRAMS)))

## For Verilator
BINSRV=$(addprefix $(BINRV)/,$(addsuffix .riscvrv,$(PROGRAMS)))
DUMPSRV=$(addprefix $(DMPRV)/,$(addsuffix .dumprv,$(PROGRAMS)))


.PHONY: all allrv
all: $(BINS) $(DUMPS)
bin: $(BINS)
dumps: $(DUMPS)

## For Verilator
allrv: $(BINSRV) $(DUMPSRV)
binrv: $(BINSRV)
dumpsrv: $(DUMPSRV)

# Build object files
$(OBJ)/%.o: $(SRC)/%.S
	@mkdir -p $(OBJ)
	$(CC) $(CFLAGS) -D__ASSEMBLY__=1 -c $< -o $@

$(OBJ)/%.o: $(SRC)/%.c
	@mkdir -p $(OBJ)
	@mkdir -p $(DEP)
	$(CC) $(CFLAGS) $(DEPFLAGS) -c $< -o $@

## For Verilator	
$(OBJRV)/%.o: $(SRCRV)/%.S
	@mkdir -p $(OBJRV)
	$(CCRV) $(CFLAGS) -D__ASSEMBLY__=1 -c $< -o $@

$(OBJRV)/%.o: $(SRCRV)/%.c
	@mkdir -p $(OBJRV)
	@mkdir -p $(DEP)
	$(CCRV) $(CFLAGS) $(DEPFLAGS) -c $< -o $@

# Build executable
$(BIN)/%.riscv: $(OBJ)/%.o
	@mkdir -p $(BIN)
	$(CC) $(LDFLAGS) $< -o $@

## For Verilator	
$(BINRV)/%.riscvrv: $(OBJRV)/%.o $(OBJRV)/crt.o $(OBJRV)/syscalls.o $(LNK)/link.ld
	@mkdir -p $(BINRV)
	$(CCRV) -T $(LNK)/link.ld $(LDFLAGSRV) $< $(OBJRV)/crt.o $(OBJRV)/syscalls.o -o $@	

# Build dump
$(DMP)/%.dump: $(BIN)/%.riscv
	@mkdir -p $(DMP)
	$(OBJDUMP) -D $< > $@

## For Verilator	
$(DMPRV)/%.dumprv: $(BINRV)/%.riscvrv 
	@mkdir -p $(DMPRV)
	$(OBJDUMPRV) -D $< > $@
	

# Keep the temporary .o files
.PRECIOUS: $(OBJ)/%.o
.PRECIOUS: $(OBJRV)/%.o

# Remove all generated files
clean:
	rm -rf $(BIN) $(OBJ) $(DMP) $(DEP) $(BINRV) $(OBJRV) $(DMPRV)

# Include dependencies
-include $(addprefix $(DEP)/,$(addsuffix .d,$(PROGRAMS)))
