.text
.global _start 

_start:
    addi a0, zero, 0x2
    addi a1, zero, 0x3
    add a0, a0, a1 
    ecall
