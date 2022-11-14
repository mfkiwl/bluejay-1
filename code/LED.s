.text
.globl _start
_start:
   li a0, 0x8000 
   addi a1, zero, 1
   sb a1, 0(a0)
loop:
    j loop

