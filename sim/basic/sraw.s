.text
.global _start 

_start:
    li t0, 0x80023544
    li t1, 4
    sraw a0, t0, t1
    ebreak
