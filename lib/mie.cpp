//==============================================
// include 
//==============================================
#include "mie.hpp"

//==============================================
// MIE::csrrw
//==============================================
uint64_t MIE::csrrw(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrw %[rd], mie, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MIE::csrr
//==============================================
uint64_t MIE::csrr()
{
    uint64_t rd;
    asm volatile ("csrr %[rd], mie" : [rd] "=r" (rd) : : );
    return rd;
}

//==============================================
// MIE::csrw
//==============================================
void MIE::csrw(uint64_t rs1)
{
    asm volatile ("csrw mie, %[rs1]" : : [rs1] "r" (rs1) : );
}

//==============================================
// MIE::csrrs
//==============================================
uint64_t MIE::csrrs(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrs %[rd], mie, %1" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MIE::csrs
//==============================================
void MIE::csrs(uint64_t rs1)
{
    asm volatile ("csrs mie, %[rs1]" : : [rs1] "r" (rs1) : );
}

//==============================================
// MIE::csrrc
//==============================================
uint64_t MIE::csrrc(uint64_t rs1)
{
    uint64_t rd;
    asm volatile ("csrrc %[rd], mie, %[rs1]" : [rd] "=r" (rd) : [rs1] "r" (rs1) : );
    return rd;
}

//==============================================
// MIE::csrc
//==============================================
void MIE::csrc(uint64_t rs1)
{
    asm volatile ("csrc mie, %[rs1]" : : [rs1] "r" (rs1) : );
}
