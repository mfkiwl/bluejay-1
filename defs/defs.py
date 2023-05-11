defs["XLEN"] = {"value": "64"}

defs["PC_RESET_VALUE"] = {"value": "0x0", "prefix": "64"}


defs["ERRORCODE__ACCESS_FAULT"] = {"value": "0x0", "prefix": "64"}
defs["ERRORCODE__MISALIGNED_ADDRESS"] = {"value": "0x1", "prefix": "64"}

defs["SIZE__BYTE"] = {"value": "0x0", "prefix": "2"}
defs["SIZE__HALF_WORD"] = {"value": "0x1", "prefix": "2"}
defs["SIZE__WORD"] = {"value": "0x2", "prefix": "2"}
defs["SIZE__DOUBLE_WORD"] = {"value": "0x3", "prefix": "2"}

defs["FORMAT__R_TYPE"] = {"value": "0x0", "prefix": "3"}
defs["FORMAT__I_TYPE"] = {"value": "0x1", "prefix": "3"}
defs["FORMAT__S_TYPE"] = {"value": "0x2", "prefix": "3"}
defs["FORMAT__B_TYPE"] = {"value": "0x3", "prefix": "3"}
defs["FORMAT__U_TYPE"] = {"value": "0x4", "prefix": "3"}
defs["FORMAT__J_TYPE"] = {"value": "0x5", "prefix": "3"}

defs["OP__NOP"] = {"value": "0x0", "prefix": "6"}
defs["OP__LB"] = {"value": "0x1", "prefix": "6"}
defs["OP__LH"] = {"value": "0x2", "prefix": "6"}
defs["OP__LW"] = {"value": "0x3", "prefix": "6"}
defs["OP__LD"] = {"value": "0x4", "prefix": "6"}
defs["OP__LBU"] = {"value": "0x5", "prefix": "6"}
defs["OP__LHU"] = {"value": "0x6", "prefix": "6"}
defs["OP__LWU"] = {"value": "0x7", "prefix": "6"}
defs["OP__FENCE"] = {"value": "0x8", "prefix": "6"}
defs["OP__FENCE_I"] = {"value": "0x9", "prefix": "6"}
defs["OP__ADDI"] = {"value": "0xa", "prefix": "6"}
defs["OP__SLLI"] = {"value": "0xb", "prefix": "6"}
defs["OP__SLTI"] = {"value": "0xc", "prefix": "6"}
defs["OP__SLTIU"] = {"value": "0xd", "prefix": "6"}
defs["OP__XORI"] = {"value": "0xe", "prefix": "6"}
defs["OP__SRLI"] = {"value": "0xf", "prefix": "6"}
defs["OP__SRAI"] = {"value": "0x10", "prefix": "6"}
defs["OP__ORI"] = {"value": "0x11", "prefix": "6"}
defs["OP__ANDI"] = {"value": "0x12", "prefix": "6"}
defs["OP__AUIPC"] = {"value": "0x13", "prefix": "6"}
defs["OP__ADDIW"] = {"value": "0x14", "prefix": "6"}
defs["OP__SLLIW"] = {"value": "0x15", "prefix": "6"}
defs["OP__SRLIW"] = {"value": "0x16", "prefix": "6"}
defs["OP__SRAIW"] = {"value": "0x17", "prefix": "6"}
defs["OP__SB"] = {"value": "0x18", "prefix": "6"}
defs["OP__SH"] = {"value": "0x19", "prefix": "6"}
defs["OP__SW"] = {"value": "0x1a", "prefix": "6"}
defs["OP__SD"] = {"value": "0x1b", "prefix": "6"}
defs["OP__ADD"] = {"value": "0x1c", "prefix": "6"}
defs["OP__SUB"] = {"value": "0x1d", "prefix": "6"}
defs["OP__SLL"] = {"value": "0x1e", "prefix": "6"}
defs["OP__SLT"] = {"value": "0x1f", "prefix": "6"}
defs["OP__SLTU"] = {"value": "0x20", "prefix": "6"}
defs["OP__XOR"] = {"value": "0x21", "prefix": "6"}
defs["OP__SRL"] = {"value": "0x22", "prefix": "6"}
defs["OP__SRA"] = {"value": "0x23", "prefix": "6"}
defs["OP__OR"] = {"value": "0x24", "prefix": "6"}
defs["OP__AND"] = {"value": "0x25", "prefix": "6"}
defs["OP__LUI"] = {"value": "0x26", "prefix": "6"}
defs["OP__ADDW"] = {"value": "0x27", "prefix": "6"}
defs["OP__SUBW"] = {"value": "0x28", "prefix": "6"}
defs["OP__SLLW"] = {"value": "0x29", "prefix": "6"}
defs["OP__SRLW"] = {"value": "0x2a", "prefix": "6"}
defs["OP__SRAW"] = {"value": "0x2b", "prefix": "6"}
defs["OP__BEQ"] = {"value": "0x2c", "prefix": "6"}
defs["OP__BNE"] = {"value": "0x2d", "prefix": "6"}
defs["OP__BLT"] = {"value": "0x2e", "prefix": "6"}
defs["OP__BGE"] = {"value": "0x2f", "prefix": "6"}
defs["OP__BLTU"] = {"value": "0x30", "prefix": "6"}
defs["OP__BGEU"] = {"value": "0x31", "prefix": "6"}
defs["OP__JALR"] = {"value": "0x32", "prefix": "6"}
defs["OP__JAL"] = {"value": "0x33", "prefix": "6"}
defs["OP__ECALL"] = {"value": "0x34", "prefix": "6"}
defs["OP__EBREAK"] = {"value": "0x35", "prefix": "6"}
defs["OP__CSRRW"] = {"value": "0x36", "prefix": "6"}
defs["OP__CSRRS"] = {"value": "0x37", "prefix": "6"}
defs["OP__CSRRC"] = {"value": "0x38", "prefix": "6"}
defs["OP__CSRRWI"] = {"value": "0x39", "prefix": "6"}
defs["OP__CSRRSI"] = {"value": "0x3a", "prefix": "6"}
defs["OP__CSRRCI"] = {"value": "0x3b", "prefix": "6"}
defs["OP__MRET"] = {"value": "0x3c", "prefix": "6"}
defs["OP__WFI"] = {"value": "0x3d", "prefix": "6"}

