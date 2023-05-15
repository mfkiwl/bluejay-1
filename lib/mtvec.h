#ifndef MTVEC__H
#define MTVEC__H

//==============================================
// include 
//==============================================
#include <stdint.h>

//==============================================
// MTVEC 
//==============================================
struct MTVEC
{
    uint64_t csrrw(uint64_t rs1);
    uint64_t csrr();
    void csrw(uint64_t rs1);
    uint64_t csrrs(uint64_t rs1);
    void csrs(uint64_t rs1);
    uint64_t csrrc(uint64_t rs1);
    void csrc(uint64_t rs1);
};

#endif
