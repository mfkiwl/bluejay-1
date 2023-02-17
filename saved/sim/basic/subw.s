.text
.globl _start 

_start:
    li t0, 0xfffe4b01
    li t1, 0x12ff102200
    addw a0, t0, t1
    ebreak
