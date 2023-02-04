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



# system verilog files
SYSTEM_VERILOG__LIST :=
SYSTEM_VERILOG__LIST += $(TOP)/ip/lib/src/gen/d_flip_flop.sv
SYSTEM_VERILOG__LIST += $(TOP)/ip/lib/src/gen/sr_flip_flop.sv
SYSTEM_VERILOG__LIST += $(TOP)/ip/machine_timer_registers/src/gen/machine_timer_registers.sv
SYSTEM_VERILOG__LIST += $(TOP)/ip/machine_timer_registers/tb/gen/tb.sv

#





TEST__LIST := test__0 test__1
SIMULATION__DIR := $(TOP)/ip/machine_timer_registers/sim/gen/sim__xyz
#TB := $(TOP)/ip/machine_timer_registers/tb/gen/tb.sv
TB := tb
SNAPSHOT := snapshot
SNAPSHOT_WDB__LIST := $(addsuffix /$(SNAPSHOT).wdb,$(addprefix $(SIMULATION__DIR)/,$(TEST__LIST)))

#SIM_DIR := $(CURDIR)/unit__0/sim/sim__xyz


XELAB__TIMESTAMP := $(SIMULATION__DIR)/xelab.timestamp 
XVLOG__TIMESTAMP := $(SIMULATION__DIR)/xvlog.timestamp 
#$(XVLOG) $(XELAB__OPTS) -top $(TB) -snapshot $(SNAPSHOT) 

all: $(SNAPSHOT_WDB__LIST)
	echo $(SNAPSHOT_WDB__LIST)
	echo Done 


$(SYSTEM_VERILOG__LIST): 
	$(MKDIR) $(MKDIR__OPTS) $(dir $(@)) 
	$(PYTHON) $(PYTHON__OPTS) $(TOP)/tools/bluejay.py $(subst .sv,.b,$(subst gen/,,$(@))) $(@)

$(SNAPSHOT_WDB__LIST): $(XELAB__TIMESTAMP)
	$(MKDIR) $(MKDIR__OPTS) $(dir $(@)) 
	$(CD) $(SIMULATION__DIR) ; $(XSIM) $(SNAPSHOT) --tclbatch $(XSIM__CFG) --wdb $(@)

$(XELAB__TIMESTAMP): $(XVLOG__TIMESTAMP)
	$(CD) $(SIMULATION__DIR) ; $(XELAB) -debug all $(XELAB__OPTS) -top $(TB) -snapshot $(SNAPSHOT) 
	$(TOUCH) $(@) 

$(XVLOG__TIMESTAMP): $(SYSTEM_VERILOG__LIST)
	$(MKDIR) $(MKDIR__OPTS) $(dir $(@)) 
	$(CD) $(SIMULATION__DIR) ; $(XVLOG) $(XVLOG__OPTS) $(SYSTEM_VERILOG__LIST)
	$(TOUCH) $(@) 


TEST_DIRS := $(addprefix $(SIM_DIR)/,$(TESTS))


#XELAB_TIMESTAMPS := $(addsuffix /xelab.timestamp,$(TEST_DIRS))
#XVLOG_TIMESTAMPS := $(addsuffix /xvlog.timestamp,$(TEST_DIRS))

X := $(subst xelab,xvlog,$(XELAB_TIMESTAMPS))


$(SNAPSHOT_WDBS): 
	$(TOUCH) $(@) 

#    $(MKDIR) $(TESTDIR) 
#    cd $(SIM_DIR) ; xsim $(SNAPSHOT) --tclbatch $(XSIM_CFG) --wdb $(@) ; cd -

$(XELAB_TIMESTAMPS): $(subst xelab,xvlog,$%)  
	$(TOUCH) $(@) 

#    cd $(SIM_DIR) ; $(XELAB) -debug all $(ELAB_OPTS) -top $(TB_TOP) -snapshot $(SNAPSHOT) ; cd -
#    $(TOUCH) $(@) 

$(XVLOG_TIMESTAMPS): 
	$(TOUCH) $(@) 


$(TEST_DIRS): $(SIM_DIR)
	$(MKDIR) $(@)

$(SIM_DIR):
	$(MKDIR) $(@)


