.text   # emit .text section and make current

##########
# _start #
##########
.global _start
_start:
.option push                    # push the current options to the options stack
.option norelax                 # disable linker relaxation so the following code region does not get optimized away
    la sp, 0x8000               # sp = 0x8000
    la gp, __global_pointer$    # gp = __global_pointer$
.option pop                     # pop the previous options from the options stack

    # clear the bss segment (starting at __bss_start and ending at __BSS_END__ - 1 
	la a0, __bss_start      # a0 = __bss_start 
	la a1, __BSS_END__      # a1 = __BSS_END__
label__0:
	bgeu a0, a1, label__1   # while (a0 < a1) {
	sb zero, 0(a0)          #     *a0 = 0x0;
	addi a0, a0, 0x1        #     a0++;
	j label__0              # }
label__1:

	#call __libc_init_array  # Run global initialization functions
	call main

    # spin
label__2:
    j label__2  # while (1) {}

