############
# bind_isr #
############
# a0 = execption code
# a1 = interrupt (bool)
# a2 = function pointer
bind_isr:

IF__0:
    bne a1, zero, ELSE__0 
THEN__0:
    la t0, exception_vector_table
    j END__0 
ELSE__0:
    la t0, interrupt_vector_table
    j END__0 
END__0:
    # multiply the exception code by 8 and add it to the base address 
    slli a0, a0, 0x3
    add t0, t0, a0 

    sd a2, 0(t0)
    
    
