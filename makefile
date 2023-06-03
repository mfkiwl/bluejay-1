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


#XELAB__OPTS := -relax
XELAB__OPTS :=
XSIM__OPTS :=
XSIM__CFG := $(TOP)/tcl/xsim_cfg.tcl
#XVLOG__OPTS := --sv --incr --relax
XVLOG__OPTS := --sv --incr





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




SIM_IP ?= central_processing_unit
#SIM_IP := machine_timer_registers
#all: diff-$(SIM_IP)-sim__xyz 
#all: sim-$(SIM_IP)-sim__xyz 
all: vivado_source 



################################
# defines
################################
.PHONY: defs-sv
defs-sv: $(TOP)/defs/gen/defs.py

.PHONY: defs-c
defs-c: $(TOP)/defs/gen/defs.h


$(TOP)/defs/gen:
	$(MKDIR) $(@)

$(TOP)/defs/gen/defs.py: $(TOP)/defs/defs.py | $(TOP)/defs/gen
	$(PYTHON) $(TOP)/tools/builder.py $(<) $(@) sv

$(TOP)/defs/gen/defs.h: $(TOP)/defs/defs.py | $(TOP)/defs/gen
	$(PYTHON) $(TOP)/tools/builder.py $(<) $(@) c 




################################
# ip--src--dir--template                                                
#
#     $(1): ip 
################################
define ip--src--dir--template
$(TOP)/ip/$(1)/src/gen:
	$(MKDIR) $$(@)
endef

################################
# ip--src--system-verilog--template                                                
#
#     $(1): ip name 
################################
define ip--src--system-verilog--template
$(TOP)/ip/$(1)/src/gen/%.sv: $$(TOP)/ip/$(1)/src/%.b $$(TOP)/defs/gen/defs.py | $(TOP)/ip/$(1)/src/gen
	$(PYTHON) $(TOP)/tools/bluejay.py $$(<) $$(@) $$(TOP)/defs/gen/defs.py
endef

################################
# ip--src--template                                                
#
#     $(1): ip name 
################################
define ip--src--template
.PHONY: src-$(1)
src-$(1): 

$(eval $(call ip--src--dir--template,$(1)))
$(eval $(call ip--src--system-verilog--template,$(1)))
endef


################################
# ip--tb--dir--template
#
#     $(1): ip name 
################################
define ip--tb--dir--template
$(TOP)/ip/$(1)/tb/gen:
	$(MKDIR) $$(@)
endef

################################
# ip--tb--system-verilog--template                                                
#
#     $(1): ip name 
################################
define ip--tb--system-verilog--template
$(TOP)/ip/$(1)/tb/gen/%.sv: $(TOP)/ip/$(1)/tb/%.b $$(TOP)/defs/gen/defs.py | $(TOP)/ip/$(1)/tb/gen
	$(PYTHON) $(TOP)/tools/bluejay.py $$(<) $$(@) $$(TOP)/defs/gen/defs.py
endef

################################
# ip--tb--template                                                
#
#     $(1): ip name 
################################
define ip--tb--template
.PHONY: src-$(1)
src-$(1): 

$(eval $(call ip--tb--dir--template,$(1)))
$(eval $(call ip--tb--system-verilog--template,$(1)))
endef


################################
# ip--sim--dir--template                                                
#
#     $(1): ip name 
#     $(2): simulation name 
################################
define ip--sim--dir--template
$(TOP)/ip/$(1)/sim/gen/$(2): 
	$(MKDIR) $$(@)
endef

################################
# ip--sim--xelab--template                                                
#
#     $(1): ip name 
#     $(2): simulation name
################################
define ip--sim--xelab--template
$(TOP)/ip/$(1)/sim/gen/$(2)/xelab.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/xvlog.timestamp 
	$(CD) $(TOP)/ip/$(1)/sim/gen/$(2) ; $(XELAB) -debug all $(XELAB__OPTS) -top tb -snapshot $(SNAPSHOT) 
	$(TOUCH) $$(@)
endef

################################
# ip--sim--xvlog--template                                                
#
#     $(1): ip name 
#     $(2): simulation name
#     $(3): list of system verilog files
################################
define ip--sim--xvlog--template
$(TOP)/ip/$(1)/sim/gen/$(2)/xvlog.timestamp: $(3) | $(TOP)/ip/$(1)/sim/gen/$(2)
	$(CD) $(TOP)/ip/$(1)/sim/gen/$(2) ; $(XVLOG) $(XVLOG__OPTS) $(3)
	$(TOUCH) $$(@)
endef


################################
# ip--sim--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): list of system verilog files
#     $(4): list of tests 
#     $(5): template to make diff.timestamp 
#     $(6): template to make sim.timestamp 
#     $(7): template to make ref.timestamp 
#     $(8): template to make setup.timestamp 
################################
define ip--sim--template
.PHONY: sim-$(1)-$(2)
sim-$(1)-$(2): $(addprefix sim-$(1)-$(2)-,$(4))

.PHONY: diff-$(1)-$(2)
diff-$(1)-$(2): $(addprefix diff-$(1)-$(2)-,$(4))

$(eval $(call ip--sim--dir--template,$(1),$(2)))
$(eval $(call ip--sim--xelab--template,$(1),$(2)))
$(eval $(call ip--sim--xvlog--template,$(1),$(2),$(3)))
$(foreach test,$(4),$(eval $(call ip--sim-test--template,$(1),$(2),$(test),$(5),$(6),$(7),$(8))))
endef



################################
# ip--sim-test--dir--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name 
################################
define ip--sim-test--dir--template 
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3):
	$(MKDIR) $$(@)
endef

################################
# ip--sim-test--waves--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name 
################################
define ip--sim-test--waves--template 
.PHONY: waves-$(1)-$(2)-$(3)
waves-$(1)-$(2)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(SNAPSHOT).wdb
	xsim --gui $$(<)
endef


################################
# ip--sim-test--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
#     $(4): template to make diff.timestamp 
#     $(5): template to make sim.timestamp 
#     $(6): template to make ref.timestamp 
#     $(7): template to make setup.timestamp 
################################
define ip--sim-test--template 
diff-$(1)-$(2)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/diff.timestamp
sim-$(1)-$(2)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/sim.timestamp
ref-$(1)-$(2)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp
setup-$(1)-$(2)-$(3): $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp

$(eval $(call ip--sim-test--dir--template,$(1),$(2),$(3)))
$(eval $(call ip--sim-test--waves--template,$(1),$(2),$(3)))
$(eval $(call $(4),$(1),$(2),$(3)))
$(eval $(call $(5),$(1),$(2),$(3)))
$(eval $(call $(6),$(1),$(2),$(3)))
$(eval $(call $(7),$(1),$(2),$(3)))
endef


################################
# default--sim-test--diff--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
################################
define default--sim-test--diff--template
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/diff.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/sim.timestamp $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp
	$(TOUCH) $$(@)
endef

################################
# default--sim-test--sim--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
################################
define default--sim-test--sim--template
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/sim.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(SNAPSHOT).wdb
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(SNAPSHOT).wdb: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp
	$(CD) $(TOP)/ip/$(1)/sim/gen/$(2) ; $(XSIM) $(SNAPSHOT) --tclbatch $(XSIM__CFG) --wdb $$(@) 
endef

################################
# default--sim-test--ref--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
################################
define default--sim-test--ref--template
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp
	$(TOUCH) $$(@)
endef

################################
# default--sim-test--setup--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
################################
define default--sim-test--setup--template
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/xelab.timestamp | $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)
	$(TOUCH) $$(@)
endef


################################
# central_processing_unit--sim-test--diff--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
################################
define central_processing_unit--sim-test--diff--template
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/diff.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).diff
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).diff: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/sim.timestamp $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp
	$(PYTHON) $(TOP)/tools/diff.py $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).signature $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).signature.output > $$(@)
endef

################################
# central_processing_unit--sim-test--sim--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
################################
define central_processing_unit--sim-test--sim--template
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/sim.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(SNAPSHOT).wdb
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(SNAPSHOT).wdb: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp
	$(CD) $(TOP)/ip/$(1)/sim/gen/$(2) ; $(XSIM) $(SNAPSHOT) --tclbatch $(XSIM__CFG) --wdb $$(@) -testplusarg filename__mem=$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).mem -testplusarg filename__sig=$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).signature -testplusarg begin_signature=$$(shell sed -n '1p' $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/begin_signature.sig) -testplusarg end_signature=$$(shell sed -n '1p' $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/end_signature.sig) -testplusarg tohost=$$(shell sed -n '1p' $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/tohost.sig)
endef

################################
# central_processing_unit--sim-test--setup--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
################################
define central_processing_unit--sim-test--setup--template
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/setup.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/xelab.timestamp $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).elf $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).mem $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).lst $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/begin_signature.sig $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/end_signature.sig $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/tohost.sig
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
endef


################################
# central_processing_unit--sim-test--ref--template                                                
#
#     $(1): ip name
#     $(2): simulation name 
#     $(3): test name
################################
define central_processing_unit--sim-test--ref--template
$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/ref.timestamp: $(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).log
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/gen/$(2)/$(3)/$(3).log:
	$(call run-target,$(3),$(TOP)/ip/$(1)/sim/gen/$(2)/$(3))
endef




#############
# make-test #
#############
# $(call make-test,$(IP),$(SIM),$(TESTS),$(SV),func,xsim-testplusargs)
define make-test
$(foreach TEST,$(3),$(eval $(call ip--test--template,$(1),$(2),$(TEST))))
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
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

###########################
# central_processing_unit #
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
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

###########################
# machine_timer_registers #
###########################
IP := machine_timer_registers

MODULES :=
MODULES += machine_timer_registers

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

#######################################
# platform_level_interrupt_controller #
#######################################
IP := platform_level_interrupt_controller

MODULES :=
MODULES += platform_level_interrupt_controller
MODULES += platform_level_interrupt_controller__core
MODULES += platform_level_interrupt_controller__gateway
MODULES += platform_level_interrupt_controller__priority_mux


TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

#######################################
# physical_memory_attribute_registers #
#######################################
IP := physical_memory_attribute_registers

MODULES :=
MODULES += physical_memory_attribute_registers


TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

################################
# general_purpose_input_output #
################################
IP := general_purpose_input_output

MODULES :=
MODULES += general_purpose_input_output

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

#####################
# memory_controller #
#####################
IP := memory_controller

MODULES :=
MODULES += memory_controller

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

##########################
# memory_management_unit #
##########################
IP := memory_management_unit

MODULES :=
MODULES += memory_management_unit

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

#########
# utils #
#########
IP := utils

MODULES :=
MODULES += debouncer
MODULES += edge_detector
MODULES += pulse_width_modulator

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif


########
## bus #
########
#IP := bus
#
#MODULES :=
#MODULES += bus
#
#TB_MODULES :=
#TB_MODULES += tb
#
#SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
#ifeq ($(SIM_IP),$(IP))
#SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
#endif

#######
# jay #
#######
IP := jay

MODULES :=
MODULES += jay

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif

#######
# top #
#######
IP := top

MODULES :=
MODULES += top

TB_MODULES :=
TB_MODULES += tb

SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/src/gen/,$(MODULES)))
ifeq ($(SIM_IP),$(IP))
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))
endif




#
# ...
#







#######
# lib #
#######
IP := lib

SIM := sim__xyz
TESTS := test__a test__b test__c test__d

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))


###########################
# machine_timer_registers #
###########################
IP := machine_timer_registers

SIM := sim__xyz
TESTS := test__0 test__1 test__2 test__3

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))


###########################
# central_processing_unit #
###########################
IP := central_processing_unit

SIM := sim__xyz
TESTS := ADD-01 ADDI-01 ADDW-01 ADDIW-01 AND-01 ANDI-01 AUIPC-01 BEQ-01 BGE-01 BGEU-01 BLT-01 BLTU-01 BNE-01 I-DELAY_SLOTS-01 I-EBREAK-01 I-ECALL-01 I-ENDIANESS-01 I-IO-01 I-MISALIGN_JMP-01 I-MISALIGN_LDST-01 I-NOP-01 I-RF_size-01 I-RF_width-01 I-RF_x0-01 JAL-01 JALR-01 LB-01 LBU-01 LD-01 LH-01 LHU-01 LUI-01 LW-01 LWU-01 OR-01 ORI-01 SB-01 SD-01 SH-01 SLL-01 SLLI-01 SLLIW-01 SLLW-01 SLT-01 SLTI-01 SLTIU-01 SLTU-01 SRA-01 SRAI-01 SRAIW-01 SRAW-01 SRL-01 SRLI-01 SRLIW-01 SRLW-01 SUB-01 SUBW-01 SW-01 XOR-01 XORI-01
#TESTS := ADD-01 ADDI-01
#TESTS := BEQ-01
#TESTS := ADD-01

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),central_processing_unit--sim-test--diff--template,central_processing_unit--sim-test--sim--template,central_processing_unit--sim-test--ref--template,central_processing_unit--sim-test--setup--template))


#######################################
# platform_level_interrupt_controller #
#######################################
IP := platform_level_interrupt_controller

SIM := sim__xyz
TESTS := test__0 

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))

#######################################
# physical_memory_attribute_registers #
#######################################
IP := physical_memory_attribute_registers

SIM := sim__xyz
TESTS := test__0 

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))

################################
# general_purpose_input_output #
################################
IP := general_purpose_input_output

SIM := sim__xyz
TESTS := test__0 

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))

#####################
# memory_controller #
#####################
IP := memory_controller

SIM := sim__xyz
TESTS := test__0 

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))

##########################
# memory_management_unit #
##########################
IP := memory_management_unit

SIM := sim__xyz
TESTS := test__0 

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))


#######
# jay #
#######
IP := jay

SIM := sim__xyz
TESTS := test__0 

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))


#########
# utils #
#########
IP := utils

SIM := sim__xyz
TESTS := test__a

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))

########
## bus #
########
#IP := bus
#
#SIM := sim__xyz
#TESTS := test__0 
#
#$(eval $(call ip--src--template,$(IP)))
#$(eval $(call ip--tb--template,$(IP)))
#$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))

#######
# top #
#######
IP := top

SIM := sim__xyz
TESTS := test__0 

$(eval $(call ip--src--template,$(IP)))
$(eval $(call ip--tb--template,$(IP)))
$(eval $(call ip--sim--template,$(IP),$(SIM),$(SV),$(TESTS),default--sim-test--diff--template,default--sim-test--sim--template,default--sim-test--ref--template,default--sim-test--setup--template))

#
# ...
#

##############
# top.sv #
##############
vivado_source: $(TOP)/vivado/bluejay/bluejay.srcs/sources_1/new/top.sv

$(TOP)/vivado/bluejay/bluejay.srcs/sources_1/new/top.sv: $(SV)
	$(RM) $(@) 
	cat $(^) >> $(@)

#$(TOP)/vivado/coe/main.mem: $(TOP)/vivado/coe/main.elf


#$(eval $(call compile-target,$(TOP)/vivado/coe/main.s,$(TOP)/vivado/coe/main.elf))



################################
# freestanding code
################################
CFLAGS :=
CFLAGS += -ffreestanding
CFLAGS += -fno-pic
CFLAGS += -march=$(MARCH)
CFLAGS += -mabi=$(MABI)
#CFLAGS += --entry=_start
#CFLAGS += -lc
#CFLAGS += -lgcc

LDFLAGS :=
LDFLAGS += -nostdlib
LDFLAGS += -nostartfiles
#LDFLAGS += -Wl,-Ttext=0x0
LDFLAGS += -Wl,--no-relax
LDFLAGS += -Wl,-T $(TOP)/link/link.ld 


LDLIBS += -lc
LDLIBS += -lgcc


################################
# code--S-to-o--template                                                
#
#     $(1): object file (.o)
#     $(2): assembly file (.S)
################################
define code--S-to-o--template
$(1): $(2) $(TOP)/defs/gen/defs.h
	riscv64-unknown-elf-gcc -I $(TOP)/defs/gen/ $(CFLAGS) -O -c -o $$(@) $$(<)
endef

################################
# code--c-to-o--template                                                
#
#     $(1): object file (.o)
#     $(2): c file (.c)
################################
define code--c-to-o--template
$(1): $(2) $(TOP)/defs/gen/defs.h
	riscv64-unknown-elf-gcc -I $(TOP)/defs/gen/ -I $(TOP)/lib/ $(CFLAGS) -O3 -c -o $$(@) $$(<)
endef

################################
# code--o-to-elf--template                                                
#
#     $(1): executable file (.elf)
#     $(2): object files (.o)
################################
define code--o-to-elf--template
$(1): $(2)
	riscv64-unknown-elf-gcc $(CFLAGS) $(LDFLAGS) -o $$(@) $$(^) $(LDLIBS)
endef

################################
# code--elf-to-bin--template                                                
#
#     $(1): binary file (.bin)
#     $(2): executable file (.elf)
################################
define code--elf-to-bin--template
$(1): $(2)
	riscv64-unknown-elf-objcopy $$(<) -O binary $$(@)
endef

################################
# code--elf-to-lst--template                                                
#
#     $(1): lst file (.lst)
#     $(2): executable file (.elf)
################################
define code--elf-to-lst--template
$(1): $(2)
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $$(<) > $$(@)
endef

################################
# code--bin-to-mem--template                                                
#
#     $(1): mem file (.mem)
#     $(2): binary file (.bin)
################################
define code--bin-to-mem--template
$(1): $(2)
	od -t x1 -An -w1 -v $$(<) > $$(@)
endef

################################
# code--mem-to-coe--template                                                
#
#     $(1): coe file (.coe)
#     $(2): mem file (.mem)
################################
define code--mem-to-coe--template
$(1): $(2)
	python3 $(TOP)/tools/mem_to_coe.py $$(<) > $$(@)
endef

UCODE :=
UCODE += crt0
#UCODE += trap
#UCODE += stub
#UCODE += bind_isr
#UCODE += init
#UCODE += lib

ASM := $(addsuffix .S,$(addprefix $(TOP)/ucode/,$(UCODE)))
OBJ := $(addsuffix .o,$(addprefix $(TOP)/ucode/,$(UCODE)))

$(foreach i,$(UCODE),$(eval $(call code--S-to-o--template,$(TOP)/ucode/$(i).o,$(TOP)/ucode/$(i).S)))
#$(eval $(call code--S-to-o--template,ucode/crt0.o,ucode/crt0.S))
#$(eval $(call code--S-to-o--template,ucode/trap.o,ucode/trap.S))

#$(eval $(call code--o-to-elf--template,ucode/prog.elf,$(OBJ) $(TOP)/ucode/main.o))
$(eval $(call code--elf-to-bin--template,ucode/prog.bin,ucode/prog.elf))
$(eval $(call code--elf-to-lst--template,ucode/prog.lst,ucode/prog.elf))
$(eval $(call code--bin-to-mem--template,ucode/prog.mem,ucode/prog.bin))
$(eval $(call code--mem-to-coe--template,ucode/prog.coe,ucode/prog.mem))

$(eval $(call code--c-to-o--template,$(TOP)/ucode/main.o,$(TOP)/ucode/main.c))


#src :=
#src += mie
#src += mstatus
#src += mtvec
#src += mcause
#
#cpp := $(addsuffix .s,$(addprefix $(top)/ucode/,$(src)))
#cppobj := $(addsuffix .o,$(addprefix $(top)/ucode/,$(src)))
#
#$(foreach i,$(src),$(eval $(call code--c-to-o--template,$(top)/ucode/$(i).o,$(top)/ucode/$(i).cpp)))
#
#$(eval $(call code--c-to-o--template,$(top)/ucode/libjay.o,$(top)/ucode/libjay.cpp))
#
#$(eval $(call code--o-to-elf--template,ucode/prog.elf,$(obj) $(cppobj) $(top)/ucode/libjay.o))
#
#abc:
#	echo $(obj) 
    

