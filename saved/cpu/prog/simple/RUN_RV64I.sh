#!/bin/bash

bindir=/home/seankent/bluejay/imperas/imperas-riscv-tests/riscv-ovpsim-plus/bin/Linux64

${bindir}/riscvOVPsimPlus.exe \
    --program sim__0.elf \
    --variant RV64I \
    --signaturedump \
    --override riscvOVPsim/cpu/sigdump/SignatureFile=sim__0.sig.dat.txt \
    --override riscvOVPsim/cpu/sigdump/StartSymbol="resultArray" \
    --override riscvOVPsim/cpu/sigdump/ByteCount=48 \
    --override riscvOVPsim/cpu/sigdump/SignatureAtEnd=T \
    --logfile sim__0.sig.run.log \
    "$@"
 
