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
    static void (* interrupt_vector_table[12])();
    static void (* exception_vector_table[16])();

    static void Init();
    static void TrapEntry();
    static void Halt();
    static void SetInterruptServiceRoutine(void (* isr)(), uint64_t exception_code, uint64_t interrupt);
    static uint8_t LoadByte(uint8_t * ptr);
    static uint16_t LoadHalf(uint16_t * ptr);
    static uint32_t LoadWord(uint32_t * ptr);
    static uint64_t LoadDouble(uint64_t * ptr);
    static void StoreByte(uint8_t * ptr, uint8_t value);
    static void StoreHalf(uint16_t * ptr, uint16_t value);
    static void StoreWord(uint32_t * ptr, uint32_t value);
    static void StoreDouble(uint64_t * ptr, uint64_t value);
};

//==============================================
// Jay::interrupt_vector_table
//==============================================
void (* Jay::interrupt_vector_table[12])() = 
{
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
};

//==============================================
// Jay::exception_vector_table
//==============================================
void (* Jay::exception_vector_table[16])() = 
{
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
    &Jay::Halt,
};

#endif
