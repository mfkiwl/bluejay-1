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

IP := ip
LIB := lib
MACHINE_TIMER_REGISTERS := machine_timer_registers
SRC := src
TB := tb
SIM := sim
GEN := gen


SYSTEM_VERILOG__LIST :=
SYSTEM_VERILOG__LIST += $(TOP)/ip/lib/src/gen/d_flip_flop.sv
SYSTEM_VERILOG__LIST += $(TOP)/ip/lib/src/gen/sr_flip_flop.sv
SYSTEM_VERILOG__LIST += $(TOP)/ip/machine_timer_registers/src/gen/machine_timer_registers.sv
SYSTEM_VERILOG__LIST += $(TOP)/ip/machine_timer_registers/tb/gen/tb.sv

TESTS := test__0 test__1 test__2 test__3 test__4
SIM_DIR := $(TOP)/ip/machine_timer_registers/sim/sim__xyz
TEST_DIR__LIST := $(addprefix $(SIM_DIR)/,$(TESTS))
SNAPSHOT_WDB__LIST := $(addsuffix /$(SNAPSHOT).wdb,$(TEST_DIR__LIST))


#all: $(SYSTEM_VERILOG__LIST)
#all: $(TEST_DIR__LIST)
all: $(SNAPSHOT_WDB__LIST)
	@echo Done 

define build-ip-rules
$$(SRC)/$$(GEN)/%.sv: $$(SRC)/%.b $$(SRC)/$$(GEN)
	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $$(<) $$(@)

$$(SRC)/$$(GEN):
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

define build-ip
$$(IP)/src/gen/%.sv: $$(IP)/src/%.b $$(IP)/src/gen
	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $$(<) $$(@)

$$(IP)/tb/gen/%.sv: $$(IP)/tb/%.b $$(IP)/tb/gen
	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $$(<) $$(@)

$$(IP)/src/gen:
	$(MKDIR) $(MKDIR__OPTS) $$(@)

$$(IP)/tb/gen:
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef


define build-test
$$(IP)/sim/$$(SIM)/$$(TEST)/snapshot.wdb: $$(IP)/sim/$$(SIM)/xelab.timestamp | $$(IP)/sim/$$(SIM)/$$(TEST)
	$(CD) $$(IP)/sim/$$(SIM); $(XSIM) snapshot --tclbatch $(XSIM__CFG) --wdb $$(@)

$$(IP)/sim/$$(SIM)/$$(TEST):
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

define build-sim
$$(IP)/sim/$$(SIM)/xelab.timestamp: $$(IP)/sim/$$(SIM)/xvlog.timestamp
	$(CD) $$(IP)/sim/$$(SIM) ; $(XELAB) -debug all $(XELAB__OPTS) -top tb -snapshot snapshot 
	$(TOUCH) $$(@)

$$(IP)/sim/$$(SIM)/xvlog.timestamp: $$(SYSTEM_VERILOG__LIST) | $$(IP)/sim/$$(SIM)
	$(CD) $$(IP)/sim/$$(SIM) ; $(XVLOG) $(XVLOG__OPTS) $$(SYSTEM_VERILOG__LIST)
	$(TOUCH) $$(@)

$$(IP)/sim/$$(SIM): 
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

define make-test
$(foreach TEST,$(TESTS),$(eval $(call build-test)))
$(eval $(call build-sim))
endef



IP := $(TOP)/ip/lib

$(eval $(call build-ip))

#SRC := $(TOP)/ip/lib/src
#TB := $(TOP)/ip/lib/tb
#SIM := $(TOP)/ip/lib/sim

#MODULES :=
#MODULES += d_flip_flop
#MODULES += sr_flip_flop

#$(SRC)/$(GEN)/%.sv: $(SRC)/%.b $(SRC)/$(GEN)
#	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $(<) $(@)
#
#$(SRC)/$(GEN):
#	$(MKDIR) $(MKDIR__OPTS) $(@)
#
#$(eval $(call build-ip-rules))


#SRC := $(TOP)/ip/lib/src
#TB := $(TOP)/ip/lib/tb
#SIM := $(TOP)/ip/lib/sim
#
#MODULES :=
#MODULES += d_flip_flop
#MODULES += sr_flip_flop
#
#$(SRC)/$(GEN)/%.sv: $(SRC)/%.b $(SRC)/$(GEN)
#	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $(<) $(@)
#
#$(SRC)/$(GEN):
#	$(MKDIR) $(MKDIR__OPTS) $(@)


IP := $(TOP)/ip/machine_timer_registers
SIM := sim__xyz
TESTS := test__0 test__1 test__2 test__3 test__4

MODULES :=
MODULES += machine_timer_registers


$(eval $(call build-ip))

#$(SRC)/$(GEN)/%.sv: $(SRC)/%.b $(SRC)/$(GEN) 
#	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $(<) $(@)
#
#$(SRC)/$(GEN):
#	$(MKDIR) $(MKDIR__OPTS) $(@)
#

#TEST := test__0
#$(eval $(call build-test))
#TEST := test__1
#$(eval $(call build-test))

#$(foreach TEST,test__0 test__1 test__2 test__3,$(eval $(call build-test)))



#$(eval $(call build-sim))

$(eval $(call make-test))

