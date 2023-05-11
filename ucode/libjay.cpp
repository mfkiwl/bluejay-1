//==============================================
// include 
//==============================================
#include <stdint.h>
#include "mie.hpp"
#include "mstatus.hpp"
#include "mtvec.hpp"
#include "mcause.hpp"


void StoreByte(uint8_t * ptr, uint8_t value)
{
    *ptr = value;
}

void StoreHalf(uint16_t * ptr, uint16_t value)
{
    *ptr = value;
}

void StoreWord(uint32_t * ptr, uint32_t value)
{
    *ptr = value;
}


void StoreDouble(uint64_t * ptr, uint64_t value)
{
    *ptr = value;
}

uint8_t LoadByte(uint8_t * ptr)
{
    return *ptr; 
}

uint16_t LoadHalf(uint16_t * ptr)
{
    return *ptr; 
}

uint16_t LoadWord(uint32_t * ptr)
{
    return *ptr; 
}

uint64_t LoadDouble(uint64_t * ptr)
{
    return *ptr; 
}



//==============================================
// Trap 
//==============================================
struct Trap
{
    static void * interrupt_vector_table[];
    static void * exception_vector_table[];

    static void Init();
    static void Entry();
    static void SetISR(void * isr, uint64_t exception_code, uint64_t interrupt);
};

//==============================================
// Trap::Init 
//==============================================
void Trap::Init()
{
    mtvec::CSRW(&Trap::Entry);
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
    
    // call the ISR
    if (mcause::CSRR() >> 63)
    {
        
    }
    else
    {
    }
    asm volatile ("addi x20, x0, 0xbc" : : : );

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





void main(void)
{
    Trap::Init();
    //Trap::SetISR(foo, CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT, CSR__MCAUSE__INTERRUPT__INTERRUPT);

    //asm volatile ("csrs mstatus, %0" : : "r" (0x8) : );
    //mie::Set(0x80);
    //mie::Clear(0x80);
    //mie::Write(0xaaaa);
    //uint64_t value;
    //value = mie::Read();
    uint64_t rd;
    mie::CSRS(0x80);
    rd = mie::CSRRC(0x80);
    rd = mie::CSRRS(0x880);
    mie::CSRC(0x80);
    rd = mie::CSRRW(0x888);
    mie::CSRW(0x808);
    rd = mie::CSRR();

}

