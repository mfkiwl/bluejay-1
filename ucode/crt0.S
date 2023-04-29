.text

##########
# _start #
##########
.global _start
_start:

.option push
.option norelax
    # initialize the stack pointer
    la sp, 0x8000
    # initializae the global pointer
    la gp, __global_pointer$
.option pop

    # clear the bss segment (starting at __bss_start and ending at __BSS_END__ - 1)
	la t0, __bss_start
	la t1, __BSS_END__
WHILE__0:
	bgeu t0, t1, END__0 
	sb zero, 0(t0)
	addi t0, t0, 0x1
	j WHILE__0 
END__0:

    # call the main program 
	call main

    # spin indefinitely 
WHILE__1:
    j WHILE__1
END__1:
