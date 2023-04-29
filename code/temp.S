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
l0:
	bgeu t0, t1, l1 
	sb zero, 0(t0)
	addi t0, t0, 0x1
	j l0 
l1:

    # call the main program 
	call main

    # spin indefinitely 
l2:
    j l2 

