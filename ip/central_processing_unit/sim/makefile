#===============================================
# Setting
#===============================================
TOP_DIR := $(shell dirname $(shell pwd))
SRC := $(TOP_DIR)/src
TB := $(TOP_DIR)/tb
SIM := $(TOP_DIR)/sim

#===============================================
# Sources/Targets
#===============================================
SOURCES_SV := $(wildcard $(SRC)/gen/*.sv) $(wildcard $(TB)/gen/*.sv)
TOP := central_processing_unit__tb
SNAPSHOT := $(TOP)__snapshot
SNAPSHOT_WDB := $(SNAPSHOT).wdb
PLUSARGS := "filename=/home/seankent/bluejay/ip/central_processing_unit/sim/prog/simple/sim__0.txt"


#===============================================
# Options 
#===============================================
COMP_OPTS_SV := \
    --sv \
	--incr \
	--relax

ELAB_OPTS := \
	--relax


#===============================
# $(SNAPSHOT_WDB) 
#===============================
$(SNAPSHOT_WDB): xelab 
	echo $(PLUSARGS)
	xsim $(SNAPSHOT) --tclbatch xsim_cfg.tcl --testplusarg $(PLUSARGS)

#===============================
# xelab
#===============================
xelab: xvlog 
	xelab -debug all $(ELAB_OPTS) -top $(TOP) -snapshot $(SNAPSHOT)

#===============================
# xvlog 
#===============================
xvlog:
	xvlog $(COMP_OPTS_SV) $(SOURCES_SV)

#===============================
# waves 
#===============================
.PHONY: waves
waves: $(SNAPSHOT_WDB)
	xsim --gui $(SNAPSHOT_WDB)
    
#===============================
# clean 
#===============================
.PHONY: clean 
clean:
	rm -rf *.jou *.log *.pb *.wdb xsim.dir 
	rm -rf .*.timestamp 
