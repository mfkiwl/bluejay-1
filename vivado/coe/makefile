TOP := /home/seankent/bluejay
FILES := $(wildcard *.s)
BIN := $(FILES:.s=.bin)
LST := $(FILES:.s=.lst)
MEM := $(FILES:.s=.mem)
COE := $(FILES:.s=.coe)

all: $(MEM) $(BIN) $(LST) $(COE)

$(FILES:.s=): %: %.s 
	riscv64-unknown-elf-gcc -march=rv64i -mabi=lp64 -ffreestanding -fno-pic -nostdlib -Ttext=0x80000000 -mno-relax $@.s -o $@ 

$(BIN): %.bin: % 
	riscv64-unknown-elf-objcopy $< -O binary $@

$(LST): %.lst: % 
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $< > $@

$(MEM): %.mem: %.bin
	od -t x1 -An -w1 -v $< > $@

$(COE): %.coe: %.mem
	python3 $(TOP)/tools/mem_to_coe.py $(<) > $(@)


.PHONY: clean

clean:
	rm -f $(FILES:.s=) $(BIN) $(LST) $(MEM) $(COE)

