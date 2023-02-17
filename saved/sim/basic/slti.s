.text
.globl _start 

_start:
    addi t0, zero, 0x3
    slti a0, t0, 0x4
    ebreak
