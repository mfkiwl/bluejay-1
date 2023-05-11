#ifndef MCAUSE__HPP
#define MCAUSE__HPP

//==============================================
// include 
//==============================================
#include <stdint.h>

//==============================================
// mcause 
//==============================================
struct mcause
{
    static uint64_t CSRRW(uint64_t rs1);
    static uint64_t CSRR();
    static void CSRW(uint64_t rs1);
    static uint64_t CSRRS(uint64_t rs1);
    static void CSRS(uint64_t rs1);
    static uint64_t CSRRC(uint64_t rs1);
    static void CSRC(uint64_t rs1);
};

#endif
