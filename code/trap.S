.text

########
# trap #
########
.align 2
.global trap 
trap:
    # allocate space for 16 double words on the stack
    addi sp, sp, -16*8
    # push the non-saved registers onto the stack
    sd ra, 0*8(sp)
    sd a0, 1*8(sp)
    sd a1, 2*8(sp)
    sd a2, 3*8(sp)
    sd a3, 4*8(sp)
    sd a4, 5*8(sp)
    sd a5, 6*8(sp)
    sd a6, 7*8(sp)
    sd a7, 8*8(sp)
    sd t0, 9*8(sp)
    sd t1, 10*8(sp)
    sd t2, 11*8(sp)
    sd t3, 12*8(sp)
    sd t4, 13*8(sp)
    sd t5, 14*8(sp)
    sd t6, 15*8(sp)

    csrr t0, mcause
l0:
    blt t0, zero, l2 
l1:
    la t1, exception_vector_table
    j l3 
l2:
    la t1, interrupt_vector_table
    j l3 
l3:
    # multiply the exception code by 8 and add it to the base address 
    slli t0, t0, 0x3
    add t1, t1, t0
    # load the address of the isr 
    ld t2, 0(t1)
    # call the isr
    jalr t2

    # pop the non-saved register off of the stack
    ld ra, 0*8(sp)
    ld a0, 1*8(sp)
    ld a1, 2*8(sp)
    ld a2, 3*8(sp)
    ld a3, 4*8(sp)
    ld a4, 5*8(sp)
    ld a5, 6*8(sp)
    ld a6, 7*8(sp)
    ld a7, 8*8(sp)
    ld t0, 9*8(sp)
    ld t1, 10*8(sp)
    ld t2, 11*8(sp)
    ld t3, 12*8(sp)
    ld t4, 13*8(sp)
    ld t5, 14*8(sp)
    ld t6, 15*8(sp)
    # restore the stack pointer to its original value
    addi sp, sp, -16*8

    # return from the trap
    mret



.data
##########################
# exception_vector_table #
##########################
exception_vector_table:
# 0: instruction adress misaligned 
.dword stub 
# 1: instruction access fault 
.dword stub 
# 2: illegal instruction 
.dword stub 
# 3: breakpoint 
.dword stub 
# 4: load address misaligned 
.dword stub 
# 5: load access fault 
.dword stub 
# 6: store/amo address misaligned 
.dword stub 
# 7: store/amo access fault 
.dword stub 
# 8: environment call from U-mode 
.dword stub 
# 9: environment call from S-mode 
.dword stub 
# 10: reserved 
.dword stub 
# 11: environment call from M-mode 
.dword stub 
# 12: instruction page fault 
.dword stub 
# 13: load page fault 
.dword stub 
# 14: reserved
.dword stub 
# 15: store/amo page fault 
.dword stub 

##########################
# interrupt_vector_table #
##########################
interrupt_vector_table:
# 0: reserved
.dword stub 
# 1: supervisor sofware interrupt
.dword stub 
# 2: reserved
.dword stub 
# 3: machine sofware interrupt
.dword stub 
# 4: reserved
.dword stub 
# 5: supervisor timer interrupt
.dword stub 
# 6: reserved
.dword stub 
# 7: machine timer interrupt
.dword stub 
# 8: reserved
.dword stub 
# 9: supervisor external interrupt
.dword stub 
# 10: reserved
.dword stub 
# 11: machine external interrupt
.dword stub 
