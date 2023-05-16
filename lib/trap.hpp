#ifndef TRAP__HPP
#define TRAP__HPP

//==============================================
// include 
//==============================================
#include <stdint.h>
#include "jay.hpp"

//==============================================
// Trap 
//==============================================
struct Trap
{
    void (* interrupt_vector_table[12])();
    void (* exception_vector_table[16])();

    Trap();
    void Init();
    void Entry();
    void Set(uint64_t exception_code, uint64_t interrupt, void (* isr)());
    void Spin();
};

extern Trap trap;

#endif
