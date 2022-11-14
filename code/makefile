FILES := $(wildcard *.s)
BIN := $(FILES:.s=.bin)
LST := $(FILES:.s=.lst)
MEM := $(FILES:.s=.mem)

all: $(MEM) $(BIN) $(LST) 

$(FILES:.s=): %: %.s 
	riscv64-unknown-elf-gcc -march=rv64i -mabi=lp64 -ffreestanding -fno-pic -nostdlib -Ttext=0x00000000 -mno-relax $@.s -o $@ 

$(BIN): %.bin: % 
	riscv64-unknown-elf-objcopy $< -O binary $@

$(LST): %.lst: % 
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $< > $@

$(MEM): %.mem: %.bin
	od -t x1 -An -w1 -v $< > $@


.PHONY: clean

clean:
	rm -f $(FILES:.s=) $(BIN) $(LST) $(MEM)

