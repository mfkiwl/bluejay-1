.globl _start 
.text
.align
_start:
    la t0, x 
    lw a0, 4(t0)
    ebreak

#.data
x:
.dword 0xfedcba9876543210

