#include "defs.h"



set_mie:
    csrs mie, a0

.global init_mtvec
init_mtvec:
    la a0, trap_vector      # a0 = trap_vector
    csrw mtvec, a0          # mtvec = a0
    csrc mtvec, 0x3         # mtvec[1:0] = 0


.align 2
trap_vector:
    csrr a0, mcause         # a0 = mcause

    blt a0, zero, interrupt                 # if (a0 >= 0) 
exception:                                  # 
    la a1, trap_vecotr_table__exception     #     a1 = trap_vecotr_table__exception;
    j call_isr                              # 
interrupt:                                  # else 
    la a1, trap_vecotr_table__interrupt     #     a1 = trap_vecotr_table__interrupt;
call_isr:
    slli a0, a0, 3          # a2 = a0 * 8 (with the interrupt bit ignored)
    add a1, a1, a0          # add the offset to the base address
    ld a2, 0(a1) 
    jalr a2


.data
trap_vector_table__interrupt:
.dword isr__default     # 0 reserved
.dword isr__default     # 1 supervisor sofware interrupt
.dword isr__default     # 2 reserved
.dword isr__default     # 3 machine sofware interrupt
.dword isr__default     # 4 reserved
.dword isr__default     # 5 supervisor timer interrupt
.dword isr__default     # 6 reserved
.dword isr__default     # 7 machine timer interrupt
.dword isr__default     # 8 reserved
.dword isr__default     # 9 supervisor external interrupt
.dword isr__default     # 10 reserved
.dword isr__default     # 11 machine external interrupt

trap_vector_table__exception:


isr__default:
    mret
