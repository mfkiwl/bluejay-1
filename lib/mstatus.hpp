#ifndef MSTATUS__HPP
#define MSTATUS__HPP

//==============================================
// include 
//==============================================
#include <stdint.h>

//==============================================
// MSTATUS 
//==============================================
struct MSTATUS
{
    static uint64_t csrrw(uint64_t rs1);
    static uint64_t csrr();
    static void csrw(uint64_t rs1);
    static uint64_t csrrs(uint64_t rs1);
    static void csrs(uint64_t rs1);
    static uint64_t csrrc(uint64_t rs1);
    static void csrc(uint64_t rs1);
};

#endif