defs["FUNC__ADD"] = {"value": "0x0", "prefix": "5"}
defs["FUNC__ADDW"] = {"value": "0x1", "prefix": "5"}
defs["FUNC__SUB"] = {"value": "0x2", "prefix": "5"}
defs["FUNC__SUBW"] = {"value": "0x3", "prefix": "5"}
defs["FUNC__SLL"] = {"value": "0x4", "prefix": "5"}
defs["FUNC__SLLW"] = {"value": "0x5", "prefix": "5"}
defs["FUNC__SLT"] = {"value": "0x6", "prefix": "5"}
defs["FUNC__SLTU"] = {"value": "0x7", "prefix": "5"}
defs["FUNC__XOR"] = {"value": "0x8", "prefix": "5"}
defs["FUNC__SRL"] = {"value": "0x9", "prefix": "5"}
defs["FUNC__SRLW"] = {"value": "0xa", "prefix": "5"}
defs["FUNC__SRA"] = {"value": "0xb", "prefix": "5"}
defs["FUNC__SRAW"] = {"value": "0xc", "prefix": "5"}
defs["FUNC__OR"] = {"value": "0xd", "prefix": "5"}
defs["FUNC__AND"] = {"value": "0xe", "prefix": "5"}
defs["FUNC__CLR"] = {"value": "0xf", "prefix": "5"}
defs["FUNC__NULL_A"] = {"value": "0x10", "prefix": "5"}
defs["FUNC__NULL_B"] = {"value": "0x11", "prefix": "5"}

defs["CSR__MISA"] = {"value": "0x301", "prefix": "12"}
defs["CSR__MISA__EXTENSIONS__FIELD"] = {"value": "25:0"}
defs["CSR__MISA__EXTENSIONS__WIDTH"] = {"value": "26"}
defs["CSR__MISA__EXTENSIONS__I"] = {"value": "0x100", "prefix": "26"}
defs["CSR__MISA__WIRI__0__FIELD"] = {"value": "61:26"}
defs["CSR__MISA__WIRI__0__WIDTH"] = {"value": "36"}
defs["CSR__MISA__WIRI__0__VALUE"] = {"value": "0x0", "prefix": "36"}
defs["CSR__MISA__BASE__FIELD"] = {"value": "63:62"}
defs["CSR__MISA__BASE__WIDTH"] = {"value": "2"}
defs["CSR__MISA__BASE__RV64"] = {"value": "0x2", "prefix": "2"}

