BLUEJAY = /mnt/c/Users/seanj/Documents/bluejay/
SRC = src/
TB = tb/
VIVADO_SRC = vivado/bluejay/bluejay.srcs/sources_1/new/
VIVADO_TB = vivado/bluejay/bluejay.srcs/sim_1/new/

all:
	cp $(BLUEJAY)$(SRC)*.sv $(BLUEJAY)$(VIVADO_SRC)
	cp $(BLUEJAY)$(TB)*.sv $(BLUEJAY)$(VIVADO_TB)
