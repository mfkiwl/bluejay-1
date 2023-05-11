#include <stdint.h>
#include "defs.h"
void init(void);
void bind_isr(uint64_t exception_code, uint64_t interrupt, void * isr);
void enable_timer_interrupt(void);
void enable_external_interrupt(void);
void enable_interrupts(void);

#define DELAY__0 50000000
#define DELAY__1 25000000

void StoreByte(uint8_t * ptr, uint8_t value)
{
    *ptr = value;
}

void StoreWord(uint32_t * ptr, uint32_t value)
{
    *ptr = value;
}

void StoreHalf(uint16_t * ptr, uint16_t value)
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


void TimerInterruptIsr(void)
{
    uint8_t data__0;    
    data__0 = LoadByte((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0));
    data__0 = !data__0;
    StoreByte((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), data__0);
    StoreDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
}


void ExternalInterruptIsr(void)
{
    uint32_t id;
    uint64_t delay;
    // claim external interrupt
    id = LoadWord((uint32_t *)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE));
    delay = LoadDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP));

    if (delay == DELAY__0)
    {
        delay = DELAY__1;
    }
    else
    {
        delay = DELAY__0;
    }

    StoreDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), delay);
    StoreWord((uint32_t *)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE), id);
}


void main(void)
{
    init();
    bind_isr(CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT, 0x1, &TimerInterruptIsr);
    bind_isr(CSR__MCAUSE__EXCEPTION_CODE__MACHINE_EXTERNAL_INTERRUPT, 0x1, &ExternalInterruptIsr);
    StoreDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
    StoreDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), DELAY__0);
    StoreByte((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), 0x1);
    StoreByte((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__OE__0), 0x1);
    enable_timer_interrupt();
    enable_external_interrupt();
    // enable interrupt source 1 for context 0
    StoreWord((uint32_t *)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_ENABLE_BITS__0_TO_31), 0x2);
    enable_interrupts();
}
