.text
.globl _start 

_start:
    addi t0, zero, 0x1
    slli t0, t0, 63
    srli a0, t0, 1 
    ebreak
