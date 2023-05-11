//==============================================
// include 
//==============================================
#include "mtvec.hpp"

//==============================================
// mtvec::CSRRW
//==============================================
uint64_t mtvec::CSRRW(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrw %0, mtvec, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mtvec::CSRR
//==============================================
uint64_t mtvec::CSRR()
{
    uint64_t rd;
    asm volatile ("csrr %0, mtvec" : "=r" (rd) : : );
    return rd;
}

//==============================================
// mtvec::CSRW
//==============================================
void mtvec::CSRW(uint64_t rs1)
{
    asm volatile ("csrw mtvec, %0" : : "r" (rs1) : );
}

//==============================================
// mtvec::CSRRS
//==============================================
uint64_t mtvec::CSRRS(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrs %0, mtvec, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mtvec::CSRS
//==============================================
void mtvec::CSRS(uint64_t rs1)
{
    asm volatile ("csrs mtvec, %0" : : "r" (rs1) : );
}

//==============================================
// mtvec::CSRRC
//==============================================
uint64_t mtvec::CSRRC(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrc %0, mtvec, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mtvec::CSRC
//==============================================
void mtvec::CSRC(uint64_t rs1)
{
    asm volatile ("csrc mtvec, %0" : : "r" (rs1) : );
}
