- The JALR instruction ignores the lowest bit of the calculated target address.
- The JAL and JALR instructions will generate a misaligned instruction fetch exception if the target address is not aligned to a four-byte boundary.
- Loads with a destination of x0 must still raise any exceptions and action any other side effects even though the load value is discarded
- Trap for misaligned memory accesses
- For RV32I, SLLI, SRLI, and SRAI generate an illegal instruction exception if imm[5] != 0.


Resources:
    - RISC-V Tutorial: Spike & Proxy Kernel from Source to Hello World
        - https://www.youtube.com/watch?v=zZUtTplVHwE
    - riscv-isa-sim
        - https://github.com/riscv-software-src/riscv-isa-sim
    - riscv-pk
        - https://github.com/riscv-software-src/riscv-pk
    - QEMU RV32I Installation & Setup
        - https://www.youtube.com/watch?v=iWQRV-KJ7tQ&list=PL3by7evD3F53Dz2RiB47Ztp9l_piGVuus&index=9
    - Compiling Freestanding RISC-V Programs
        - https://www.youtube.com/watch?v=ODn7vnWOptM


