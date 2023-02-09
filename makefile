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

TXT =

all: sim-machine_timer_registers 

############
# build-ip #
############
define build-ip
$$(TOP)/ip/$$(IP)/src/gen/%.sv: $$(TOP)/ip/$$(IP)/src/%.b $$(TOP)/ip/$$(IP)/src/gen
	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $$(<) $$(@)

$$(TOP)/ip/$$(IP)/tb/gen/%.sv: $$(TOP)/ip/$$(IP)/tb/%.b $$(TOP)/ip/$$(IP)/tb/gen
	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $$(<) $$(@)

$$(TOP)/ip/$$(IP)/src/gen:
	$(MKDIR) $(MKDIR__OPTS) $$(@)

$$(TOP)/ip/$$(IP)/tb/gen:
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

##############
# build-test #
##############
define build-test
sim-$$(IP)-$$(TEST): $$(addsuffix /$(SNAPSHOT).wdb,$$(addprefix $$(TOP)/ip/$$(IP)/sim/$$(SIM)/,$$(TEST)))

$$(TOP)/ip/$$(IP)/sim/$$(SIM)/$$(TEST)/$(SNAPSHOT).wdb: $$(TOP)/ip/$$(IP)/sim/$$(SIM)/xelab.timestamp | $$(TOP)/ip/$$(IP)/sim/$$(SIM)/$$(TEST)
	$(CD) $$(TOP)/ip/$$(IP)/sim/$$(SIM); $(XSIM) $(SNAPSHOT) --tclbatch $(XSIM__CFG) --wdb $$(@)

$$(TOP)/ip/$$(IP)/sim/$$(SIM)/$$(TEST):
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

#############
# build-sim #
#############
define build-sim
#sim-$$(IP): $$(addsuffix /$(SNAPSHOT).wdb,$$(addprefix $$(TOP)/ip/$$(IP)/sim/$$(SIM)/,$$(TESTS)))
sim-$$(IP): $$(addprefix sim-$$(IP)-,$$(TESTS))

$$(TOP)/ip/$$(IP)/sim/$$(SIM)/xelab.timestamp: $$(TOP)/ip/$$(IP)/sim/$$(SIM)/xvlog.timestamp
	$(CD) $$(TOP)/ip/$$(IP)/sim/$$(SIM) ; $(XELAB) -debug all $(XELAB__OPTS) -top tb -snapshot $(SNAPSHOT) 
	$(TOUCH) $$(@)

$$(TOP)/ip/$$(IP)/sim/$$(SIM)/xvlog.timestamp: $$(SV) |$$(TOP)/ip/$$(IP)/sim/$$(SIM)
	$(CD) $$(TOP)/ip/$$(IP)/sim/$$(SIM) ; $(XVLOG) $(XVLOG__OPTS) $$(SV)
	$(TOUCH) $$(@)

$$(TOP)/ip/$$(IP)/sim/$$(SIM): 
	$(MKDIR) $(MKDIR__OPTS) $$(@)
endef

#############
# make-test #
#############
define make-test
$(foreach TEST,$(TESTS),$(eval $(call build-test)))
$(eval $(call build-sim))
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

$(eval $(call build-ip))
$(eval $(call make-test))


###########################
# machine_timer_registers #
###########################
IP := machine_timer_registers

SIM := sim__xyz
TESTS := test__0 test__1 test__2 test__3

$(eval $(call build-ip))
$(eval $(call make-test))

TXT += $(addsuffix /$(SNAPSHOT).wdb,$(addprefix $(TOP)/ip/$(IP)/sim/$(SIM)/,$(TESTS)))


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

