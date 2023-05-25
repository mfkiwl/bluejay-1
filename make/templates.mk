################################################
# MAKE__DIR 
#
# Arguments:
#     $(1):
################################################
define MAKE__DIR

$(1):
	$(MKDIR) $(1)

endef

################################
# MAKE__RTL
#
# Arguments:
#     $(1):
#     $(2):
#     $(3):
#     $(4):
################################
define MAKE__RTL

$(2)/$(1): $(4)/$(3) $(TOP)/defs/gen/defs.py | $(2)
	$(PYTHON) $(TOP)/tools/bluejay.py $(4)/$(3) $(2)/$(1) $(TOP)/defs/gen/defs.py

endef

################################
# MAKE__IP__SRC
#     $(1):
#     $(2):
################################
define MAKE__IP__SRC

$(eval $(call MAKE__DIR,$(1)/gen))
$(foreach i,$(2),$(eval $(call MAKE__RTL,$(i).sv,$(1)/gen,$(i).b,$(1))))

endef

