.globl _start 
.text
.align
_start:
    la t0, x 
    li t1, 0x1f1
    sd t1, 0(t0)
    ld a0, 0(t0)
    ebreak

.data
x:
.dword 0xfedcba9876543210

