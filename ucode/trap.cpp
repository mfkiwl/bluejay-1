//==============================================
// include 
//==============================================
#include "trap.hpp"
#include "mtvec.hpp"
#include "mcause.hpp"

//==============================================
// Trap::Init 
//==============================================
void Trap::Init()
{
    mtvec::CSRW((uint64_t)&Trap::Entry);
}

//==============================================
// Trap::Entry
//==============================================
void Trap::Entry()
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
            Trap::Halt();
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
            Trap::Halt();
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
// Trap::Set
//==============================================
void Trap::Set(void (* isr)(), uint64_t exception_code, uint64_t interrupt)
{
    if (interrupt)
    {
        if (exception_code < 12)
        {
            Trap::interrupt_vector_table[exception_code] = isr;
        }
    }
    else
    {
        if (exception_code < 16)
        {
            Trap::exception_vector_table[exception_code] = isr;
        }
    }
}

//==============================================
// Trap::Halt
//==============================================
void Trap::Halt()
{
   while (1) {}
}