defs["CSR__MVENDORID"] = {"value": "0xf11", "prefix": "12"}
defs["CSR__MVENDORID__VENDOR__FIELD"] = {"value": "63:0"}
defs["CSR__MVENDORID__VENDOR__WIDTH"] = {"value": "64"}
defs["CSR__MVENDORID__VENDOR__VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MARCHID"] = {"value": "0xf12", "prefix": "12"}
defs["CSR__MARCHID__ARCHITECTURE_ID__FIELD"] = {"value": "63:0"}
defs["CSR__MARCHID__ARCHITECTURE_ID__WIDTH"] = {"value": "64"}
defs["CSR__MARCHID__ARCHITECTURE_ID__VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MIMPID"] = {"value": "0xf13", "prefix": "12"}
defs["CSR__MIMPID__IMPLEMENTATION__FIELD"] = {"value": "63:0"}
defs["CSR__MIMPID__IMPLEMENTATION__WIDTH"] = {"value": "64"}
defs["CSR__MIMPID__IMPLEMENTATION__VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MHARTID"] = {"value": "0xf14", "prefix": "12"}
defs["CSR__MHARTID__HART_ID__FIELD"] = {"value": "63:0"}
defs["CSR__MHARTID__HART_ID__WIDTH"] = {"value": "64"}
defs["CSR__MHARTID__HART_ID__VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MSTATUS"] = {"value": "0x300", "prefix": "12"}
defs["CSR__MSTATUS__UIE__FIELD"] = {"value": "0"}
defs["CSR__MSTATUS__UIE__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__UIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__UIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__SIE__FIELD"] = {"value": "1"}
defs["CSR__MSTATUS__SIE__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__SIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__SIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__HIE__FIELD"] = {"value": "2"}
defs["CSR__MSTATUS__HIE__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__HIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__HIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__MIE__FIELD"] = {"value": "3"}
defs["CSR__MSTATUS__MIE__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__MIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__MIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__UPIE__FIELD"] = {"value": "4"}
defs["CSR__MSTATUS__UPIE__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__UPIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__UPIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__SPIE__FIELD"] = {"value": "5"}
defs["CSR__MSTATUS__SPIE__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__SPIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__SPIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__HPIE__FIELD"] = {"value": "6"}
defs["CSR__MSTATUS__HPIE__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__HPIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__HPIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__MPIE__FIELD"] = {"value": "7"}
defs["CSR__MSTATUS__MPIE__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__MPIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__MPIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__SPP__FIELD"] = {"value": "8"}
defs["CSR__MSTATUS__SPP__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__SPP__USER"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__SPP__SUPERVISOR"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__HPP__FIELD"] = {"value": "10:9"}
defs["CSR__MSTATUS__HPP__WIDTH"] = {"value": "2"}
defs["CSR__MSTATUS__HPP__USER"] = {"value": "0x0", "prefix": "2"}
defs["CSR__MSTATUS__HPP__SUPERVISOR"] = {"value": "0x1", "prefix": "2"}
defs["CSR__MSTATUS__HPP__HYPERVISOR"] = {"value": "0x2", "prefix": "2"}
defs["CSR__MSTATUS__MPP__FIELD"] = {"value": "12:11"}
defs["CSR__MSTATUS__MPP__WIDTH"] = {"value": "2"}
defs["CSR__MSTATUS__MPP__USER"] = {"value": "0x0", "prefix": "2"}
defs["CSR__MSTATUS__MPP__SUPERVISOR"] = {"value": "0x1", "prefix": "2"}
defs["CSR__MSTATUS__MPP__HYPERVISOR"] = {"value": "0x2", "prefix": "2"}
defs["CSR__MSTATUS__MPP__MACHINE"] = {"value": "0x3", "prefix": "2"}
defs["CSR__MSTATUS__FS__FIELD"] = {"value": "14:13"}
defs["CSR__MSTATUS__FS__WIDTH"] = {"value": "2"}
defs["CSR__MSTATUS__FS__OFF"] = {"value": "0x0", "prefix": "2"}
defs["CSR__MSTATUS__FS__INITIAL"] = {"value": "0x1", "prefix": "2"}
defs["CSR__MSTATUS__FS__CLEAN"] = {"value": "0x2", "prefix": "2"}
defs["CSR__MSTATUS__FS__DIRTY"] = {"value": "0x3", "prefix": "2"}
defs["CSR__MSTATUS__XS__FIELD"] = {"value": "16:15"}
defs["CSR__MSTATUS__XS__WIDTH"] = {"value": "2"}
defs["CSR__MSTATUS__XS__OFF"] = {"value": "0x0", "prefix": "2"}
defs["CSR__MSTATUS__XS__INITIAL"] = {"value": "0x1", "prefix": "2"}
defs["CSR__MSTATUS__XS__CLEAN"] = {"value": "0x2", "prefix": "2"}
defs["CSR__MSTATUS__XS__DIRTY"] = {"value": "0x3", "prefix": "2"}
defs["CSR__MSTATUS__MPRV__FIELD"] = {"value": "17"}
defs["CSR__MSTATUS__MPRV__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__MPRV__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__MPRV__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__PUM__FIELD"] = {"value": "18"}
defs["CSR__MSTATUS__PUM__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__PUM__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__PUM__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__MXR__FIELD"] = {"value": "19"}
defs["CSR__MSTATUS__MXR__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__MXR__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__MXR__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MSTATUS__WPRI__0__FIELD"] = {"value": "23:20"}
defs["CSR__MSTATUS__WPRI__0__WIDTH"] = {"value": "4"}
defs["CSR__MSTATUS__WPRI__0__RESET_VALUE"] = {"value": "0x0", "prefix": "4"}
defs["CSR__MSTATUS__VM__FIELD"] = {"value": "28:24"}
defs["CSR__MSTATUS__VM__WIDTH"] = {"value": "5"}
defs["CSR__MSTATUS__VM__MBARE"] = {"value": "0x0", "prefix": "5"}
defs["CSR__MSTATUS__VM__MBB"] = {"value": "0x1", "prefix": "5"}
defs["CSR__MSTATUS__VM__MBBID"] = {"value": "0x2", "prefix": "5"}
defs["CSR__MSTATUS__VM__SV32"] = {"value": "0x8", "prefix": "5"}
defs["CSR__MSTATUS__VM__SV39"] = {"value": "0x9", "prefix": "5"}
defs["CSR__MSTATUS__VM__SV48"] = {"value": "0xa", "prefix": "5"}
defs["CSR__MSTATUS__VM__SV57"] = {"value": "0xb", "prefix": "5"}
defs["CSR__MSTATUS__VM__SV64"] = {"value": "0xc", "prefix": "5"}
defs["CSR__MSTATUS__WPRI__1__FIELD"] = {"value": "62:29"}
defs["CSR__MSTATUS__WPRI__1__WIDTH"] = {"value": "33"}
defs["CSR__MSTATUS__WPRI__1__RESET_VALUE"] = {"value": "0x0", "prefix": "33"}
defs["CSR__MSTATUS__SD__FIELD"] = {"value": "63"}
defs["CSR__MSTATUS__SD__WIDTH"] = {"value": "1"}
defs["CSR__MSTATUS__SD__NOT_DIRTY"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MSTATUS__SD__DIRTY"] = {"value": "0b1", "prefix": "1"}

defs["CSR__MTVEC"] = {"value": "0x305", "prefix": "12"}
defs["CSR__MTVEC__MODE__FIELD"] = {"value": "1:0"}
defs["CSR__MTVEC__MODE__WIDTH"] = {"value": "2"}
defs["CSR__MTVEC__MODE__DIRECT"] = {"value": "0x0", "prefix": "2"}
defs["CSR__MTVEC__MODE__VECTORED"] = {"value": "0x1", "prefix": "2"}
defs["CSR__MTVEC__BASE__FIELD"] = {"value": "63:2"}
defs["CSR__MTVEC__BASE__WIDTH"] = {"value": "62"}
defs["CSR__MTVEC__BASE__VALUE"] = {"value": "0x0", "prefix": "62"}

defs["CSR__MEDELEG"] = {"value": "0x302", "prefix": "12"}
defs["CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__FIELD"] = {"value": "63:0"}
defs["CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__WIDTH"] = {"value": "64"}
defs["CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MIDELEG"] = {"value": "0x303", "prefix": "12"}
defs["CSR__MIDELEG__INTERRUPTS__FIELD"] = {"value": "63:0"}
defs["CSR__MIDELEG__INTERRUPTS__WIDTH"] = {"value": "64"}
defs["CSR__MIDELEG__INTERRUPTS__VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MIP"] = {"value": "0x344", "prefix": "12"}
defs["CSR__MIP__USIP__FIELD"] = {"value": "0"}
defs["CSR__MIP__USIP__LSB"] = {"value": "0"}
defs["CSR__MIP__USIP__MSB"] = {"value": "0"}
defs["CSR__MIP__USIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__USIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__USIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__SSIP__FIELD"] = {"value": "1"}
defs["CSR__MIP__SSIP__LSB"] = {"value": "1"}
defs["CSR__MIP__SSIP__MSB"] = {"value": "1"}
defs["CSR__MIP__SSIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__SSIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__SSIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__HSIP__FIELD"] = {"value": "2"}
defs["CSR__MIP__HSIP__LSB"] = {"value": "2"}
defs["CSR__MIP__HSIP__MSB"] = {"value": "2"}
defs["CSR__MIP__HSIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__HSIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__HSIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__MSIP__FIELD"] = {"value": "3"}
defs["CSR__MIP__MSIP__LSB"] = {"value": "3"}
defs["CSR__MIP__MSIP__MSB"] = {"value": "3"}
defs["CSR__MIP__MSIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__MSIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__MSIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__UTIP__FIELD"] = {"value": "4"}
defs["CSR__MIP__UTIP__LSB"] = {"value": "4"}
defs["CSR__MIP__UTIP__MSB"] = {"value": "4"}
defs["CSR__MIP__UTIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__UTIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__UTIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__STIP__FIELD"] = {"value": "5"}
defs["CSR__MIP__STIP__LSB"] = {"value": "5"}
defs["CSR__MIP__STIP__MSB"] = {"value": "5"}
defs["CSR__MIP__STIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__STIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__STIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__HTIP__FIELD"] = {"value": "6"}
defs["CSR__MIP__HTIP__LSB"] = {"value": "6"}
defs["CSR__MIP__HTIP__MSB"] = {"value": "6"}
defs["CSR__MIP__HTIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__HTIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__HTIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__MTIP__FIELD"] = {"value": "7"}
defs["CSR__MIP__MTIP__LSB"] = {"value": "7"}
defs["CSR__MIP__MTIP__MSB"] = {"value": "7"}
defs["CSR__MIP__MTIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__MTIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__MTIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__UEIP__FIELD"] = {"value": "8"}
defs["CSR__MIP__UEIP__LSB"] = {"value": "8"}
defs["CSR__MIP__UEIP__MSB"] = {"value": "8"}
defs["CSR__MIP__UEIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__UEIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__UEIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__SEIP__FIELD"] = {"value": "9"}
defs["CSR__MIP__SEIP__LSB"] = {"value": "9"}
defs["CSR__MIP__SEIP__MSB"] = {"value": "9"}
defs["CSR__MIP__SEIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__SEIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__SEIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__HEIP__FIELD"] = {"value": "10"}
defs["CSR__MIP__HEIP__LSB"] = {"value": "10"}
defs["CSR__MIP__HEIP__MSB"] = {"value": "10"}
defs["CSR__MIP__HEIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__HEIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__HEIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__MEIP__FIELD"] = {"value": "11"}
defs["CSR__MIP__MEIP__LSB"] = {"value": "11"}
defs["CSR__MIP__MEIP__MSB"] = {"value": "11"}
defs["CSR__MIP__MEIP__WIDTH"] = {"value": "1"}
defs["CSR__MIP__MEIP__NOT_PENDING"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIP__MEIP__PENDING"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIP__WIRI__0__FIELD"] = {"value": "63:12"}
defs["CSR__MIP__WIRI__0__LSB"] = {"value": "12"}
defs["CSR__MIP__WIRI__0__MSB"] = {"value": "63"}
defs["CSR__MIP__WIRI__0__WIDTH"] = {"value": "52"}
defs["CSR__MIP__WIRI__0__VALUE"] = {"value": "0x0", "prefix": "52"}

defs["CSR__MIE"] = {"value": "0x304", "prefix": "12"}
defs["CSR__MIE__USIE__FIELD"] = {"value": "0"}
defs["CSR__MIE__USIE__LSB"] = {"value": "0"}
defs["CSR__MIE__USIE__MSB"] = {"value": "0"}
defs["CSR__MIE__USIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__USIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__USIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__SSIE__FIELD"] = {"value": "1"}
defs["CSR__MIE__SSIE__LSB"] = {"value": "1"}
defs["CSR__MIE__SSIE__MSB"] = {"value": "1"}
defs["CSR__MIE__SSIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__SSIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__SSIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__HSIE__FIELD"] = {"value": "2"}
defs["CSR__MIE__HSIE__LSB"] = {"value": "2"}
defs["CSR__MIE__HSIE__MSB"] = {"value": "2"}
defs["CSR__MIE__HSIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__HSIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__HSIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__MSIE__FIELD"] = {"value": "3"}
defs["CSR__MIE__MSIE__LSB"] = {"value": "3"}
defs["CSR__MIE__MSIE__MSB"] = {"value": "3"}
defs["CSR__MIE__MSIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__MSIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__MSIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__UTIE__FIELD"] = {"value": "4"}
defs["CSR__MIE__UTIE__LSB"] = {"value": "4"}
defs["CSR__MIE__UTIE__MSB"] = {"value": "4"}
defs["CSR__MIE__UTIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__UTIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__UTIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__STIE__FIELD"] = {"value": "5"}
defs["CSR__MIE__STIE__LSB"] = {"value": "5"}
defs["CSR__MIE__STIE__MSB"] = {"value": "5"}
defs["CSR__MIE__STIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__STIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__STIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__HTIE__FIELD"] = {"value": "6"}
defs["CSR__MIE__HTIE__LSB"] = {"value": "6"}
defs["CSR__MIE__HTIE__MSB"] = {"value": "6"}
defs["CSR__MIE__HTIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__HTIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__HTIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__MTIE__FIELD"] = {"value": "7"}
defs["CSR__MIE__MTIE__LSB"] = {"value": "7"}
defs["CSR__MIE__MTIE__MSB"] = {"value": "7"}
defs["CSR__MIE__MTIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__MTIE__MASK"] = {"value": "0x80"}
defs["CSR__MIE__MTIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__MTIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__UEIE__FIELD"] = {"value": "8"}
defs["CSR__MIE__UEIE__LSB"] = {"value": "8"}
defs["CSR__MIE__UEIE__MSB"] = {"value": "8"}
defs["CSR__MIE__UEIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__UEIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__UEIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__SEIE__FIELD"] = {"value": "9"}
defs["CSR__MIE__SEIE__LSB"] = {"value": "9"}
defs["CSR__MIE__SEIE__MSB"] = {"value": "9"}
defs["CSR__MIE__SEIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__SEIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__SEIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__HEIE__FIELD"] = {"value": "10"}
defs["CSR__MIE__HEIE__LSB"] = {"value": "10"}
defs["CSR__MIE__HEIE__MSB"] = {"value": "10"}
defs["CSR__MIE__HEIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__HEIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__HEIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__MEIE__FIELD"] = {"value": "11"}
defs["CSR__MIE__MEIE__LSB"] = {"value": "11"}
defs["CSR__MIE__MEIE__MSB"] = {"value": "11"}
defs["CSR__MIE__MEIE__WIDTH"] = {"value": "1"}
defs["CSR__MIE__MEIE__DISABLED"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MIE__MEIE__ENABLED"] = {"value": "0b1", "prefix": "1"}
defs["CSR__MIE__WPRI__0__FIELD"] = {"value": "63:12"}
defs["CSR__MIE__WPRI__0__LSB"] = {"value": "12"}
defs["CSR__MIE__WPRI__0__MSB"] = {"value": "63"}
defs["CSR__MIE__WPRI__0__WIDTH"] = {"value": "52"}
defs["CSR__MIE__WPRI__0__VALUE"] = {"value": "0x0", "prefix": "52"}

defs["CSR__MCYCLE"] = {"value": "0xb00", "prefix": "12"}
defs["CSR__MCYCLE__MCYCLE__FIELD"] = {"value": "63:0"}
defs["CSR__MCYCLE__MCYCLE__WIDTH"] = {"value": "64"}
defs["CSR__MCYCLE__MCYCLE__RESET_VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MINSTRET"] = {"value": "0xb02", "prefix": "12"}
defs["CSR__MINSTRET__MINSTRET__FIELD"] = {"value": "63:0"}
defs["CSR__MINSTRET__MINSTRET__WIDTH"] = {"value": "64"}
defs["CSR__MINSTRET__MINSTRET__RESET_VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MHPMCOUNTER3"] = {"value": "0xb03", "prefix": "12"}
defs["CSR__MHPMCOUNTER3__MHPMCOUNTER3__FIELD"] = {"value": "63:0"}
defs["CSR__MHPMCOUNTER3__MHPMCOUNTER3__WIDTH"] = {"value": "64"}
defs["CSR__MHPMCOUNTER3__MHPMCOUNTER3__VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MHPMEVENT3"] = {"value": "0x323", "prefix": "12"}
defs["CSR__MHPMEVENT3__MHPMEVENT3__FIELD"] = {"value": "63:0"}
defs["CSR__MHPMEVENT3__MHPMEVENT3__WIDTH"] = {"value": "64"}
defs["CSR__MHPMEVENT3__MHPMEVENT3__VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MSCRATCH"] = {"value": "0x340", "prefix": "12"}
defs["CSR__MSCRATCH__MSCRATCH__FIELD"] = {"value": "63:0"}
defs["CSR__MSCRATCH__MSCRATCH__WIDTH"] = {"value": "64"}
defs["CSR__MSCRATCH__MSCRATCH__RESET_VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MEPC"] = {"value": "0x341", "prefix": "12"}
defs["CSR__MEPC__MEPC__FIELD"] = {"value": "63:0"}
defs["CSR__MEPC__MEPC__WIDTH"] = {"value": "64"}
defs["CSR__MEPC__MEPC__RESET_VALUE"] = {"value": "0x0", "prefix": "64"}

defs["CSR__MCAUSE"] = {"value": "0x342", "prefix": "12"}
defs["CSR__MCAUSE__EXCEPTION_CODE__FIELD"] = {"value": "62:0"}
defs["CSR__MCAUSE__EXCEPTION_CODE__LSB"] = {"value": "0"}
defs["CSR__MCAUSE__EXCEPTION_CODE__MSB"] = {"value": "62"}
defs["CSR__MCAUSE__EXCEPTION_CODE__WIDTH"] = {"value": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__MASK"] = {"value": "0x7fffffffffffffff"}
defs["CSR__MCAUSE__EXCEPTION_CODE__HARD_RESET"] = {"value": "0x0", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__INSTRUCTION_ADDRESS_MISALIGNED"] = {"value": "0x0", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__INSTRUCTION_ACCESS_FAULT"] = {"value": "0x1", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__ILLEGAL_INSTRUCTION"] = {"value": "0x2", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__BREAKPOINT"] = {"value": "0x3", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__LOAD_ADDRESS_MISALIGNED"] = {"value": "0x4", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__LOAD_ACCESS_FAULT"] = {"value": "0x5", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__STORE_ADDRESS_MISALIGNED"] = {"value": "0x6", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__STORE_ACCESS_FAULT"] = {"value": "0x7", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_U_MODE"] = {"value": "0x8", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_S_MODE"] = {"value": "0x9", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_H_MODE"] = {"value": "0xa", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_M_MODE"] = {"value": "0xb", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__MACHINE_SOFTWARE_INTERRUPT"] = {"value": "0x3", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT"] = {"value": "0x7", "prefix": "63"}
defs["CSR__MCAUSE__EXCEPTION_CODE__MACHINE_EXTERNAL_INTERRUPT"] = {"value": "0xb", "prefix": "63"}
defs["CSR__MCAUSE__INTERRUPT__FIELD"] = {"value": "63"}
defs["CSR__MCAUSE__INTERRUPT__LSB"] = {"value": "63"}
defs["CSR__MCAUSE__INTERRUPT__MSB"] = {"value": "63"}
defs["CSR__MCAUSE__INTERRUPT__WIDTH"] = {"value": "1"}
defs["CSR__MCAUSE__INTERRUPT__MASK"] = {"value": "0x8000000000000000"}
defs["CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT"] = {"value": "0b0", "prefix": "1"}
defs["CSR__MCAUSE__INTERRUPT__INTERRUPT"] = {"value": "0b1", "prefix": "1"}

defs["CSR__MTVAL"] = {"value": "0x343", "prefix": "12"}
defs["CSR__MTVAL__MTVAL__FIELD"] = {"value": "63:0"}
defs["CSR__MTVAL__MTVAL__WIDTH"] = {"value": "64"}
defs["CSR__MTVAL__MTVAL__RESET_VALUE"] = {"value": "0x0", "prefix": "64"}

defs["MEMORY_MAP__REGION__0"] = {"value": "0b0000_0000__0000_0000__0000_0000__0000_0000__0000_????__????_????__????_????__????_????", "prefix": "64"}
defs["MEMORY_MAP__REGION__1"] = {"value": "0b0000_0000__0000_0000__0000_0000__0000_0000__1001_????__????_????__????_????__????_????", "prefix": "64"}
defs["MEMORY_MAP__REGION__2"] = {"value": "0b0000_0000__0000_0000__0000_0000__0000_0000__1010_????__????_????__????_????__????_????", "prefix": "64"}
defs["MEMORY_MAP__REGION__3"] = {"value": "0b0000_0000__0000_0000__0000_0000__0000_0000__1011_????__????_????__????_????__????_????", "prefix": "64"}
defs["MEMORY_MAP__REGION__4"] = {"value": "0b0000_0000__0000_0000__0000_0000__0000_0000__1100_????__????_????__????_????__????_????", "prefix": "64"}
defs["MEMORY_MAP__REGION__5"] = {"value": "0b0000_0000__0000_0000__0000_0000__0000_0000__1101_????__????_????__????_????__????_????", "prefix": "64"}
defs["MEMORY_MAP__REGION__6"] = {"value": "0b0000_0000__0000_0000__0000_0000__0000_0000__1110_????__????_????__????_????__????_????", "prefix": "64"}
defs["MEMORY_MAP__REGION__7"] = {"value": "0b0000_0000__0000_0000__0000_0000__0000_0000__1111_????__????_????__????_????__????_????", "prefix": "64"}

defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR"] = {"value": "0x90000000", "prefix": "40"}
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_SOURCE_PRIORITY__0"] = {"value": "0x0000000", "prefix": "26"}
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_SOURCE_PRIORITY__1"] = {"value": "0x0000004", "prefix": "26"}
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_PENDING_BITS__0_TO_31"] = {"value": "0x0001000", "prefix": "26"}
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_ENABLE_BITS__0_TO_31"] = {"value": "0x0002000", "prefix": "26"}
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__PRIORITY_THRESHOLD"] = {"value": "0x0200000", "prefix": "26"}
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE"] = {"value": "0x0200004", "prefix": "26"}

defs["MACHINE_TIMER_REGISTERS__BASE_ADDR"] = {"value": "0xa0000000", "prefix": "40"}
defs["MACHINE_TIMER_REGISTERS__MTIME"] = {"value": "0x0", "prefix": "4"}
defs["MACHINE_TIMER_REGISTERS__MTIME__MTIME__FIELD"] = {"value": "63:0"}
defs["MACHINE_TIMER_REGISTERS__MTIME__MTIME__WIDTH"] = {"value": "64"}
defs["MACHINE_TIMER_REGISTERS__MTIME__MTIME__RESET_VALUE"] = {"value": "0x0", "prefix": "64"}
defs["MACHINE_TIMER_REGISTERS__MTIMECMP"] = {"value": "0x8", "prefix": "4"}
defs["MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__FIELD"] = {"value": "63:0"}
defs["MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__WIDTH"] = {"value": "64"}
defs["MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__RESET_VALUE"] = {"value": "0x0", "prefix": "64"}

defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__BASE_ADDR"] = {"value": "0xb0000000", "prefix": "40"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__0"] = {"value": "0x0", "prefix": "3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__1"] = {"value": "0x1", "prefix": "3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__2"] = {"value": "0x2", "prefix": "3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__3"] = {"value": "0x3", "prefix": "3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__4"] = {"value": "0x4", "prefix": "3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__5"] = {"value": "0x5", "prefix": "3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__6"] = {"value": "0x6", "prefix": "3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__7"] = {"value": "0x7", "prefix": "3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD"] = {"value": "0:0"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__WIDTH"] = {"value": "1"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO"] = {"value": "0b0", "prefix": "1"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__MAIN_MEMORY"] = {"value": "0b0", "prefix": "1"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD"] = {"value": "1:1"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__WIDTH"] = {"value": "1"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD"] = {"value": "2:2"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__WIDTH"] = {"value": "1"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD"] = {"value": "3:3"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__WIDTH"] = {"value": "1"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD"] = {"value": "4:4"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__WIDTH"] = {"value": "1"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD"] = {"value": "5:5"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__WIDTH"] = {"value": "1"}

defs["PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK"] = {"value": "0x0", "prefix": "2"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT"] = {"value": "0x1", "prefix": "2"}
defs["PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS"] = {"value": "0x2", "prefix": "2"}

defs["GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR"] = {"value": "0xc0000000", "prefix": "40"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__PORT__0"] = {"value": "0x0", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0"] = {"value": "0x1", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__OE__0"] = {"value": "0x2", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__PORT__1"] = {"value": "0x3", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__DATA__1"] = {"value": "0x4", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__OE__1"] = {"value": "0x5", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__PORT__2"] = {"value": "0x6", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__DATA__2"] = {"value": "0x7", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__OE__2"] = {"value": "0x8", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__PORT__3"] = {"value": "0x9", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__DATA__3"] = {"value": "0xa", "prefix": "4"}
defs["GENERAL_PURPOSE_INPUT_OUTPUT__OE__3"] = {"value": "0xb", "prefix": "4"}

