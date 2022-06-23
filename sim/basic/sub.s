.text
.global _start 

_start:
    li t0, 0x8
    li t1, 0x3
    sub a0, t0, t1
    ebreak
