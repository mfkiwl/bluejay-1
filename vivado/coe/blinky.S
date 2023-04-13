#include "../../defs/gen/defs.h"

#define DELAY 50000000

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


    # write 0x0 to mtime
    li a0, MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME
    li a1, 0x0 
    sd a1, 0(a0)

    # write to mtimecmp
    li a0, MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP
    li a1, DELAY 
    sd a1, 0(a0)

    # set mstatus.MEI == 1 (enable M mode interrupts)
    li a0, 0x8 
    csrrs zero, mstatus, a0

    # set mie.MTIE == 1 (enable M mode timer interrupt)
    li a0, 0x80 
    csrrs zero, mie, a0

loop:
    j loop


.align 2
mtvec:
    jal toggle__data__0__0
    # write 0x0 to mtime
    li a0, MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME
    li a1, 0x0 
    sd a1, 0(a0)
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
