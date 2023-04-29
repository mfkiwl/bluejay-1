#include <stdint.h>
#include "defs.h"
void init(void);
void bind_isr(uint64_t exception_code, uint64_t interrupt, void * isr);
void enable_timer_interrupt(void);
void enable_interrupts(void);

#define DELAY__0 50000000

void sd(uint64_t * ptr, uint64_t value)
{
    *ptr = value;
}



void sb(uint8_t * ptr, uint8_t value)
{
    *ptr = value;
}

uint64_t ld(uint64_t * ptr)
{
    return *ptr; 
}

uint8_t lb(uint8_t * ptr)
{
    return *ptr; 
}


void timer_interrupt_isr(void)
{
    uint8_t data__0;    
    data__0 = lb((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0));
    data__0 = !data__0;
    sb((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), data__0);
    sd((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
}

void main(void)
{
    init();
    bind_isr(CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT, 0x1, &timer_interrupt_isr);
    sd((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
    sd((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), DELAY__0);
    sb((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), 0x1);
    sb((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__OE__0), 0x1);
    enable_timer_interrupt();
    enable_interrupts();
}
