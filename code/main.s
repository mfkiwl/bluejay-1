.text
.globl _start
_start:
    li a0, 0b11000000000000000000000000000000
    li a1, 1 
    add a2, a0, a1 
    li a3, 1 
    sb a3, 0(a2)
loop:
    j loop

