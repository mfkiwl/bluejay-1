BLUEJAY := /home/seankent/bluejay
TOOLS := $(BLUEJAY)/tools
BUILD := $(BLUEJAY)/build

FILES := $(wildcard *.b)
TARGETS := $(foreach i, $(FILES), $(addprefix $(BUILD)/, $(i:.b=.sv)))

all: $(TARGETS)

$(BUILD)/%.sv: %.b
	python3 $(TOOLS)/bluejay.py $< $@

