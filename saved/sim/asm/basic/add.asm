.text
main:
    addi a0, x0, 0x2 # a0 = 0x2
    addi a1, x0, 0x2 # a1 = 0x2
    add a0, a0, a1 # a0 = a0 + a1 = 0x4
    ecall 
