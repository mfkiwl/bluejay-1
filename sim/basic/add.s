.text
.global _start 

_start:
    addi a0, x0, 0x2
    addi a1, x0, 0x3
    add a0, a0, a1 
    ecall
