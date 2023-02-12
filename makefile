TOP := /home/seankent/bluejay

# shell commands
MKDIR := mkdir -p
RM := rm -rf
TOUCH := touch
AWK := awk
CHMOD := chmod
CP := cp
CD := cd

# programs
PYTHON := python3
XVLOG := xvlog
XELAB := xelab
XSIM := xsim


XELAB__OPTS := -relax
XSIM__OPTS :=
XSIM__CFG := $(TOP)/tcl/xsim_cfg.tcl
XVLOG__OPTS := --sv --incr --relax





SNAPSHOT := snapshot

# set the RISCV_BASE environment to either e or i (default)
RISCV_BASE := i
# set the proccessor mode
RISCV_MODE := m
XLEN := 64
MARCH := rv64i
MABI := lp64
RISCV_PREFIX   := riscv64-unknown-elf-
RISCV_GCC      := $(RISCV_PREFIX)gcc
RISCV_OBJDUMP  := $(RISCV_PREFIX)objdump
RISCV_GCC_OPTS := -march=$(MARCH) -mabi=$(MABI) -DXLEN=$(XLEN) -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles $(RVTEST_DEFINES)

define compile-target
$(RISCV_GCC) $(RISCV_GCC_OPTS) -I $(TOP)/imperas/imperas-riscv-tests/riscv-test-suite/env -I $(TOP)/imperas/imperas-riscv-tests/riscv-target/riscvOVPsimPlus -T $(TOP)/imperas/imperas-riscv-tests/riscv-target/riscvOVPsimPlus/link.ld $(1) -o $(2)
endef


TARGET_SIM := $(TOP)/imperas/imperas-riscv-tests/riscv-ovpsim-plus/bin/Linux64/riscvOVPsimPlus.exe
RISCV_TARGET_FLAGS :=
REDIR  := >/dev/null
#COVERENABLE=\
#        --startcover rvtest_code_begin --finishcover rvtest_code_end \
#        --cover $(COVERTYPE) \
#        --extensions I \
#        --outputfile $(*).$(COVERTYPE).coverage.yaml

#(call run-target,test,dir)
define run-target
$(TARGET_SIM) $(TARGET_FLAGS) --variant RV64I --override riscvOVPsim/cpu/tval_ii_code=F --program $(2)/$(1).elf --signaturedump --customcontrol $(COVERENABLE) --override riscvOVPsim/cpu/sigdump/SignatureFile=$(2)/$(1).signature.output --override riscvOVPsim/cpu/sigdump/SignatureGranularity=4 --override riscvOVPsim/cpu/simulateexceptions=T --override riscvOVPsim/cpu/defaultsemihost=F --logfile $(2)/$(1).log --override riscvOVPsim/cpu/user_version=2.3 $(REDIR)
endef




#all: $(TOP)/ip/lib/src/gen/d_flip_flop.sv 
#all: $(TOP)/ip/lib/src/gen/sr_flip_flop.sv 
#all: sim-machine_timer_registers 
#all: $(TOP)/ip/lib/src/gen/d_flip_flop.sv 
#all: ADD-01.elf 
#all: sim-machine_timer_registers 
#all: sim-machine_timer_registers 
#all: diff-machine_timer_registers
all: diff-central_processing_unit
	echo Done

%.elf: %.S
	$(call compile-target,$(<),$(@))


#sim-machine_timer_registers-test__0:
#	echo Hi 


############
# build-ip #
############
# $(call build-ip,$(IP))

#####################
# ip--src--template #
#####################
################################################
# ip--src--template                                                
#
# $(1): ip
################################################
define ip--src--template
$(TOP)/ip/$(1)/src/gen/%.sv: $$(TOP)/ip/$(1)/src/%.b $(TOP)/ip/$(1)/src/gen
	$(PYTHON) $(TOP)/tools/bluejay.py $$(<) $$(@)

$(TOP)/ip/$(1)/src/gen:
	$(MKDIR) $$(@)
endef

