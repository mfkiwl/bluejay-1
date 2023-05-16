//==============================================
// include 
//==============================================
#include "mstatus.hpp"

//==============================================
// MSTATUS::csrrw
//==============================================
uint64_t MSTATUS::csrrw(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrw %[rd], mstatus, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MSTATUS::csrr
//==============================================
uint64_t MSTATUS::csrr()
{
    uint64_t rd;
    asm volatile ("csrr %[rd], mstatus" : [rd] "=r" (rd) : : );
    return rd;
}

//==============================================
// MSTATUS::csrw
//==============================================
void MSTATUS::csrw(uint64_t rs1)
{
    asm volatile ("csrw mstatus, %[rs1]" : : [rs1] "r" (rs1) : );
}

//==============================================
// MSTATUS::csrrs
//==============================================
uint64_t MSTATUS::csrrs(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrs %[rd], mstatus, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MSTATUS::csrs
//==============================================
void MSTATUS::csrs(uint64_t rs1)
{
    asm volatile ("csrs mstatus, %[rs1]" : : [rs1] "r" (rs1) : );
}

//==============================================
// MSTATUS::csrrc
//==============================================
uint64_t MSTATUS::csrrc(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrc %[rd], mstatus, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MSTATUS::csrc
//==============================================
void MSTATUS::csrc(uint64_t rs1)
{
    asm volatile ("csrc mstatus, %[rs1]" : : [rs1] "r" (rs1) : );
}
