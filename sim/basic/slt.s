.text
.global _start 

_start:
    li t0, 0x8000000000000000 
    li t1, 0x3
    slt a0, t0, t1
    ebreak
