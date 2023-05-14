

################################
# dir 
#     $(1): directory 
################################
define dir_t
$(1):
	$(MKDIR) $(1)
endef

################################
# sv
#     $(1): directory 
#     $(2): name 
################################
define sv
$(1)/gen/$(2).sv: $(1)/$(2).b $(TOP)/defs/gen/defs.py | $(1)
	$(PYTHON) $(TOP)/tools/bluejay.py $(1)/$(2).b $(1)/gen/$(2).sv $(TOP)/defs/gen/defs.py
endef

################################
# make_ip  
#     $(1): ip  
#     $(2): modules 
################################
define make_ip 
$(eval $(call dir_t,$(TOP)/ip/$(IP)))
$(foreach MODULE,$(MODULES),$(eval $(call sv,$(TOP)/ip/$(IP)/src,$(MODULE))))
endef

