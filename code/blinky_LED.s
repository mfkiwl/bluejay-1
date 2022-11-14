.text
.globl _start
_start:
    li a0, 0x8000 
    addi a1, zero, 0 
    li a2, 4000000
loop:
    addi a2, a2, -1
    bne x0, a2, loop   
    xori a1, a1, 0xff 
    andi a1, a1, 0x01
    sb a1, 0(a0)
    li a2, 4000000 
    j loop

