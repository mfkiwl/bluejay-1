.text
.global _start 

_start:
    la a0, data
    mv a1, a0

    li t0, 0xffffffffffffffff # t0 = 0xffffffffffffffff 
    xori t1, t0, 0xfff # t1 = t0 ^ 0xfff
    sd t1, 0(a2) # M[a2] = t1
    addi a2, a2, 0x8 # a2 = a2 + 8 

    
    ecall


data:
