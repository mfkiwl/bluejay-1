.text
.globl _start 

_start:
    addi t0, zero, 0xab
    xori a0, t0, 0xba
    ebreak
