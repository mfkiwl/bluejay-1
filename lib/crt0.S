    .text
    .global _start

################################################
# _start
################################################
_start:
    .option push
    .option norelax
    # initialize the stack pointer
    la sp, 0x8000
    # initializae the global pointer
    la gp, __global_pointer$
    .option pop

    # initialize mtvec
    la t0, trap_entry
    csrw mtvec, t0

    # clear the bss segment (starting at __bss_start and ending at __BSS_END__ - 1)
	la t0, __bss_start
	la t1, __BSS_END__
_start__while__0:
	bgeu t0, t1, _start__endwhile__0 
	sb zero, 0(t0)
	addi t0, t0, 0x1
	j _start__while__0
_start__endwhile__0:

    # run global initialization functions
    call __libc_init_array

    # call the main program 
	call main

    # spin indefinitely 
_start__while__1:
    j _start__while__1
_start__endwhile__1:


################################################
# trap_entry
################################################
.align 2
.global trap_entry
trap_entry:
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

    # read the value of mcause and call the appropriate ISR
    csrr t0, mcause
    # load the base address of the trap vector table (interrupts can be separated from other traps with a single branch on the sign of mcause)
trap_entry__if__0:
    blt t0, zero, trap_entry__else__0 
trap_entry__then__0:
    la t1, exception_vector_table
    j trap_entry__endif__0 
trap_entry__else__0:
    la t1, interrupt_vector_table
    j trap_entry__endif__0 
trap_entry__endif__0:
    # shift left by 3 to remove the interrupt bit and scale the exception code to index into the trap vector table (either the interrupt_vector_table or the exception_vector_table)
    slli t2, t0, 0x3
    # add the index to the base of the trap vector table
    add t3, t1, t2
    # load the address of the ISR 
    ld t4, 0(t3)
    # call the ISR 
    jalr t4

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
    addi sp, sp, 16*8

    # return from the trap
    mret

################################################
# default_handler
################################################
.global default_handler
default_handler:
default_handler__while__0:
    j default_handler__while__0
default_handler__endwhile__0:


################################################
# exception_vector_table
################################################
    .data
    .global exception_vector_table
    .align 3
exception_vector_table:
    # 0: instruction adress misaligned 
    .dword default_handler 
    # 1: instruction access fault 
    .dword default_handler 
    # 2: illegal instruction 
    .dword default_handler 
    # 3: breakpoint 
    .dword default_handler 
    # 4: load address misaligned 
    .dword default_handler 
    # 5: load access fault 
    .dword default_handler 
    # 6: store/amo address misaligned 
    .dword default_handler 
    # 7: store/amo access fault 
    .dword default_handler 
    # 8: environment call from U-mode 
    .dword default_handler 
    # 9: environment call from S-mode 
    .dword default_handler 
    # 10: reserved 
    .dword default_handler 
    # 11: environment call from M-mode 
    .dword default_handler 
    # 12: instruction page fault 
    .dword default_handler 
    # 13: load page fault 
    .dword default_handler 
    # 14: reserved
    .dword default_handler 
    # 15: store/amo page fault 
    .dword default_handler 

################################################
# interrupt_vector_table
################################################
    .data
    .global interrupt_vector_table
    .align 3
interrupt_vector_table:
    # 0: reserved
    .dword default_handler 
    # 1: supervisor sofware interrupt
    .dword default_handler 
    # 2: reserved
    .dword default_handler 
    # 3: machine sofware interrupt
    .dword default_handler 
    # 4: reserved
    .dword default_handler 
    # 5: supervisor timer interrupt
    .dword default_handler 
    # 6: reserved
    .dword default_handler 
    # 7: machine timer interrupt
    .dword default_handler 
    # 8: reserved
    .dword default_handler 
    # 9: supervisor external interrupt
    .dword default_handler 
    # 10: reserved
    .dword default_handler 
    # 11: machine external interrupt
    .dword default_handler 
