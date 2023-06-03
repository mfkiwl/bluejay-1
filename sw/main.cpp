//==============================================
// include 
//==============================================
#include "jay.hpp"

#define SAMPLE_CYCLES 7621 // (1/f)/(# samples)/(Tclk)


uint64_t i = 0;
//uint64_t samples[32] = {1000, 1195, 1382, 1555, 1707, 1831, 1923, 1980, 2000, 1980, 1923, 1831, 1707, 1555, 1382, 1195, 1000,  804,  617,  444,  292,  168,   76,   19, 0, 19,   76,  168,  292,  444,  617,  804};
uint64_t samples[32] = {64, 76, 88, 99, 109, 117, 123, 126, 128, 126, 123, 117, 109, 99, 88, 76, 64, 51, 39, 28, 18, 10, 4, 1, 0, 1, 4, 10, 18, 28, 39, 51};


void TimerInterruptISR(void)
{
    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
    i = (i + 1) % 32;
    jay.sd((uint64_t)(PULSE_WIDTH_MODULATOR__BASE_ADDR + PULSE_WIDTH_MODULATOR__DUTY), samples[i]);
}


extern void (* interrupt_vector_table[12])();

void main(void)
{
    jay.sd((uint64_t)interrupt_vector_table + CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT * 8, (uint64_t)&TimerInterruptISR);

    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIME), 0);
    jay.sd((uint64_t)(MACHINE_TIMER_REGISTERS__BASE_ADDR + MACHINE_TIMER_REGISTERS__MTIMECMP), SAMPLE_CYCLES);

    jay.sd((uint64_t)(PULSE_WIDTH_MODULATOR__BASE_ADDR + PULSE_WIDTH_MODULATOR__DUTY), samples[i]);
    jay.sd((uint64_t)(PULSE_WIDTH_MODULATOR__BASE_ADDR + PULSE_WIDTH_MODULATOR__PERIOD), 128);

    jay.mie.csrs(CSR__MIE__MTIE__MASK);
    //jay.mie.csrs(CSR__MIE__MEIE__MASK);
    jay.mstatus.csrs(CSR__MSTATUS__MIE__MASK);

    while (1) {}
}

