#include "../../defs/gen/defs.h"

#define DELAY__0 50000000
#define DELAY__1 25000000

.text
.globl _start
_start:
    jal init__port__0__0

    # setup machine trap vector
    la a0, mtvec
    # create a bit-mask with all bits set except bits 1:0
    li a1, 0xfffffffffffffffc  
    # clear bits 1:0 of a0
    and a0, a0, a1
    # write to the mtvec CSR
    csrrw zero, mtvec, a0

    jal clear__mtime

    li a0, DELAY__0
    jal set__mtimecmp

    # set mstatus.MEI == 1 (enable M mode interrupts)
    li a0, 0x8 
    csrrs zero, mstatus, a0

    # set mie.MTIE == 1 (enable M mode timer interrupt)
    li a0, 0x80 
    csrrs zero, mie, a0

    # set mie.MEIE == 1 (enable M mode external interrupt)
    li a0, 0x800 
    csrrs zero, mie, a0

    # enable interrupt source 1 for context 0
    li a0, PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_ENABLE_BITS__0_TO_31
    li a1, 0x2 
    sw a1, 0(a0)

loop:
    j loop


.align 2
mtvec:
    csrr a0, mcause
    blt a0, zero, interrupt
    mret

interrupt:
    # clear bit 63
    slli a0, a0, 1
    srli a0, a0, 1
    li a1, 0x7
    bne a0, a1, l0
    jal machine_timer_interrupt_isr
l0:
    li a1, 0xb
    bne a0, a1, l1
    jal machine_external_interrupt_isr
l1:
    mret


machine_timer_interrupt_isr:
    jal toggle__data__0__0
    jal clear__mtime
    mret

machine_external_interrupt_isr:
    # claim extern interrupt
    li a0, PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE
    lw t0, 0(a0)

    li a1, MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP
    ld a0, 0(a1)
    li a2, DELAY__0
    beq a0, a2, set__delay__1
set__delay__0:
    li a0, DELAY__0
    jal set__mtimecmp
    j exit 
set__delay__1:
    li a0, DELAY__1
    jal set__mtimecmp
exit:
    # complete extern interrupt
    li a0, PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE
    sw t0, 0(a0)
    mret
    

init__port__0__0:
    li a0, GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0
    li a1, 0x0 
    sb a1, 0(a0)
    li a0, GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__OE__0
    li a1, 0x1 
    sb a1, 0(a0)
    ret


toggle__data__0__0:
    li a0, GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0
    lb a1, 0(a0)
    xori a1, a1, 0x1
    sb a1, 0(a0)
    ret

set__mtimecmp:
    # write to mtimecmp
    li a1, MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP
    sd a0, 0(a1)
    ret

clear__mtime:
    li a0, MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME
    li a1, 0x0 
    sd a1, 0(a0)
    ret
