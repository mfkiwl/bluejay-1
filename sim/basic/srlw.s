.text
.globl _start 

_start:
    li t0, 0x80023544
    li t1, 1
    srlw a0, t0, t1
    ebreak
