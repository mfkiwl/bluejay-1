#include "stdint.h"
#include "defs.h"

void set__mie(uint64_t mask)
{
    asm ("csrs mie, %0" :: "r"(mask));
}

void write__mtvec(uint64_t value)
{
    asm ("csrs mie, %0" :: "r"(mask));
}




    