#$(eval $(call code--S-to-o--template,code/crt0.o,code/crt0.S))
#$(eval $(call code--S-to-o--template,code/trap.o,code/trap.S))
#$(eval $(call code--S-to-o--template,code/init.o,code/init.S))
##$(eval $(call code--c-to-o--template,code/lib.o,code/lib.c))
#$(eval $(call code--c-to-o--template,code/main.o,code/main.c))
#$(eval $(call code--o-to-elf--template,code/prog.elf,code/crt0.o code/trap.o code/main.o code/init.o))
#$(eval $(call code--elf-to-bin--template,code/prog.bin,code/prog.elf))
#$(eval $(call code--elf-to-lst--template,code/prog.lst,code/prog.elf))
#$(eval $(call code--bin-to-mem--template,code/prog.mem,code/prog.bin))
#$(eval $(call code--mem-to-coe--template,code/prog.coe,code/prog.mem))

#code/crt0.o: code/crt0.S
#	riscv64-unknown-elf-gcc $(CFLAGS) -O -c -o $(@) $(<)
#
#code/main.o: code/main.c
#	riscv64-unknown-elf-gcc $(CFLAGS) -O -c -o $(@) $(<)
#
#code/prog: code/crt0.o code/main.o
#	riscv64-unknown-elf-gcc $(CFLAGS) $(LDFLAGS) -o $(@) $(^)
#
#code/prog.bin: %.bin: %
#	riscv64-unknown-elf-objcopy $(<) -O binary $(@)
#
#code/prog.lst: %.lst: %
#	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $(<) > $(@)
#
#code/prog.mem: %.mem: %.bin
#	od -t x1 -An -w1 -v $(<) > $(@)
#
#code/prog.coe: %.coe: %.mem
#	python3 $(TOP)/tools/mem_to_coe.py $(<) > $(@)
#


SRC :=
SRC += mie
SRC += mstatus
SRC += mtvec
SRC += mcause
SRC += jay
#SRC += main
#SRC += trap


CPP := $(addsuffix .cpp,$(addprefix $(TOP)/lib/,$(SRC)))
CPPOBJ := $(addsuffix .o,$(addprefix $(TOP)/lib/,$(SRC)))

$(foreach i,$(SRC),$(eval $(call code--c-to-o--template,$(TOP)/lib/$(i).o,$(TOP)/lib/$(i).cpp)))


$(eval $(call code--o-to-elf--template,lib/prog.elf,lib/crt0.o $(CPPOBJ)))


$(eval $(call code--S-to-o--template,lib/crt0.o,lib/crt0.S))
#$(eval $(call code--S-to-o--template,ucode/trap.o,ucode/trap.S))

#$(eval $(call code--o-to-elf--template,ucode/prog.elf,$(OBJ) $(TOP)/ucode/main.o))
$(eval $(call code--elf-to-bin--template,lib/prog.bin,lib/prog.elf))
$(eval $(call code--elf-to-lst--template,lib/prog.lst,lib/prog.elf))
$(eval $(call code--bin-to-mem--template,lib/prog.mem,lib/prog.bin))
$(eval $(call code--mem-to-coe--template,lib/prog.coe,lib/prog.mem))



$(eval $(call code--o-to-elf--template,sw/prog.elf,lib/crt0.o $(CPPOBJ) sw/main.o))
$(eval $(call code--c-to-o--template,sw/main.o,sw/main.cpp))
$(eval $(call code--elf-to-bin--template,sw/prog.bin,sw/prog.elf))
$(eval $(call code--elf-to-lst--template,sw/prog.lst,sw/prog.elf))
$(eval $(call code--bin-to-mem--template,sw/prog.mem,sw/prog.bin))
$(eval $(call code--mem-to-coe--template,sw/prog.coe,sw/prog.mem))


abc:
	echo $(obj) 


.PHONY: clean
clean:
	$(RM) $(shell find $(TOP)/ip/* -name 'gen') 
