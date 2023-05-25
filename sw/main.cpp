//==============================================
// include 
//==============================================
#include "jay.hpp"

//#define DELAY__0 50000000
//#define DELAY__1 25000000

#define DELAY__0 200
#define DELAY__1 100

#define CLK_FREQ 100000000
#define PWM_FREQ 100000
#define SAMPLE_FREQ 14112*2


uint64_t state = 0;
uint64_t N__on = 0;
uint64_t N__off = 0;

uint64_t count = 0;
uint64_t i = 0;
uint64_t samples[32] = {1000, 1195, 1382, 1555, 1707, 1831, 1923, 1980, 2000, 1980, 1923, 1831, 1707, 1555, 1382, 1195, 1000,  804,  617,  444,  292,  168,   76,   19, 0, 19,   76,  168,  292,  444,  617,  804};


void TimerInterruptISR(void)
{
    state = !state;
    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);

    if (state)
    {
        jay.sb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__OE__0), 0x0);
        jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), N__on);
    }
    else
    {
        jay.sb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__OE__0), 0x2);
        jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), N__off);
    }

    if (!state)
    {
        if (count == PWM_FREQ/SAMPLE_FREQ)
        {
            i = (i + 1) % 32;
            N__on = samples[i];
            N__off = 2000 - samples[i];
            count = 0;
        }
        else
        {
            count++;
        }
    }
    


    //uint64_t data__0;    
    //data__0 = jay.lb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0));
    //data__0 = !data__0;
    //jay.sb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), data__0);
    //jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
}

void ExternalInterruptISR(void)
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

extern void (* interrupt_vector_table[12])();
//extern uint64_t * interrupt_vector_table;

void main(void)
{
    //trap.Init();
    //trap.Set(CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT, 0x1, &TimerInterruptIsr);
    //trap.Set(CSR__MCAUSE__EXCEPTION_CODE__MACHINE_EXTERNAL_INTERRUPT, 0x1, &ExternalInterruptIsr);

    jay.sd((uint64_t)interrupt_vector_table + CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT * 8, (uint64_t)&TimerInterruptISR);
    //jay.sd((uint64_t)interrupt_vector_table + CSR__MCAUSE__EXCEPTION_CODE__MACHINE_EXTERNAL_INTERRUPT * 8, (uint64_t)&ExternalInterruptISR);

    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), 0x0);
    jay.sb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), 0x0);
    jay.sb((uint64_t)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__OE__0), 0x2);

    jay.mie.csrs(CSR__MIE__MTIE__MASK);
    jay.mie.csrs(CSR__MIE__MEIE__MASK);

    // enable interrupt source 1 for context 0
    jay.sw((uint64_t)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_ENABLE_BITS__0_TO_31), 0x2);

    jay.mstatus.csrs(CSR__MSTATUS__MIE__MASK);
}

