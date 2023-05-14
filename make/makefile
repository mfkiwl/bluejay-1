TOP := /Users/seankent/Documents/bluejay

# shell commands
MKDIR := mkdir -p
RM := rm -rf
TOUCH := touch
AWK := awk
CHMOD := chmod
CP := cp
CD := cd

# programs
PYTHON := python3

include templates.mk



#######
# lib #
#######
IP := lib

MODULES :=
MODULES += d_flip_flop
MODULES += sr_flip_flop

all: $(TOP)/ip/$(IP)/src/gen/d_flip_flop.sv $(TOP)/ip/$(IP)/src/gen/sr_flip_flop.sv

$(eval $(call dir_t,$(TOP)/ip/$(IP)/src/gen))
$(foreach MODULE,$(MODULES),$(eval $(call sv,$(TOP)/ip/$(IP)/src,$(MODULE))))


