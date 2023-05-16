#ifndef JAY__HPP
#define JAY__HPP

//==============================================
// include 
//==============================================
#include <stdint.h>
#include "defs.h"
#include "mie.hpp"
#include "mstatus.hpp"
#include "mtvec.hpp"
#include "mcause.hpp"

//==============================================
// Jay 
//==============================================
struct Jay
{
    MIE mie;
    MSTATUS mstatus;
    MTVEC mtvec;
    MCAUSE mcause;
    
    uint64_t lb(uint64_t rs1);
    uint64_t lh(uint64_t rs1);
    uint64_t lw(uint64_t rs1);
    uint64_t ld(uint64_t rs1);
    void sb(uint64_t rs1, uint64_t rs2);
    void sh(uint64_t rs1, uint64_t rs2);
    void sw(uint64_t rs1, uint64_t rs2);
    void sd(uint64_t rs1, uint64_t rs2);
};

extern Jay jay;

#endif
