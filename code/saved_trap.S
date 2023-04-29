_init_mtvec:
    la t0, _trap_entry 
    csrw mtvec, t0
    ret

###############
# _trap_entry #
###############
.align 2
.global _trap_entry 
_trap_entry:

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

    # call the trap handler
    call _trap_handler

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

    # return from the tap
    mret

################
# trap_handler #
################
trap_handler:
    csrr t0, mcause
trap_handler__l0:
    blt t0, zero, _trap_handler__else__0
trap_handler__l1:
    la t1, _exception_handler_table
    j _trap_handler__end__0 
trap_handler__l2:
    la t1, _interrupt_handler_table
    j _trap_handler__end__0 
trap_handler__l3:
    ret

    # multiply the exception code by 8 to use as an index into the exception or interrupt handler table (note, this also removes the interrupt bit) 
    slli t0, t0, 0x3
    # add the offset to the base address
    add t1, t1, t0
    # load the address of the exception/interrupt handler from the table and call it
    ld t2, 0(t1)
    jalr t2

    ret



#################
# _trap_handler #
#################
_trap_handler:
    csrr t0, mcause
_trap_handler__if__0:
    blt t0, zero, _trap_handler__else__0
_trap_handler__then__0:
    la t1, _exception_handler_table
    j _trap_handler__end__0 
_trap_handler__else__0:
    la t1, _interrupt_handler_table
    j _trap_handler__end__0 
_trap_handler__end__0:
    ret

    # multiply the exception code by 8 to use as an index into the exception or interrupt handler table (note, this also removes the interrupt bit) 
    slli t0, t0, 0x3
    # add the offset to the base address
    add t1, t1, t0
    # load the address of the exception/interrupt handler from the table and call it
    ld t2, 0(t1)
    jalr t2

    ret


##########################
# _set_interrupt_handler #
##########################
# a0 = exception code
# a1 = function pointer
_set_interrupt_handler:
    # load the base address of the _interrupt_handler_table
    la t0, _interrupt_handler_table
    # multiply the exception code by 8 to index into the interrupt table
    slli a0, a0, 0x3
    # add the index to the base address
    add t0, t0, a0
    # store the function pointer
    sd a1, 0(t0)
    ret

    

################
# _default_isr #
################
_default_isr:
    ret

.data
############################
# _exception_handler_table #
############################
_exception_handler_table:

############################
# _interrupt_handler_table #
############################
_interrupt_handler_table:
# 0 reserved
.dword _default_irs
# 1 supervisor sofware interrupt
.dword _default_irs
# 2 reserved
.dword _default_irs
# 3 machine sofware interrupt
.dword _default_irs
# 4 reserved
.dword _default_irs
# 5 supervisor timer interrupt
.dword _default_irs
# 6 reserved
.dword _default_irs
# 7 machine timer interrupt
.dword _default_irs
# 8 reserved
.dword _default_irs
# 9 supervisor external interrupt
.dword _default_irs
# 10 reserved
.dword _default_irs
# 11 machine external interrupt
.dword _default_irs



//.option push
//.option norelax
//trap__l3:
//nop     # 0 reserved
//ret
//trap__l4:
//nop     # 1 supervisor sofware interrupt
//ret
//trap__l5:
//nop     # 2 reserved
//ret
//trap__l6:
//nop     # 3 machine sofware interrupt
//ret
//trap__l7:
//nop     # 4 reserved
//ret
//trap__l8:
//nop     # 5 supervisor timer interrupt
//ret
//trap__l9:
//nop     # 6 reserved
//ret
//trap__l10:
//nop     # 7 machine timer interrupt
//ret
//trap__l11:
//nop     # 8 reserved
//ret
//trap__l12:
//nop     # 9 supervisor external interrupt
//ret
//trap__l13:
//nop     # 10 reserved
//ret
//trap__l14:
//call machine_external_interrupt_isr     # 11 machine external interrupt
//ret
//.option pop

