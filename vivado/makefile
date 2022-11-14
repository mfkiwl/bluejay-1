#===============================================
# Project Directories 
#===============================================
BLUEJAY := /home/seankent/bluejay
TOOLS := $(BLUEJAY)/tools
BUILD := $(BLUEJAY)/build
SRC := $(BLUEJAY)/src
TB := $(BLUEJAY)/tb
IP := $(BLUEJAY)/ip
VIVADO := $(BLUEJAY)/vivado
TOP__TB := $(IP)/top/tb/gen/top__tb.sv


#===============================================
# Files 
#===============================================
FILES := \
     $(IP)/top/src/gen/top.sv \
     $(IP)/jay/src/gen/jay.sv \
     $(IP)/central_processing_unit/src/gen/central_processing_unit.sv \
     $(IP)/central_processing_unit/src/gen/register_file.sv \
     $(IP)/central_processing_unit/src/gen/decoder.sv \
     $(IP)/central_processing_unit/src/gen/arithmetic_logic_unit.sv \
     $(IP)/central_processing_unit/src/gen/comparator.sv \
     $(IP)/central_processing_unit/src/gen/control_and_status_registers.sv \
     $(IP)/memory_management_unit/src/gen/memory_management_unit.sv \
     $(IP)/memory_management_unit/src/gen/read_dtype.sv \
     $(IP)/memory_management_unit/src/gen/store_dtype.sv \
     $(IP)/utils/src/gen/debouncer.sv


#===============================================
# Rules
#===============================================



#===============================
# all
#===============================
.PHONY: all 
all: top.sv top__tb.sv prog.coe

#===============================
# top 
#===============================
top.sv: $(FILES)
	rm -f top.sv
	touch top.sv
	cat $(FILES) >> top.sv
	cp top.sv $(VIVADO)/bluejay/bluejay.srcs/sources_1/new/top.sv

.PHONY: top__tb.sv
top__tb.sv:
	cp $(TOP__TB) $(VIVADO)/bluejay/bluejay.srcs/sim_1/new/top__tb.sv
    
prog.coe: $(BLUEJAY)/code/loop.mem 
	python3 $(TOOLS)/mem_to_coe.py $(BLUEJAY)/code/prog.mem > prog.coe 


#===============================
# clean 
#===============================
.PHONY: clean 
clean: 
	rm top.sv prog.coe

