.text
.global _start 

_start:
    addi a0, zero, 0xfb
    slli a0, a0, 0x3
    ecall
