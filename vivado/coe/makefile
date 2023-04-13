TOP := /home/seankent/bluejay
FILES := $(wildcard *.S)
BIN := $(FILES:.S=.bin)
LST := $(FILES:.S=.lst)
MEM := $(FILES:.S=.mem)
COE := $(FILES:.S=.coe)

all: $(MEM) $(BIN) $(LST) $(COE)

$(FILES:.S=): %: %.S 
	riscv64-unknown-elf-gcc -march=rv64i -mabi=lp64 -ffreestanding -fno-pic -nostdlib -Ttext=0x80000000 -mno-relax $@.S -o $@ 

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
	rm -f $(FILES:.S=) $(BIN) $(LST) $(MEM) $(COE)

