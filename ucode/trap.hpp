#ifndef TRAP__HPP
#define TRAP__HPP

//==============================================
// include 
//==============================================
#include <stdint.h>

//==============================================
// Trap 
//==============================================
struct Trap
{
    static void Init();
    static void Entry();
    static void Set(void (* isr)(), uint64_t exception_code, uint64_t interrupt);
    static void Halt();

    static void (* interrupt_vector_table[12])();
    static void (* exception_vector_table[16])();
};

//==============================================
// Trap::interrupt_vector_table
//==============================================
void (* Trap::interrupt_vector_table[12])() = 
{
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
};

//==============================================
// Trap::exception_vector_table
//==============================================
void (* Trap::exception_vector_table[16])() = 
{
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
    &Trap::Halt,
};

#endif