################################################
# ip--tb--template                                                
#
# $(1): ip name
################################################
define ip--tb--template
$(TOP)/ip/$(1)/tb/gen/%.sv: $(TOP)/ip/$(1)/tb/%.b $(TOP)/ip/$(1)/tb/gen
	$(PYTHON) $(TOP)/tools/bluejay.py $$(<) $$(@)

$(TOP)/ip/$(1)/tb/gen:
	$(MKDIR) $$(@)
endef



define build-ip 
$(eval $(call ip--src--template,$(1)))
$(eval $(call ip--tb--template,$(1)))
endef


##############
# build-test #
##############
# $(call build-test,$(IP),$(SIM),$(TEST),func)

################################################
# ip--test--template                                                
#
# $(1): ip name
# $(2): sim directory 
# $(3): test name 
################################################
define ip--test--template 
$(1)-$(2)-$(3)-sim: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/sim.timestamp
$(1)-$(2)-$(3)-diff: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/diff.timestamp
$(1)-$(2)-$(3)-ref: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp
$(1)-$(2)-$(3)-setup: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp

setup-$(1)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp

endef


define build-test
sim-$(1)-$(3): $(addsuffix /$(SNAPSHOT).wdb,$(addprefix $(TOP)/ip/$(1)/sim/gen/$(2)/,$(3)))

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(SNAPSHOT).wdb: $(TOP)/ip/$(1)/sim/gen/$(2)/xelab.timestamp $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp | $(TOP)/ip/$(1)/sim/gen/$(2)/$(3) 
	$(CD) $(TOP)/ip/$(1)/sim/gen/$(2) ; $(XSIM) $(SNAPSHOT) --tclbatch $(XSIM__CFG) --wdb $$(@) $(call $(5),$(1),$(2),$(3))

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3):
	$(MKDIR) $$(@)

$(eval $(call $(4),$(1),$(2),$(3)))
     

diff-$(1)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/diff.timestamp

ref-$(1)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp

setup-$(1)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp

endef

define default-build-test-addition
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/diff.timestamp: | sim-$(1)-$(3) ref-$(1)-$(3)
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp: | setup-$(1)-$(3)
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp: | $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)
	$(TOUCH) $$(@)

endef

define cpu-build-test-addition
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).mem $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).lst $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/begin_signature.sig $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/end_signature.sig $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/tohost.sig
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/%.sig: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf
	$(TOUCH) $$(@)
	$(PYTHON) $(TOP)/tools/get_symbol_addr.py $$(<) $$(*) > $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).mem: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).bin
	od -t x1 -An -w1 -v $$(<) > $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).bin: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf
	riscv64-unknown-elf-objcopy $$(<) -O binary $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).lst: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $$(<) > $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf: $(TOP)/ip/$(1)/sim/$(3)/$(3).S | $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)
	$(call compile-target,$$(<),$$(@))

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).log
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).log:
	$(call run-target,$(3),$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/)


$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/diff.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).diff
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).diff: | sim-$(1)-$(3) ref-$(1)-$(3)
	$(PYTHON) $(TOP)/tools/diff.py $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).signature $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).signature.output > $$(@)

endef


define default-xsim-testplusargs
endef

#define cpu-xsim-testplusargs
#-testplusarg filename__mem=$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).mem -testplusarg filename__sig=$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).signature -testplusarg begin_signature=$$(shell python3 $(TOP)/tools/get_symbol_addr.py $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf begin_signature) -testplusarg end_signature=$(shell python3 $(TOP)/tools/get_symbol_addr.py $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf end_signature) -testplusarg tohost=$(shell python3 $(TOP)/tools/get_symbol_addr.py $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf tohost)
#endef

define cpu-xsim-testplusargs
-testplusarg filename__mem=$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).mem -testplusarg filename__sig=$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).signature -testplusarg begin_signature=$$(shell sed -n '1p' $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/begin_signature.sig) -testplusarg end_signature=$$(shell sed -n '1p' $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/end_signature.sig) -testplusarg tohost=$$(shell sed -n '1p' $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/tohost.sig)
endef

