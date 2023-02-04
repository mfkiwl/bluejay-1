TOP := /home/seankent/bluejay

MKDIR := mkdir -p
RM := rm -rf
TOUCH := touch
AWK := awk
CHMOD := chmod
CP := cp

XVLOG := xvlog
XVLOG_OPTS := --sv --incr --relax
XELAB := xelab
ELAB_OPTS := --relax
XSIM := xsim


TEST_LIST := add addi 
#SIM_DIR := $(CURDIR)/unit__0/sim/sim__xyz


SIM_DIR := $(CURDIR)/unit__0/sim/sim__zzz

TESTS := test__0 test__1

TEST_DIRS := $(addprefix $(SIM_DIR)/,$(TESTS))

#XELAB_TIMESTAMPS := $(CURDIR)/unit__0/sim/sim__zzz/test__0/xelab.timestamp
#XVLOG_TIMESTAMPS := $(CURDIR)/unit__0/sim/sim__zzz/test__0/xvlog.timestamp


XELAB_TIMESTAMPS := $(addsuffix /xelab.timestamp,$(TEST_DIRS))
XVLOG_TIMESTAMPS := $(addsuffix /xvlog.timestamp,$(TEST_DIRS))

X := $(subst xelab,xvlog,$(XELAB_TIMESTAMPS))

#all: $(SIM_DIR)__run #$(SIM_DIR)/test__0__run $(SIM_DIR)/test__1__run
.PHONY: all
all: $(TEST_DIRS) $(XELAB_TIMESTAMPS)
	echo $(CURDIR) 
	echo $(XVLOG_TIMESTAMPS) 

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


#define create-test
#$1/$2__run: timestamp 
#
#timestamp: $1/$2__mkdir
#	$(TOUCH) $$@
#
#$1/$2__mkdir: $1__mkdir
#	$(MKDIR) $1/$2 
#	echo $2 
#endef
#
#define create-sim
#$1__mkdir: 
#	$(MKDIR) $1 
#	echo $1 
#endef
#
#
#$(eval $(call create-sim, $(SIM_DIR)))
##$(eval $(call create-test,$(SIM_DIR),test__0))
##$(eval $(call create-test,$(SIM_DIR),test__1))
#
#$(foreach test,$(TESTS),$(eval $(call create-test,$(SIM_DIR),$(test))))

#$(XVLOG_TIMESTAMPS):
	#touch $(@) 


#    cd $(SIM_DIR) ; $(XVLOG) $(XVLOG_OPTS) $(SV) ; cd -
#    $(TOUCH) $(@) 



.PHONY: unit__0__sim
unit__0__sim: unit__0__sim__test__0 unit__0__sim__test__1
	@echo Done: unit__0__sim 

unit__0__sim__test__0: unit__0__sim__test__0__xsim 
	@echo Done: unit__0__sim__test__0 

unit__0__sim__test__0__xsim: unit__0__sim__test__0__gen 
	touch unit__0/sim/sim__x/test__0/xsim.log 
	@echo Done: unit__0__sim__test__0__xsim 

unit__0__sim__test__0__gen: unit__0__sim__mkdir 
	$(MKDIR) unit__0/sim/sim__x/test__0/
	$(CP) unit__0/sim/test_file.txt unit__0/sim/sim__x/test__0/
	@echo Done: unit__0__sim__test__0__gen 

unit__0__sim__mkdir: 
	$(MKDIR) unit__0/sim/sim__x/
	@echo Done: unit__0__sim__mkdir 

unit__0__sim__test__1: unit__0__sim__test__1__xsim 
	@echo Done: unit__0__sim__test__1 

unit__0__sim__test__1__xsim: unit__0__sim__test__1__gen 
	touch unit__0/sim/sim__x/test__1/xsim.log 
	@echo Done: unit__0__sim__test__1__xsim 

unit__0__sim__test__1__gen: unit__0__sim__mkdir 
	$(MKDIR) unit__0/sim/sim__x/test__1/
	$(CP) unit__0/sim/test_file.txt unit__0/sim/sim__x/test__1/
	@echo Done: unit__0__sim__test__1__gen 




unit__1__sim: unit__1__sim__test__0
	@echo Done: unit__1__sim 

unit__1__sim__test__0: unit__1__sim__test__0__xsim 
	@echo Done: unit__1__sim__test__0 

unit__1__sim__test__0__xsim: unit__1__sim__test__0__gen 
	touch unit__1/sim/sim__x/test__0/xsim.log 
	@echo Done: unit__1__sim__test__0__xsim 

unit__1__sim__test__0__gen: unit__1__sim__mkdir 
	$(MKDIR) unit__1/sim/sim__x/test__0/
	$(CP) unit__1/sim/test_file.txt unit__1/sim/sim__x/test__0/
	@echo Done: unit__1__sim__test__0__gen 

unit__1__sim__mkdir: 
	$(MKDIR) unit__1/sim/sim__x/
	@echo Done: unit__1__sim__mkdir 
