//==============================================
// include 
//==============================================
#include "jay.hpp"


#define DELAY__0 50000000
#define DELAY__1 25000000


void TimerInterruptIsr(void)
{
    uint8_t data__0;    
    data__0 = Jay::LoadByte((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0));
    data__0 = !data__0;
    Jay::StoreByte((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), data__0);
    Jay::StoreDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
}

void ExternalInterruptIsr(void)
{
    uint32_t id;
    uint64_t delay;
    // claim external interrupt
    id = Jay::LoadWord((uint32_t *)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE));
    delay = Jay::LoadDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP));

    if (delay == DELAY__0)
    {
        delay = DELAY__1;
    }
    else
    {
        delay = DELAY__0;
    }

    Jay::StoreDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), delay);
    Jay::StoreWord((uint32_t *)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE), id);
}

void main(void)
{
    Jay::Init();
    Jay::SetInterruptServiceRoutine(&TimerInterruptIsr, CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT, 0x1);
    Jay::SetInterruptServiceRoutine(&ExternalInterruptIsr, CSR__MCAUSE__EXCEPTION_CODE__MACHINE_EXTERNAL_INTERRUPT, 0x1);

    Jay::StoreDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
    Jay::StoreDouble((uint64_t *)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), DELAY__0);
    Jay::StoreByte((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0), 0x1);
    Jay::StoreByte((uint8_t *)(GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR + GENERAL_PURPOSE_INPUT_OUTPUT__OE__0), 0x1);

    mie::CSRS(CSR__MIE__MTIE__MASK);
    mie::CSRS(CSR__MIE__MEIE__MASK);

    // enable interrupt source 1 for context 0
    Jay::StoreWord((uint32_t *)(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR + PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_ENABLE_BITS__0_TO_31), 0x2);

    mstatus::CSRS(CSR__MSTATUS__MIE__MASK);
}