#############
# build-sim #
#############
# $(call build-sim,$(IP),$(SIM),$(TESTS),$(SV))
define build-sim
sim-$(1): $(addprefix sim-$(1)-,$(3))
diff-$(1): $(addprefix diff-$(1)-,$(3))

$(TOP)/ip/$(1)/sim/gen/$(2)/xelab.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/xvlog.timestamp
	echo $(4) 
	$(CD) $(TOP)/ip/$(1)/sim/gen/$(2) ; $(XELAB) -debug all $(XELAB__OPTS) -top tb -snapshot $(SNAPSHOT) 
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/xvlog.timestamp: $(4) | $(TOP)/ip/$(1)/sim/gen/$(2)
	$(CD) $(TOP)/ip/$(1)/sim/gen/$(2) ; $(XVLOG) $(XVLOG__OPTS) $(4)
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2): 
	$(MKDIR) $$(@)
endef

#############
# make-test #
#############
# $(call make-test,$(IP),$(SIM),$(TESTS),$(SV),func,xsim-testplusargs)
define make-test
$(foreach _,$(3),$(eval $(call build-test,$(1),$(2),$(_),$(5),$(6))))
$(eval $(call build-sim,$(1),$(2),$(3),$(4)))
endef

SV :=

#######
# lib #
#######
IP := lib

MODULES :=
MODULES += d_flip_flop
MODULES += sr_flip_flop

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
#SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))

###########################
# machine_timer_registers #
###########################
IP := central_processing_unit

MODULES :=
MODULES += central_processing_unit
MODULES += arithmetic_logic_unit
MODULES += register_file
MODULES += comparator
MODULES += decoder
MODULES += control_and_status_registers

TB_MODULES :=
TB_MODULES += tb 
TB_MODULES += memory

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))

###########################
# machine_timer_registers #
###########################
IP := machine_timer_registers

MODULES :=
MODULES += machine_timer_registers

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
#SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))



#
# ...
#







#######
# lib #
#######
IP := lib

SIM := sim__xyz
TESTS := test__a test__b test__c test__d

$(eval $(call build-ip,$(IP)))
#$(eval $(call make-test,$(IP),$(SIM),$(TESTS),$(SV)))


###########################
# machine_timer_registers #
###########################
IP := machine_timer_registers

SIM := sim__xyz
TESTS := test__0 test__1 test__2 test__3

$(eval $(call build-ip,$(IP)))
$(eval $(call make-test,$(IP),$(SIM),$(TESTS),$(SV),default-build-test-addition))


###########################
# central_processing_unit #
###########################
IP := central_processing_unit

SIM := sim__xyz
#TESTS := ADD-01 ADDI-01 ADDW-01 ADDIW-01 AND-01 ANDI-01 AUIPC-01 BEQ-01 BGE-01 BGEU-01 BLT-01 BLTU-01 BNE-01 I-DELAY_SLOTS-01 I-EBREAK-01 I-ECALL-01 I-ENDIANESS-01 I-IO-01 I-MISALIGN_JMP-01 I-MISALIGN_LDST-01 I-NOP-01 I-RF_size-01 I-RF_width-01 I-RF_x0-01 JAL-01 JALR-01 LB-01 LBU-01 LD-01 LH-01 LHU-01 LUI-01 LW-01 LWU-01 OR-01 ORI-01 SB-01 SD-01 SH-01 SLL-01 SLLI-01 SLLIW-01 SLLW-01 SLT-01 SLTI-01 SLTIU-01 SLTU-01 SRA-01 SRAI-01 SRAIW-01 SRAW-01 SRL-01 SRLI-01 SRLIW-01 SRLW-01 SUB-01 SUBW-01 SW-01 XOR-01 XORI-01
TESTS := ADD-01 ADDI-01

$(eval $(call build-ip,$(IP)))
$(eval $(call make-test,$(IP),$(SIM),$(TESTS),$(SV),cpu-build-test-addition,cpu-xsim-testplusargs))



#
# ...
#

.PHONY: clean
clean:
	$(RM) $(shell find $(TOP)/ip/* -name 'gen') 
