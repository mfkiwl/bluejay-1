//==============================================
// include 
//==============================================
#include "jay.h"
#include "trap.h"


#define DELAY__0 50000000
#define DELAY__1 25000000


void TimerInterruptIsr(void)
{
    uint64_t data__0;    
    data__0 = jay.lb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0));
    data__0 = !data__0;
    jay.sb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), data__0);
    jay.sd((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
}

void ExternalInterruptIsr(void)
{
    uint64_t id;
    uint64_t delay;
    // claim external interrupt
    id = jay.lw((uint64_t)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE));
    delay = jay.ld((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP));

    if (delay == DELAY__0)
    {
        delay = DELAY__1;
    }
    else
    {
        delay = DELAY__0;
    }

    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), delay);
    jay.sw((uint64_t)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE), id);
}

void main(void)
{
    trap.Init();
    trap.Set(CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT, 0x1, &TimerInterruptIsr);
    trap.Set(CSR__MCAUSE__EXCEPTION_CODE__MACHINE_EXTERNAL_INTERRUPT, 0x1, &ExternalInterruptIsr);

    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), DELAY__0);
    jay.sb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), 0x1);
    jay.sb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__OE__0), 0x1);

    jay.mie.csrs(CSR__MIE__MTIE__MASK);
    jay.mie.csrs(CSR__MIE__MEIE__MASK);

    // enable interrupt source 1 for context 0
    jay.sw((uint64_t)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_ENABLE_BITS__0_TO_31), 0x2);

    jay.mstatus.csrs(CSR__MSTATUS__MIE__MASK);
}

