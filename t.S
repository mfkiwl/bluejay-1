.text
.globl rvtest_entry_point
rvtest_entry_point:
    csrr a0, mstatus
    #addi a0, zero, 10
    ebreak

