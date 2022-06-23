.text
.global _start 

_start:
    addi t0, zero, 0x1
    slli t0, t0, 63
    srai a0, t0, 4 
    ebreak
