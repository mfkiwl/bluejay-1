.text
.global _start 

_start:
    li t0, 0x7f00eba1
    slliw a0, t0, 0x1
    ebreak
