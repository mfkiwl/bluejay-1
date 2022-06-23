.text
.global _start 

_start:
    li t0, 0xff00eba5
    addiw a0, t0, 0x7
    ebreak
