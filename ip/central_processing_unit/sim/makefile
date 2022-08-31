#===============================================
# 
#===============================================
BLUEJAY := /home/seankent/bluejay
SRC := $(BLUEJAY)/ip/central_processing_unit/src
SIM := $(BLUEJAY)/ip/central_processing_unit/sim
TB := $(BLUEJAY)/ip/central_processing_unit/tb


TEST_DIR := $(BLUEJAY)/imperas/imperas-riscv-tests/work/rv64i_m/I
TEST_NAME ?= ADD-01


OUT_DIR := results

ELF := $(TEST_NAME).elf
BIN := $(TEST_NAME).bin
LST := $(TEST_NAME).lst
TXT := $(TEST_NAME).txt


#===============================================
# Sources/Targets
#===============================================
SOURCES_SV := $(wildcard $(SRC)/gen/*.sv) $(wildcard $(TB)/gen/*.sv)
TB_TOP := central_processing_unit__tb



SNAPSHOT := $(TB_TOP)__snapshot
SNAPSHOT_WDB := $(SNAPSHOT).wdb

PLUSARGS := \
	"filename=$(SIM)/$(TXT)"


#===============================================
# Options 
#===============================================
XVLOG_OPTS := --sv --incr --relax
ELAB_OPTS := --relax

all: $(TEST_NAME).wdb 

#===============================
# $(SNAPSHOT_WDB) 
#===============================
$(TEST_NAME).wdb: xelab.timestamp $(TEST_NAME)_build.timestamp
	xsim $(SNAPSHOT) --tclbatch xsim_cfg.tcl --testplusarg $(PLUSARGS) --wdb $(@)

#===============================
# xelab.timestamp
#===============================
xelab.timestamp: xvlog.timestamp
	xelab -debug all $(ELAB_OPTS) -top $(TB_TOP) -snapshot $(SNAPSHOT)
	touch xelab.timestamp

#===============================
# xvlog.timestamp
#===============================
xvlog.timestamp: $(SOURCES_SV) 
	xvlog $(XVLOG_OPTS) $(SOURCES_SV)
	touch xvlog.timestamp

#===============================
# waves 
#===============================
.PHONY: waves
waves: $(TEST_NAME).wdb
	xsim --gui $(TEST_NAME).wdb
    
#===============================
# clean 
#===============================
.PHONY: clean 
clean:
	rm -rf *.jou *.log *.pb *.wdb xsim.dir 
	rm -rf *.timestamp 



#===============================
# build 
#===============================
$(TEST_NAME)_build.timestamp: $(BIN) $(LST) $(TXT)
	touch $(TEST_NAME)_build.timestamp

%.elf:
	cp $(TEST_DIR)/$(ELF) ./$(ELF)

%.bin: %.elf 
	riscv64-unknown-elf-objcopy $< -O binary $@

%.lst: %.elf 
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $< > $@

%.txt: %.bin
	od -t x1 -An -w1 -v $< > $@ 

