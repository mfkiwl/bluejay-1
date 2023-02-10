TOP := /home/seankent/bluejay

# shell commands
MKDIR := mkdir
MKDIR__OPTS := -p

RM := rm
RM__OPTS := -rf

TOUCH := touch
TOUCH__OPTS :=

AWK := awk
AWK__OPTS :=

CHMOD := chmod
CHMOD__OPTS :=

CP := cp
CP__OPTS :=

CD := cd
CD__OPTS :=

XVLOG := xvlog
XVLOG__OPTS := --sv --incr --relax

XELAB := xelab
XELAB__OPTS := -relax

XSIM := xsim
XSIM__OPTS :=
XSIM__CFG := $(TOP)/tcl/xsim_cfg.tcl

PYTHON := python3
PYTHON__OPTS :=


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


#all: $(TOP)/ip/lib/src/gen/d_flip_flop.sv 
#all: $(TOP)/ip/lib/src/gen/sr_flip_flop.sv 
#all: sim-machine_timer_registers 
#all: $(TOP)/ip/lib/src/gen/d_flip_flop.sv 
#all: sim-machine_timer_registers 
all: ADD-01.elf 
	echo Done

%.elf: %.S
	$(call compile-target,$(<),$(@))


#sim-machine_timer_registers-test__0:
#	echo Hi 

############
# build-ip #
############
# $(call build-ip,$(IP))
define build-ip
$(TOP)/ip/$(1)/src/gen/%.sv: $$(TOP)/ip/$(1)/src/%.b $(TOP)/ip/$(1)/src/gen
	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $$(<) $$(@)

$(TOP)/ip/$(1)/tb/gen/%.sv: $(TOP)/ip/$(1)/tb/%.b $(TOP)/ip/$(1)/tb/gen
	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $$(<) $$(@)

$(TOP)/ip/$(1)/src/gen:
	$(MKDIR) $(MKDIR__OPTS) $$(@)

$(TOP)/ip/$(1)/tb/gen:
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

##############
# build-test #
##############
# $(call build-test,$(IP),$(SIM),$(TEST))
define build-test
sim-$(1)-$(3): $(addsuffix /$(SNAPSHOT).wdb,$(addprefix $(TOP)/ip/$(1)/sim/$(2)/,$(3)))

$(TOP)/ip/$(1)/sim/$(2)/$(3)/$(SNAPSHOT).wdb: $(TOP)/ip/$(1)/sim/$(2)/xelab.timestamp | $(TOP)/ip/$(1)/sim/$(2)/$(3)
	cd $(TOP)/ip/$(1)/sim/$(2); $(XSIM) $(SNAPSHOT) --tclbatch $(XSIM__CFG) --wdb $$(@)

$(TOP)/ip/$(1)/sim/$(2)/$(3):
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

#############
# build-sim #
#############
# $(call build-sim,$(IP),$(SIM),$(TESTS),$(SV))
define build-sim
sim-$(1): $(addprefix sim-$(1)-,$(3))

$(TOP)/ip/$(1)/sim/$(2)/xelab.timestamp: $(TOP)/ip/$(1)/sim/$(2)/xvlog.timestamp
	cd $(TOP)/ip/$(1)/sim/$(2) ; $(XELAB) -debug all $(XELAB__OPTS) -top tb -snapshot $(SNAPSHOT) 
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/$(2)/xvlog.timestamp: $(4) | $(TOP)/ip/$(1)/sim/$(2)
	cd $(TOP)/ip/$(1)/sim/$(2) ; $(XVLOG) $(XVLOG__OPTS) $(4)
	$(TOUCH) $$(@)

$(TOP)/ip/$(1)/sim/$(2): 
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

#############
# make-test #
#############
# $(call make-test,$(IP),$(SIM),$(TESTS),$(SV))
define make-test
$(foreach _,$(3),$(eval $(call build-test,$(1),$(2),$(_))))
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
TB_MODULES += central_processing_unit__tb
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
SV += $(addsuffix .sv,$(addprefix $(TOP)/ip/$(IP)/tb/gen/,$(TB_MODULES)))



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
$(eval $(call make-test,$(IP),$(SIM),$(TESTS),$(SV)))


###########################
# central_processing_unit #
###########################
IP := central_processing_unit

SIM := sim__xyz
TESTS := add-01 

$(eval $(call build-ip,$(IP)))
#$(eval $(call make-test,$(IP),$(SIM),$(TESTS),$(SV)))



#
# ...
#



#
#SYSTEM_VERILOG__LIST :=
#SYSTEM_VERILOG__LIST += $(TOP)/ip/lib/src/gen/d_flip_flop.sv
#SYSTEM_VERILOG__LIST += $(TOP)/ip/lib/src/gen/sr_flip_flop.sv
#SYSTEM_VERILOG__LIST += $(TOP)/ip/machine_timer_registers/src/gen/machine_timer_registers.sv
#SYSTEM_VERILOG__LIST += $(TOP)/ip/machine_timer_registers/tb/gen/tb.sv
#
#TESTS := test__0 test__1 test__2 test__3 test__4
#SIM_DIR := $(TOP)/ip/machine_timer_registers/sim/sim__xyz
#TEST_DIR__LIST := $(addprefix $(SIM_DIR)/,$(TESTS))
#SNAPSHOT_WDB__LIST := $(addsuffix /$(SNAPSHOT).wdb,$(TEST_DIR__LIST))
#
#
##all: $(SYSTEM_VERILOG__LIST)
##all: $(TEST_DIR__LIST)
#
#
#
#
#
#
#
#
#$(eval $(call build-ip))
#
##SRC := $(TOP)/ip/lib/src
##TB := $(TOP)/ip/lib/tb
##SIM := $(TOP)/ip/lib/sim
#
##MODULES :=
##MODULES += d_flip_flop
##MODULES += sr_flip_flop
#
##$(SRC)/$(GEN)/%.sv: $(SRC)/%.b $(SRC)/$(GEN)
##	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $(<) $(@)
##
##$(SRC)/$(GEN):
##	$(MKDIR) $(MKDIR__OPTS) $(@)
##
##$(eval $(call build-ip-rules))
#
#
##SRC := $(TOP)/ip/lib/src
##TB := $(TOP)/ip/lib/tb
##SIM := $(TOP)/ip/lib/sim
##
##MODULES :=
##MODULES += d_flip_flop
##MODULES += sr_flip_flop
##
##$(SRC)/$(GEN)/%.sv: $(SRC)/%.b $(SRC)/$(GEN)
##	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $(<) $(@)
##
##$(SRC)/$(GEN):
##	$(MKDIR) $(MKDIR__OPTS) $(@)
#
#
#IP := $(TOP)/ip/machine_timer_registers
#SIM := sim__xyz
#TESTS := test__0 test__1 test__2 test__3 test__4
#
#MODULES :=
#MODULES += machine_timer_registers
#
#
#
##$(SRC)/$(GEN)/%.sv: $(SRC)/%.b $(SRC)/$(GEN) 
##	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $(<) $(@)
##
##$(SRC)/$(GEN):
##	$(MKDIR) $(MKDIR__OPTS) $(@)
##
#
##TEST := test__0
##$(eval $(call build-test))
##TEST := test__1
##$(eval $(call build-test))
#
##$(foreach TEST,test__0 test__1 test__2 test__3,$(eval $(call build-test)))
#
#
#
##$(eval $(call build-sim))
#
#$(eval $(call make-test))

