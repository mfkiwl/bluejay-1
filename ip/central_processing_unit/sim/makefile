#===============================================
# 
#===============================================
BLUEJAY := /home/seankent/bluejay
TOOLS := $(BLUEJAY)/tools
SRC := $(BLUEJAY)/ip/central_processing_unit/src
SIM := $(BLUEJAY)/ip/central_processing_unit/sim
TB := $(BLUEJAY)/ip/central_processing_unit/tb


TEST_DIR := $(BLUEJAY)/imperas/imperas-riscv-tests/work/rv64i_m/I
TEST_NAME ?= ADD-01

TESTLIST := ADD-01 ADDW-01 AUIPC-01 BGEU-01 BNE-01 I-ECALL-01 I-MISALIGN_JMP-01 I-RF_size-01 JAL-01 LBU-01 LHU-01 LWU-01 SB-01 SLL-01 SLLW-01 SLTIU-01 SRAI-01 SRL-01 SRLW-01 SW-01 ADDI-01 AND-01 BEQ-01 BLT-01 I-DELAY_SLOTS-01 I-ENDIANESS-01 I-MISALIGN_LDST-01 I-RF_width-01 JALR-01 LD-01 LUI-01 OR-01 SD-01 SLLI-01 SLT-01 SLTU-01 SRAIW-01 SRLI-01 SUB-01 XOR-01 ADDIW-01 ANDI-01 BGE-01 BLTU-01 I-EBREAK-01 I-IO-01 I-NOP-01 I-RF_x0-01 LB-01 LH-01 LW-01 ORI-01 SH-01 SLLIW-01 SLTI-01 SRA-01 SRAW-01 SRLIW-01 SUBW-01 XORI-01

#TESTLIST := LB-01

DIFFS := $(addsuffix .diff, $(TESTLIST))


OUT_DIR := results

ELF := $(TEST_NAME).elf
BIN := $(TEST_NAME).bin
LST := $(TEST_NAME).lst
MEM := $(TEST_NAME).mem


#===============================================
# Sources/Targets
#===============================================
SOURCES_SV := $(wildcard $(SRC)/gen/*.sv) $(wildcard $(TB)/gen/*.sv)
TB_TOP := central_processing_unit__tb
#BEGIN_SIGNATURE := $(shell python3 $(TOOLS)/get_symbol_addr.py $(ELF) begin_signature)
#END_SIGNATURE := $(shell python3 $(TOOLS)/get_symbol_addr.py $(ELF) end_signature)


SNAPSHOT := $(TB_TOP)__snapshot
SNAPSHOT_WDB := $(SNAPSHOT).wdb

PLUSARGS = -testplusarg filename__mem=$(SIM)/$(MEM)  -testplusarg filename__sig=$(SIM)/$(TEST_NAME).signature -testplusarg begin_signature=$(shell python3 $(TOOLS)/get_symbol_addr.py $(ELF) begin_signature) -testplusarg end_signature=$(shell python3 $(TOOLS)/get_symbol_addr.py $(ELF) end_signature)


#===============================================
# Options 
#===============================================
XVLOG_OPTS := --sv --incr --relax
ELAB_OPTS := --relax

all: $(DIFFS) 
	@echo "************************"
	@echo "       RESULTS          "
	@echo "************************"
	@cat $(DIFFS) > test_results
	@cat test_results

%.diff: %.wdb %.signature.output
	echo -n $(*)... > $(SIM)/$(@)
	python3 $(TOOLS)/diff.py $(SIM)/$(*).signature $(SIM)/$(*).signature.output >> $(@) 
	cat $(@)
    

.PRECIOUS: %.signature.output
%.signature.output:
	cp $(TEST_DIR)/$(@) ./$(@)

#===============================
# $(SNAPSHOT_WDB) 
#===============================
.PRECIOUS: %.wdb
%.wdb: xelab.timestamp %_build.timestamp
	#xsim $(SNAPSHOT) --tclbatch xsim_cfg.tcl --testplusarg $(PLUSARGS) --wdb $(@)
	xsim $(SNAPSHOT) --tclbatch xsim_cfg.tcl -testplusarg filename__mem=$(SIM)/$(*).mem  -testplusarg filename__sig=$(SIM)/$(*).signature -testplusarg begin_signature=$(shell python3 $(TOOLS)/get_symbol_addr.py $(*).elf begin_signature) -testplusarg end_signature=$(shell python3 $(TOOLS)/get_symbol_addr.py $(*).elf end_signature) --wdb $(@)

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
	rm -rf *.elf *.bin *.lst *.mem *.signature *.signature.output *.diff



#===============================
# build 
#===============================
.PRECIOUS: %_build.timestamp
%_build.timestamp: %.bin %.lst %.mem 
	touch $(*)_build.timestamp

.PRECIOUS: %.elf
%.elf:
	cp $(TEST_DIR)/$(@) ./$(@)

.PRECIOUS: %.bin
%.bin: %.elf 
	riscv64-unknown-elf-objcopy $< -O binary $@

.PRECIOUS: %.lst
%.lst: %.elf 
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $< > $@

.PRECIOUS: %.mem
%.mem: %.bin
	od -t x1 -An -w1 -v $< > $@ 

