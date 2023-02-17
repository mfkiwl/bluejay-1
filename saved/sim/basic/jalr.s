.text
.globl _start 

_start:
    la t0, foo 
    jalr ra, t0, 0 
    addi a0, zero, 0x0
    ebreak

foo:
    addi a0, zero, 0xa
    jalr a0, ra, 4
