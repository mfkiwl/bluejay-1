.globl _start 
.text
.align
_start:
    la t0, x 
    lh a0, 2(t0)
    ebreak

#.data
x:
.dword 0xfedcba9876543210

