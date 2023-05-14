//==============================================
// include 
//==============================================
#include "jay.hpp"

//==============================================
// Jay::Init
//==============================================
void Jay::Init()
{
    mtvec::CSRW((uint64_t)&Jay::TrapEntry);
}

//==============================================
// Jay::TrapEntry
//==============================================
void Jay::TrapEntry()
{
    // allocate space for 16 double words on the stack
    asm volatile ("addi sp, sp, -128");

    // push the non-saved registers onto the stack
    asm volatile ("sd ra, 0(sp)");
    asm volatile ("sd a0, 8(sp)");
    asm volatile ("sd a1, 16(sp)");
    asm volatile ("sd a2, 24(sp)");
    asm volatile ("sd a3, 32(sp)");
    asm volatile ("sd a4, 40(sp)");
    asm volatile ("sd a5, 48(sp)");
    asm volatile ("sd a6, 56(sp)");
    asm volatile ("sd a7, 64(sp)");
    asm volatile ("sd t0, 72(sp)");
    asm volatile ("sd t1, 80(sp)");
    asm volatile ("sd t2, 88(sp)");
    asm volatile ("sd t3, 96(sp)");
    asm volatile ("sd t4, 104(sp)");
    asm volatile ("sd t5, 112(sp)");
    asm volatile ("sd t6, 120(sp)");

    // read the value of mcause and call the appropriate ISR
    uint64_t exception_code = (mcause::CSRR() & CSR__MCAUSE__EXCEPTION_CODE__MASK) >> CSR__MCAUSE__EXCEPTION_CODE__LSB;
    uint64_t interrupt = (mcause::CSRR() & CSR__MCAUSE__INTERRUPT__MASK) >> CSR__MCAUSE__INTERRUPT__LSB;

    if (interrupt)
    {
        if (exception_code < 12)
        {
            Trap::interrupt_vector_table[exception_code]();
        }
        else
        {
            Jay::Halt();
        }
    }
    else
    {
        if (exception_code < 16)
        {
            Trap::exception_vector_table[exception_code]();
        }
        else
        {
            Jay::Halt();
        }
    }

    // pop the non-saved register off of the stack
    asm volatile ("ld ra, 0(sp)");
    asm volatile ("ld a0, 8(sp)");
    asm volatile ("ld a1, 16(sp)");
    asm volatile ("ld a2, 24(sp)");
    asm volatile ("ld a3, 32(sp)");
    asm volatile ("ld a4, 40(sp)");
    asm volatile ("ld a5, 48(sp)");
    asm volatile ("ld a6, 56(sp)");
    asm volatile ("ld a7, 64(sp)");
    asm volatile ("ld t0, 72(sp)");
    asm volatile ("ld t1, 80(sp)");
    asm volatile ("ld t2, 88(sp)");
    asm volatile ("ld t3, 96(sp)");
    asm volatile ("ld t4, 104(sp)");
    asm volatile ("ld t5, 112(sp)");
    asm volatile ("ld t6, 120(sp)");

    // restore the stack pointer to its original value
    asm volatile ("addi sp, sp, 128");

    // return from the trap
    asm volatile ("mret");
}

//==============================================
// Jay::Halt
//==============================================
void Jay::Halt()
{
   while (1) {}
}

//==============================================
// Jay::SetInterruptServiceRoutine
//==============================================
void Jay::SetInterruptServiceRoutine(void (* isr)(), uint64_t exception_code, uint64_t interrupt)
{
    if (interrupt)
    {
        if (exception_code < 12)
        {
            Jay::interrupt_vector_table[exception_code] = isr;
        }
    }
    else
    {
        if (exception_code < 16)
        {
            Jay::exception_vector_table[exception_code] = isr;
        }
    }
}

//==============================================
// Jay::LoadByte
//==============================================
uint8_t Jay::LoadByte(uint8_t * ptr)
{
    return *ptr; 
}

//==============================================
// Jay::LoadHalf
//==============================================
uint16_t Jay::LoadHalf(uint16_t * ptr)
{
    return *ptr; 
}

//==============================================
// Jay::LoadWord
//==============================================
uint32_t Jay::LoadWord(uint32_t * ptr)
{
    return *ptr; 
}

//==============================================
// Jay::LoadDouble
//==============================================
uint64_t Jay::LoadDouble(uint64_t * ptr)
{
    return *ptr; 
}

//==============================================
// Jay::StoreByte 
//==============================================
void Jay::StoreByte(uint8_t * ptr, uint8_t value)
{
    *ptr = value;
}

//==============================================
// Jay::StoreHalf
//==============================================
void Jay::StoreHalf(uint16_t * ptr, uint16_t value)
{
    *ptr = value;
}

//==============================================
// Jay::StoreWord
//==============================================
void StoreWord(uint32_t * ptr, uint32_t value)
{
    *ptr = value;
}

//==============================================
// Jay::StoreDouble
//==============================================
void StoreDouble(uint64_t * ptr, uint64_t value)
{
    *ptr = value;
}

