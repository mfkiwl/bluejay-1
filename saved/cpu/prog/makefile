ELF := $(wildcard *.elf)
BIN := $(ELF:.elf=.bin)
LST := $(ELF:.elf=.lst)
TXT := $(ELF:.elf=.txt)

all: $(TXT) $(BIN) $(LST) 

$(BIN): %.bin: %.elf 
	riscv64-unknown-elf-objcopy $< -O binary $@

$(LST): %.lst: %.elf 
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $< > $@

$(TXT): %.txt: %.bin
	od -t x1 -An -w1 -v $< > $@ 


.PHONY: clean
clean:
	rm -rf $(BIN) $(LST) $(TXT)

