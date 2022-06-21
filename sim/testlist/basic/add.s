.text
.global _start 

_start:
    addi t0, zero, 0x2
    addi t1, zero, 0x5
    add a0, t0, t1
    ebreak
