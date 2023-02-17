.text
.global _start 

_start:
    addi t0, zero, 0x1
    slli t0, t0, 63
    sltiu a0, t0, 0x0
    ebreak
