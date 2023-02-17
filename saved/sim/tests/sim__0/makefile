FILES := $(wildcard *.c)
ELF := $(FILES:.c=.elf)
BIN := $(FILES:.c=.bin)
TXT := $(FILES:.c=.txt)
LST := $(FILES:.c=.lst)

all: $(ELF) $(TXT) $(BIN) $(LST) 

$(ELF): %.elf : %.c
	riscv64-unknown-elf-gcc -march=rv64i -mabi=lp64 -ffreestanding -fno-pic -nostdlib -mno-relax -Ttext=0x10000 $< -o $@ 

#-Ttext=0x0

$(BIN): %.bin: %.elf
	riscv64-unknown-elf-objcopy $< -O binary $@

$(LST): %.lst: %.elf
	riscv64-unknown-elf-objdump -Mnumeric,no-aliases -dr $< > $@

$(TXT): %.txt: %.bin
	od -t x8 -An -w8 $< > $@ 

.PHONY: clean
clean:
	rm -f $(ELF) $(BIN) $(LST) $(TXT) *.sig.*

