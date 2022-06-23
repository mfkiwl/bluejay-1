.text
.global _start 

_start:
    li t0, 0xff00eba5
    srliw a0, t0, 0x6
    ebreak
