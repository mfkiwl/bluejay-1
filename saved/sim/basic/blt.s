.text
.globl _start 

_start:
    li t0, 0x8000ffe6aa000000
    li t1, 0x0
    li t2, 0x4
    li t3, 0x3
    li a0, 0x0
    blt t0, t1, l0
    ori a0, zero, 0x1 
l0:
    blt t2, t3, l1
    ori a0, zero, 0x2
l1:
    ebreak
