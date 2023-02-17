.text
.globl _start 

_start:
    li t0, 0xaa
    li t1, 0xab
    li t2, 0xeb3
    li t3, 0xeb3
    li a0, 0x0
    bne t0, t1, l0
    ori a0, zero, 0x1 
l0:
    bne t2, t3, l1
    ori a0, zero, 0x2
l1:
    ebreak
