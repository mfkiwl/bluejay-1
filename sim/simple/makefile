FILES := $(wildcard *.s)
BIN := $(FILES:.s=.bin)
LST := $(FILES:.s=.lst)
TXT := $(FILES:.s=.txt)

all: $(TXT) $(BIN) $(LST) 

$(FILES:.s=): %: %.s 
	riscv64-unknown-elf-gcc -march=rv64i -mabi=lp64 -ffreestanding -fno-pic -nostdlib -Ttext=0x80000000 -mno-relax $@.s -o $@ 

$(BIN): %.bin: % 
	riscv64-unknown-elf-objcopy $< -O binary $@

$(LST): %.lst: % 
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $< > $@

$(TXT): %.txt: %.bin
	od -t x8 -An -w8 $< > $@ 


.PHONY: clean

clean:
	rm -f $(FILES:.s=) $(BIN) $(LST) $(TXT)

