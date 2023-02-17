.text
.globl _start 

_start:
    li a0, 0x0
    jal ra, foo
    ebreak

foo:
    li a0, 0xa
    jalr zero, ra, 0
