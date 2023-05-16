//==============================================
// include 
//==============================================
#include "trap.hpp"

//==============================================
// Trap::Trap
//==============================================
Trap::Trap()
{
    // initialize the interrupt_vector_table 
    this->interrupt_vector_table[0] = &this->Spin;
    this->interrupt_vector_table[1] = &this->Spin;
    //this->interrupt_vector_table[2] = &this->Spin;
    //this->interrupt_vector_table[3] = &this->Spin;
    //this->interrupt_vector_table[4] = &this->Spin;
    //this->interrupt_vector_table[5] = &this->Spin;
    //this->interrupt_vector_table[6] = &this->Spin;
    //this->interrupt_vector_table[7] = &this->Spin;
    //this->interrupt_vector_table[8] = &this->Spin;
    //this->interrupt_vector_table[9] = &this->Spin;
    //this->interrupt_vector_table[10] = &this->Spin;
    //this->interrupt_vector_table[11] = &this->Spin;

    //// initialize the exception_vector_table
    //this->exception_vector_table[0] = &this->Spin;
    //this->exception_vector_table[1] = &this->Spin;
    //this->exception_vector_table[2] = &this->Spin;
    //this->exception_vector_table[3] = &this->Spin;
    //this->exception_vector_table[4] = &this->Spin;
    //this->exception_vector_table[5] = &this->Spin;
    //this->exception_vector_table[6] = &this->Spin;
    //this->exception_vector_table[7] = &this->Spin;
    //this->exception_vector_table[8] = &this->Spin;
    //this->exception_vector_table[9] = &this->Spin;
    //this->exception_vector_table[10] = &this->Spin;
    //this->exception_vector_table[11] = &this->Spin;
    //this->exception_vector_table[12] = &this->Spin;
    //this->exception_vector_table[13] = &this->Spin;
    //this->exception_vector_table[14] = &this->Spin;
    //this->exception_vector_table[15] = &this->Spin;
}

//==============================================
// Trap::Init 
//==============================================
void Trap::Init()
{
    //jay.mtvec.csrw((uint64_t)&this->Entry);
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
    uint64_t exception_code = (jay.mcause.csrr() & CSR__MCAUSE__EXCEPTION_CODE__MASK) >> CSR__MCAUSE__EXCEPTION_CODE__LSB;
    uint64_t interrupt = (jay.mcause.csrr() & CSR__MCAUSE__INTERRUPT__MASK) >> CSR__MCAUSE__INTERRUPT__LSB;

    if (interrupt)
    {
        if (exception_code < 12)
        {
            this->interrupt_vector_table[exception_code]();
        }
        else
        {
            this->Spin();
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
            this->Spin();
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
void Trap::Set(uint64_t exception_code, uint64_t interrupt, void (* isr)())
{
    if (interrupt)
    {
        if (exception_code < 12)
        {
            this->interrupt_vector_table[exception_code] = isr;
        }
    }
    else
    {
        if (exception_code < 16)
        {
            this->exception_vector_table[exception_code] = isr;
        }
    }
}

//==============================================
// Trap::Spin
//==============================================
void Trap::Spin()
{
   while (1) {}
}

Trap trap;

