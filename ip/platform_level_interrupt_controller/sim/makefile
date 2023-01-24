#===============================================
# 
#===============================================
BLUEJAY := /home/seankent/bluejay
TOOLS := $(BLUEJAY)/tools
SRC := $(BLUEJAY)/ip/platform_level_interrupt_controller/src
LIB := $(BLUEJAY)/ip/library/src
SIM := $(BLUEJAY)/ip/platform_level_interrupt_controller/sim
TB := $(BLUEJAY)/ip/platform_level_interrupt_controller/tb


#===============================================
# Sources/Targets
#===============================================
SOURCES_SV := $(wildcard $(SRC)/gen/*.sv) $(wildcard $(TB)/gen/*.sv) $(wildcard $(LIB)/gen/*.sv)
TB_TOP := tb__platform_level_interrupt_controller

SNAPSHOT := $(TB_TOP)__snapshot
SNAPSHOT_WDB := $(SNAPSHOT).wdb



#===============================================
# Options 
#===============================================
XVLOG_OPTS := --sv --incr --relax
ELAB_OPTS := --relax


#===============================
# waves 
#===============================
all: $(SNAPSHOT_WDB)
	echo done

#===============================
# waves 
#===============================
.PHONY: waves
waves: $(SNAPSHOT_WDB)
	xsim --gui $(SNAPSHOT_WDB)

#===============================
# $(SNAPSHOT_WDB) 
#===============================
$(SNAPSHOT_WDB): xelab.timestamp 
	#xsim $(SNAPSHOT) --tclbatch xsim_cfg.tcl --testplusarg $(PLUSARGS) --wdb $(@)
	xsim $(SNAPSHOT) --tclbatch xsim_cfg.tcl --wdb $(@) 

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
# clean 
#===============================
.PHONY: clean 
clean:
	rm -rf *.jou *.log *.pb *.wdb xsim.dir 
	rm -rf *.timestamp 
	rm -rf *.elf *.bin *.lst *.mem *.signature *.signature.output *.diff

