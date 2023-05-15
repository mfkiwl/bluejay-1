//==============================================
// include 
//==============================================
#include "mtvec.h"

//==============================================
// MTVEC::csrrw
//==============================================
uint64_t MTVEC::csrrw(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrw %[rd], mtvec, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MTVEC::csrr
//==============================================
uint64_t MTVEC::csrr()
{
    uint64_t rd;
    asm volatile ("csrr %[rd], mtvec" : [rd] "=r" (rd) : : );
    return rd;
}

//==============================================
// MTVEC::csrw
//==============================================
void MTVEC::csrw(uint64_t rs1)
{
    asm volatile ("csrw mtvec, %[rs1]" : : [rs1] "r" (rs1) : );
}

//==============================================
// MTVEC::csrrs
//==============================================
uint64_t MTVEC::csrrs(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrs %[rd], mtvec, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MTVEC::csrs
//==============================================
void MTVEC::csrs(uint64_t rs1)
{
    asm volatile ("csrs mtvec, %[rs1]" : : [rs1] "r" (rs1) : );
}

//==============================================
// MTVEC::csrrc
//==============================================
uint64_t MTVEC::csrrc(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrc %[rd], mtvec, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MTVEC::csrc
//==============================================
void MTVEC::csrc(uint64_t rs1)
{
    asm volatile ("csrc mtvec, %[rs1]" : : [rs1] "r" (rs1) : );
}

