.text
.global _start 

_start:
    addi t0, zero, 0x3
    andi a0, t0, 2 
    ebreak
