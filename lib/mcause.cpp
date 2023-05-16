//==============================================
// include 
//==============================================
#include "mcause.hpp"

//==============================================
// MCAUSE::csrrw
//==============================================
uint64_t MCAUSE::csrrw(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrw %[rd], mcause, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MCAUSE::csrr
//==============================================
uint64_t MCAUSE::csrr()
{
    uint64_t rd;
    asm volatile ("csrr %[rd], mcause" : [rd] "=r" (rd) : : );
    return rd;
}

//==============================================
// MCAUSE::csrw
//==============================================
void MCAUSE::csrw(uint64_t rs1)
{
    asm volatile ("csrw mcause, %[rs1]" : : [rs1] "r" (rs1) : );
}

//==============================================
// MCAUSE::csrrs
//==============================================
uint64_t MCAUSE::csrrs(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrs %[rd], mcause, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MCAUSE::csrs
//==============================================
void MCAUSE::csrs(uint64_t rs1)
{
    asm volatile ("csrs mcause, %[rs1]" : : [rs1] "r" (rs1) : );
}

//==============================================
// MCAUSE::csrrc
//==============================================
uint64_t MCAUSE::csrrc(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrc %[rd], mcause, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MCAUSE::csrc
//==============================================
void MCAUSE::csrc(uint64_t rs1)
{
    asm volatile ("csrc mcause, %[rs1]" : : [rs1] "r" (rs1) : );
}

