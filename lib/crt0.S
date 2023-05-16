    .text
    .global _start

##########
# _start #
##########
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
while__0:
	bgeu t0, t1, end__0 
	sb zero, 0(t0)
	addi t0, t0, 0x1
	j while__0
end__0:

    # run global initialization functions
    call __libc_init_array

    # call the main program 
	call main

    # spin indefinitely 
while__1:
    j while__1
end__1:
