//==============================================
// include 
//==============================================
#include "mstatus.hpp"

//==============================================
// mstatus::CSRRW
//==============================================
uint64_t mstatus::CSRRW(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrw %0, mstatus, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mstatus::CSRR
//==============================================
uint64_t mstatus::CSRR()
{
    uint64_t rd;
    asm volatile ("csrr %0, mstatus" : "=r" (rd) : : );
    return rd;
}

//==============================================
// mstatus::CSRW
//==============================================
void mstatus::CSRW(uint64_t rs1)
{
    asm volatile ("csrw mstatus, %0" : : "r" (rs1) : );
}

//==============================================
// mstatus::CSRRS
//==============================================
uint64_t mstatus::CSRRS(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrs %0, mstatus, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mstatus::CSRS
//==============================================
void mstatus::CSRS(uint64_t rs1)
{
    asm volatile ("csrs mstatus, %0" : : "r" (rs1) : );
}

//==============================================
// mstatus::CSRRC
//==============================================
uint64_t mstatus::CSRRC(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrc %0, mstatus, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mstatus::CSRC
//==============================================
void mstatus::CSRC(uint64_t rs1)
{
    asm volatile ("csrc mstatus, %0" : : "r" (rs1) : );
}
