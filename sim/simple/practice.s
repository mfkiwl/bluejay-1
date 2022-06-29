.text
.globl _start
_start:
    csrr a0, mstatus
    #addi a0, zero, 10
    ebreak

