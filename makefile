BLUEJAY := /home/seankent/bluejay
TOOLS := $(BLUEJAY)/tools
BUILD := $(BLUEJAY)/build
SRC := $(BLUEJAY)/src
TB := $(BLUEJAY)/tb

all: rtl 

rtl: 
	cd $(SRC) && $(MAKE)
	cd $(TB) && $(MAKE)

.PHONY: rtl
