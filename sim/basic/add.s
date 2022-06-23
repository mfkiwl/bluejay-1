.text
.global _start 

_start:
    li t0, 0x5
    li t1, 0x3
    add a0, t0, t1
    ebreak
