#===============================================
# Project Directories 
#===============================================
BLUEJAY := /home/seankent/bluejay
TOOLS := $(BLUEJAY)/tools
BUILD := $(BLUEJAY)/build
SRC := $(BLUEJAY)/src
TB := $(BLUEJAY)/tb

#===============================================
# Sources/Targets 
#===============================================
SUBDIRS := $(wildcard */.) 
CLEAN_SUBDIRS := $(addprefix clean_, $(SUBDIRS))
		
#===============================================
# Rules
#===============================================
#===============================
# all
#===============================
.PHONY: all 
all: $(SUBDIRS)

#===============================
# $(SUBDIRS) 
#===============================
.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

#===============================
# clean 
#===============================
.PHONY: clean 
clean: $(CLEAN_SUBDIRS) 

#===============================
# $(CLEAN_SUBDIRS) 
#===============================
$(CLEAN_SUBDIRS): clean_% : %
	$(MAKE) -C $< clean

