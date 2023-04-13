#include "../../defs/gen/defs.h"

.text
.globl _start
_start:
    li a0, GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR
    li a1, GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0
    add a2, a0, a1 
    li a3, 1 
    sb a3, 0(a2)
    li a1, GENERAL_PURPOSE_INPUT_OUTPUT__OE__0 
    add a2, a0, a1 
    li a3, 1 
    sb a3, 0(a2)
loop:
    j loop

