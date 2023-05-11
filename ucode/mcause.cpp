//==============================================
// include 
//==============================================
#include "mcause.hpp"

//==============================================
// mcause::CSRRW
//==============================================
uint64_t mcause::CSRRW(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrw %0, mcause, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mcause::CSRR
//==============================================
uint64_t mcause::CSRR()
{
    uint64_t rd;
    asm volatile ("csrr %0, mcause" : "=r" (rd) : : );
    return rd;
}

//==============================================
// mcause::CSRW
//==============================================
void mcause::CSRW(uint64_t rs1)
{
    asm volatile ("csrw mcause, %0" : : "r" (rs1) : );
}

//==============================================
// mcause::CSRRS
//==============================================
uint64_t mcause::CSRRS(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrs %0, mcause, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mcause::CSRS
//==============================================
void mcause::CSRS(uint64_t rs1)
{
    asm volatile ("csrs mcause, %0" : : "r" (rs1) : );
}

//==============================================
// mcause::CSRRC
//==============================================
uint64_t mcause::CSRRC(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrc %0, mcause, %1" : "=r" (rd) : "r" (rs1) : );
    return rd;
}

//==============================================
// mcause::CSRC
//==============================================
void mcause::CSRC(uint64_t rs1)
{
    asm volatile ("csrc mcause, %0" : : "r" (rs1) : );
}
