.global enable_timer_interrupt
enable_timer_interrupt:
    li t0, 0x80 
    csrs mie, t0
    ret

.global enable_external_interrupt
enable_external_interrupt:
    li t0, 0x800
    csrs mie, t0
    ret

.global enable_interrupts
enable_interrupts:
    li t0, 0x8 
    csrs mstatus, t0
    ret


.global set_mstatus_mie
set_mstatus_mie:
    # set mstatus.MIE = 1 (enable M-mode interrupts)
    li t0, 0x8 
    csrs mstatus, t0
    ret

.global set_mstatus_mie
clear_mstatus_mie:
    # clear mstatus.MIE = 1 (disable M-mode interrupts)
    li t0, 0x8 
    csrc mstatus, t0
    ret


.global set_mie_mtie
set_mie_mtie:
    # set mie.MTIE = 1 (enable M mode timer interrupt)
    li a0, 0x80 
    csrrs zero, mie, a0
    ret
