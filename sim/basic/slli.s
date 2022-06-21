.text
.global _start 

_start:
    addi t0, zero, 0x2e7
    slli a0, t0, 8 
    ebreak
