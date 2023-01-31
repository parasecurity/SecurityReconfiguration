# Makefile for cva6-attacks
# Based on the makefile from SonicBOOM Spectre attacks by by Sabbagh Majid , Fei Yunsi and Kaeli David https://github.com/sabbaghm/sonicboom-attacks


# Folders
SRC:=src
INC:=inc
OBJ:=obj
BIN:=bin
DMP:=dump
DEP:=dep

# Commands and flags
CC:=/home/alex/cva6-sdk/buildroot/output/host/bin/riscv64-buildroot-linux-gnu-gcc
OBJDUMP:=/home/alex/cva6-sdk/buildroot/output/host/bin/riscv64-buildroot-linux-gnu-objdump -S
LDFLAGS:=-static -lgcc

CFLAGS=-mcmodel=medany -l -std=gnu99 -O0 -g -fno-common -fno-builtin-printf -Wall -Wno-unused-function -Wno-unused-variable -Wno-unused
DEPFLAGS=-MT $@ -MMD -MP -MF $(DEP)/$*.d
RM=rm -rf

# Programs to compile
PROGRAMS=primeprobe evictreload evicttime
BINS=$(addprefix $(BIN)/,$(addsuffix .riscv,$(PROGRAMS)))
DUMPS=$(addprefix $(DMP)/,$(addsuffix .dump,$(PROGRAMS)))

.PHONY: all
all: $(BINS) $(DUMPS)
bin: $(BINS)
dumps: $(DUMPS)

# Build object files
$(OBJ)/%.o: $(SRC)/%.S
	@mkdir -p $(OBJ)
	$(CC) $(CFLAGS) -D__ASSEMBLY__=1 -c $< -o $@

$(OBJ)/%.o: $(SRC)/%.c
	@mkdir -p $(OBJ)
	@mkdir -p $(DEP)
	$(CC) $(CFLAGS) $(DEPFLAGS) -c $< -o $@

# Build executable
$(BIN)/%.riscv: $(OBJ)/%.o
	@mkdir -p $(BIN)
	$(CC) $(LDFLAGS) $< -o $@

# Build dump
$(DMP)/%.dump: $(BIN)/%.riscv
	@mkdir -p $(DMP)
	$(OBJDUMP) -D $< > $@
	
# Keep the temporary .o files
.PRECIOUS: $(OBJ)/%.o

# Remove all generated files
clean:
	rm -rf $(BIN) $(OBJ) $(DMP) $(DEP)

# Include dependencies
-include $(addprefix $(DEP)/,$(addsuffix .d,$(PROGRAMS)))
