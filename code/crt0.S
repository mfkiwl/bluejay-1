#include "../../defs/gen/defs.h"

.text
.global _start
.type   _start, @function

##########
# _start #
##########
_start:
.option push
    # turn off norelax so this code does not get optimized away
.option norelax
    # initialize the stack pointer
    la sp, 0x10000 
    # initialize the global pointer
    la gp, __global_pointer$
.option pop
    # clear the bss segment
	la a0, __bss_start
	la a1, __BSS_END__

clear_bss:
	bgeu a0, a1, finish_bss
	sb x0,0(a0)
	addi a0, a0, 1
	beq	x0,x0,clear_bss
finish_bss:
	call __libc_init_array       # Run global initialization functions
	call main

	# abort execution here
	ebreak			

.size  _start, .-_start
