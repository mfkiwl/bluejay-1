.text
.global _start 

_start:
    add a0, zero, zero 
    addi a1, zero, 0xa 
l0:
    bge a0, a1, l1 
    addi a0, a0, 0x1 # a0 = a0 + 1
    jal zero, l0  
l1:
    ecall
    
