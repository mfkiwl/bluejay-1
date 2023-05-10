- The JALR instruction ignores the lowest bit of the calculated target address.
- The JAL and JALR instructions will generate a misaligned instruction fetch exception if the target address is not aligned to a four-byte boundary.
- Loads with a destination of x0 must still raise any exceptions and action any other side effects even though the load value is discarded
- Trap for misaligned memory accesses
- For RV32I, SLLI, SRLI, and SRAI generate an illegal instruction exception if imm[5] != 0.


Resources:
    - Riscv-gnu-toolchain:
        - https://github.com/riscv-collab/riscv-gnu-toolchain
    - RISC-V Assembly Programmer's Manual
        - https://github.com/riscv-non-isa/riscv-asm-manual/blob/master/riscv-asm.md
        - https://shakti.org.in/docs/risc-v-asm-manual.pdf
    - RISC-V Assembler Reference
        - https://michaeljclark.github.io/asm.html
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
    - Freestanding RISC-V Programs
        - https://www.youtube.com/watch?v=iml0DBo5yqo
        - https://github.com/johnwinans/rvddt
    - Start PC dicussion in Spike
        - https://github.com/riscv-software-src/riscv-isa-sim/issues/192
    - Spike Documentation
        - https://github.com/poweihuang17/Documentation_Spike
    - Vivado Design Suite Tcl Command Reference Guide
        - https://docs.xilinx.com/v/u/2019.2-English/ug835-vivado-tcl-commands
    - Install Vivado on Ubuntu
        - https://danielmangum.com/posts/vivado-2020-x-ubuntu-20-04/
        - Fix for hung Ubuntu install: https://support.xilinx.com/s/article/76616?language=en_US
    - ELF Files Format
        - https://www.ics.uci.edu/~aburtsev/238P/hw/hw3-elf/hw3-elf.html
    - Running simulation in Vivado with TCL and Make
        - https://www.itsembedded.com/dhd/vivado_sim_1/
        - https://www.itsembedded.com/dhd/vivado_sim_3/
    - An Introduction to Assembly Language Programming in RISC-V
        - https://riscv-programming.org/book/riscv-book.html
    - How to exit Spike simulator Discussion:
        - https://github.com/riscv-software-src/riscv-isa-sim/issues/256
    - Imperas RISC-V Simulator
        - https://github.com/riscv-ovpsim/imperas-riscv-tests
        - https://github.com/riscv-ovpsim/imperas-riscv-tests/blob/v20220527/riscv-ovpsim/README.md
        - https://github.com/riscv-ovpsim/imperas-riscv-tests/blob/v20220527/riscv-ovpsim/doc/riscvOVPsim_User_Guide.pdf
        - I was only able to download riscvOVPsimPlus on my Mac (I could not download it on my Linux PC)
        - make command: make RISCV_TARGET=riscv-target/riscvOVPsimPlus RISCV_DEVICE=I XLEN=64 RISCV_BASE=i TARGETDIR=/home/seankent/bluejay/imperas/imperas-riscv-tests
        - Settup (this is how you make all of the tests!):
            $ export TOPDIR=/home/seankent/riscv/riscv-gnu-toolchain
            $ make clean simulate verify postverify XLEN=64 RISCV_DEVICE=I RISCV_TARGET=riscvOVPsimPlus
    - Inline assebly code
        - https://www.codeinsideout.com/blog/stm32/assembly/#extended-assembly
    - crt0
        - https://en.wikipedia.org/wiki/Crt0 
    - SiFive Interrupt Cookbook
        - https://starfivetech.com/uploads/sifive-interrupt-cookbook-v1p2.pdf
    Recursive Make Considered Harmful - Peter Miller
        - https://aegis.sourceforge.net/auug97.pdf
    - Vivado simulation hangs when two FSMs communicate with eachother and one of the signals is assinged a default value in an always_comb block
        - Someone with a similar issue: https://support.xilinx.com/s/question/0D52E00006iHmQxSAK/simulation-freezing-with-systemverilog-interfaces-fsm-handshake?language=en_US
        - -delay_trigger swithc: https://community.cadence.com/cadence_technology_forums/f/logic-design/15558/problem-with-simvision-hanging-in-an-endless-loop
        - zero delay glitches: https://groups.google.com/g/comp.lang.verilog/c/iDcmOjJ_XSw
        - https://electronics.stackexchange.com/questions/99223/relation-between-delta-cycle-and-event-scheduling-in-verilog-simulation
        - https://groups.google.com/g/comp.lang.verilog/c/FWEERWA4pF4?pli=1
        - Great decription of the issue: https://chickenbit.net/simulation-stuck-no-progress-in-simulation-time/
        - https://support.xilinx.com/s/question/0D54U00006VGb0GSAT/simulation-stuck-ie-no-progress-in-simulation-time-due-to-zero-delay-glitch-in-combinatorial-logic-is-their-a-switch-that-will-tell-the-simulator-to-wait-until-the-entire-alwayscomb-block-is-evaluated-before-deciding-whether-an-event-has-occurred
    - riscv-asm-manual: https://github.com/riscv-non-isa/riscv-asm-manual/blob/master/riscv-asm.md
    - riscv exception/interrupt handler example
        - https://mullerlee.cyou/2020/07/09/riscv-exception-interrupt/




