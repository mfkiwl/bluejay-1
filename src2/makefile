BLUEJAY := /home/seankent/bluejay
TOOLS := $(BLUEJAY)/tools
BUILD := $(BLUEJAY)/build
SRC := $(BLUEJAY)/src
TB := $(BLUEJAY)/tb

DIRS := \
	$(SRC)/top \
	$(SRC)/top/jay \
	$(SRC)/top/jay/central_processing_unit \
	$(SRC)/top/jay/cache \
	$(SRC)/top/utility \
	$(SRC)/top/interface \
	$(SRC)/top/memory \
		

all: $(DIRS)

$(DIRS):
	$(MAKE) -C $@

.PHONY: $(DIRS)
