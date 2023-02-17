.text
.globl _start 

_start:
    li t0, 0xc400123400138892
    li t1, 34
    srl a0, t0, t1
    ebreak
