#include <stdint.h>

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
// mie
//==============================================
struct mie
{
    static uint64_t Read();
    static void Write(uint64_t value);
    static void Set(uint64_t mask);
    static void Clear(uint64_t mask);
};

//==============================================
// mie::Read
//==============================================
uint64_t mie::Read()
{
    uint64_t value;
    asm volatile ("csrr %0, mie" : "=r" (value) : : );
    return value;
}

//==============================================
// mie::Write
//==============================================
void mie::Write(uint64_t value)
{
    asm volatile ("csrw mie, %0" : : "r" (value) : );
}

//==============================================
// mie::Set
//==============================================
void mie::Set(uint64_t mask)
{
    asm volatile ("csrs mie, %0" : : "r" (mask) : );
}

//==============================================
// mie::Clear
//==============================================
void mie::Clear(uint64_t mask)
{
    asm volatile ("csrc mie, %0" : : "r" (mask) : );
}


//==============================================
// Trap 
//==============================================
struct Trap
{
    static void Init();
    static void Entry();
};

//==============================================
// Trap::Init 
//==============================================
void Trap::Init()
{
    asm volatile ("csrw mtvec, %0" : : "r" (&Trap::Entry) : );
}

//==============================================
// Trap::Entry
//==============================================
void Trap::Entry()
{
    asm volatile ("addi x20, x0, 0xbc" : : : );
}


void main(void)
{
    Trap::Init();
    asm volatile ("csrs mstatus, %0" : : "r" (0x8) : );
    mie::Set(0x80);
    mie::Clear(0x80);
    mie::Write(0xaaaa);
    uint64_t value;
    value = mie::Read();
}

