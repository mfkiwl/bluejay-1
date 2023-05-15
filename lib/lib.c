//==============================================
// include 
//==============================================
#include "jay.h"

//==============================================
// Jay::Init
//==============================================
void Jay::Init()
{
    this->InitMTVEC();
    this->InitInterruptVectorTable();
    this->InitExceptionVectorTable();
}

//==============================================
// Jay::InitMachineVectorBaseAddressRegister
//==============================================
void jaySetMachineVectorBaseAddressRegister()
{
    mtvec.CSRW((uint64_t)&this->TrapEntry);
}

//==============================================
// Jay::InitInterruptVectorTable
//==============================================
void Jay::InitInterruptVectorTable()
{
    this->interrupt_vector_table[0] = &this->Halt;
    this->interrupt_vector_table[1] = &this->Halt;
    this->interrupt_vector_table[2] = &this->Halt;
    this->interrupt_vector_table[3] = &this->Halt;
    this->interrupt_vector_table[4] = &this->Halt;
    this->interrupt_vector_table[5] = &this->Halt;
    this->interrupt_vector_table[6] = &this->Halt;
    this->interrupt_vector_table[7] = &this->Halt;
    this->interrupt_vector_table[8] = &this->Halt;
    this->interrupt_vector_table[9] = &this->Halt;
    this->interrupt_vector_table[10] = &this->Halt;
    this->interrupt_vector_table[11] = &this->Halt;
}

//==============================================
// Jay::InitExceptionVectorTable
//==============================================
void Jay::InitExceptionVectorTable()
{
    this->exception_vector_table[0] = &this->Halt;
    this->exception_vector_table[1] = &this->Halt;
    this->exception_vector_table[2] = &this->Halt;
    this->exception_vector_table[3] = &this->Halt;
    this->exception_vector_table[4] = &this->Halt;
    this->exception_vector_table[5] = &this->Halt;
    this->exception_vector_table[6] = &this->Halt;
    this->exception_vector_table[7] = &this->Halt;
    this->exception_vector_table[8] = &this->Halt;
    this->exception_vector_table[9] = &this->Halt;
    this->exception_vector_table[10] = &this->Halt;
    this->exception_vector_table[11] = &this->Halt;
    this->exception_vector_table[12] = &this->Halt;
    this->exception_vector_table[13] = &this->Halt;
    this->exception_vector_table[14] = &this->Halt;
    this->exception_vector_table[15] = &this->Halt;
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
            this->interrupt_vector_table[exception_code]();
        }
        else
        {
            this->Halt();
        }
    }
    else
    {
        if (exception_code < 16)
        {
            this->exception_vector_table[exception_code]();
        }
        else
        {
            this->Halt();
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
void jayStoreHalf(uint16_t * ptr, uint16_t value)
{
    *ptr = value;
}

//==============================================
// Jay::StoreWord
//==============================================
void jayStoreWord(uint32_t * ptr, uint32_t value)
{
    *ptr = value;
}

//==============================================
// Jay::StoreDouble
//==============================================
void jayStoreDouble(uint64_t * ptr, uint64_t value)
{
    *ptr = value;
}

