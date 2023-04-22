defs["XLEN"] = "64"
defs["PC_RESET_VALUE"] = "64'h0"
defs["ERRORCODE__ACCESS_FAULT"] = "64'h0"
defs["ERRORCODE__MISALIGNED_ADDRESS"] = "64'h1"
defs["SIZE__BYTE"] = "2'h0"
defs["SIZE__HALF_WORD"] = "2'h1"
defs["SIZE__WORD"] = "2'h2"
defs["SIZE__DOUBLE_WORD"] = "2'h3"
defs["FORMAT__R_TYPE"] = "3'h0"
defs["FORMAT__I_TYPE"] = "3'h1"
defs["FORMAT__S_TYPE"] = "3'h2"
defs["FORMAT__B_TYPE"] = "3'h3"
defs["FORMAT__U_TYPE"] = "3'h4"
defs["FORMAT__J_TYPE"] = "3'h5"
defs["OP__NOP"] = "6'h0"
defs["OP__LB"] = "6'h1"
defs["OP__LH"] = "6'h2"
defs["OP__LW"] = "6'h3"
defs["OP__LD"] = "6'h4"
defs["OP__LBU"] = "6'h5"
defs["OP__LHU"] = "6'h6"
defs["OP__LWU"] = "6'h7"
defs["OP__FENCE"] = "6'h8"
defs["OP__FENCE_I"] = "6'h9"
defs["OP__ADDI"] = "6'ha"
defs["OP__SLLI"] = "6'hb"
defs["OP__SLTI"] = "6'hc"
defs["OP__SLTIU"] = "6'hd"
defs["OP__XORI"] = "6'he"
defs["OP__SRLI"] = "6'hf"
defs["OP__SRAI"] = "6'h10"
defs["OP__ORI"] = "6'h11"
defs["OP__ANDI"] = "6'h12"
defs["OP__AUIPC"] = "6'h13"
defs["OP__ADDIW"] = "6'h14"
defs["OP__SLLIW"] = "6'h15"
defs["OP__SRLIW"] = "6'h16"
defs["OP__SRAIW"] = "6'h17"
defs["OP__SB"] = "6'h18"
defs["OP__SH"] = "6'h19"
defs["OP__SW"] = "6'h1a"
defs["OP__SD"] = "6'h1b"
defs["OP__ADD"] = "6'h1c"
defs["OP__SUB"] = "6'h1d"
defs["OP__SLL"] = "6'h1e"
defs["OP__SLT"] = "6'h1f"
defs["OP__SLTU"] = "6'h20"
defs["OP__XOR"] = "6'h21"
defs["OP__SRL"] = "6'h22"
defs["OP__SRA"] = "6'h23"
defs["OP__OR"] = "6'h24"
defs["OP__AND"] = "6'h25"
defs["OP__LUI"] = "6'h26"
defs["OP__ADDW"] = "6'h27"
defs["OP__SUBW"] = "6'h28"
defs["OP__SLLW"] = "6'h29"
defs["OP__SRLW"] = "6'h2a"
defs["OP__SRAW"] = "6'h2b"
defs["OP__BEQ"] = "6'h2c"
defs["OP__BNE"] = "6'h2d"
defs["OP__BLT"] = "6'h2e"
defs["OP__BGE"] = "6'h2f"
defs["OP__BLTU"] = "6'h30"
defs["OP__BGEU"] = "6'h31"
defs["OP__JALR"] = "6'h32"
defs["OP__JAL"] = "6'h33"
defs["OP__ECALL"] = "6'h34"
defs["OP__EBREAK"] = "6'h35"
defs["OP__CSRRW"] = "6'h36"
defs["OP__CSRRS"] = "6'h37"
defs["OP__CSRRC"] = "6'h38"
defs["OP__CSRRWI"] = "6'h39"
defs["OP__CSRRSI"] = "6'h3a"
defs["OP__CSRRCI"] = "6'h3b"
defs["OP__MRET"] = "6'h3c"
defs["OP__WFI"] = "6'h3d"
defs["FUNC__ADD"] = "5'h0"
defs["FUNC__ADDW"] = "5'h1"
defs["FUNC__SUB"] = "5'h2"
defs["FUNC__SUBW"] = "5'h3"
defs["FUNC__SLL"] = "5'h4"
defs["FUNC__SLLW"] = "5'h5"
defs["FUNC__SLT"] = "5'h6"
defs["FUNC__SLTU"] = "5'h7"
defs["FUNC__XOR"] = "5'h8"
defs["FUNC__SRL"] = "5'h9"
defs["FUNC__SRLW"] = "5'ha"
defs["FUNC__SRA"] = "5'hb"
defs["FUNC__SRAW"] = "5'hc"
defs["FUNC__OR"] = "5'hd"
defs["FUNC__AND"] = "5'he"
defs["FUNC__CLR"] = "5'hf"
defs["FUNC__NULL_A"] = "5'h10"
defs["FUNC__NULL_B"] = "5'h11"
defs["CSR__MISA"] = "12'h301"
defs["CSR__MISA__EXTENSIONS__FIELD"] = "25:0"
defs["CSR__MISA__EXTENSIONS__WIDTH"] = "26"
defs["CSR__MISA__EXTENSIONS__I"] = "26'h100"
defs["CSR__MISA__WIRI__0__FIELD"] = "61:26"
defs["CSR__MISA__WIRI__0__WIDTH"] = "36"
defs["CSR__MISA__WIRI__0__VALUE"] = "36'h0"
defs["CSR__MISA__BASE__FIELD"] = "63:62"
defs["CSR__MISA__BASE__WIDTH"] = "2"
defs["CSR__MISA__BASE__RV64"] = "2'h2"
defs["CSR__MVENDORID"] = "12'hf11"
defs["CSR__MVENDORID__VENDOR__FIELD"] = "63:0"
defs["CSR__MVENDORID__VENDOR__WIDTH"] = "64"
defs["CSR__MVENDORID__VENDOR__VALUE"] = "64'h0"
defs["CSR__MARCHID"] = "12'hf12"
defs["CSR__MARCHID__ARCHITECTURE_ID__FIELD"] = "63:0"
defs["CSR__MARCHID__ARCHITECTURE_ID__WIDTH"] = "64"
defs["CSR__MARCHID__ARCHITECTURE_ID__VALUE"] = "64'h0"
defs["CSR__MIMPID"] = "12'hf13"
defs["CSR__MIMPID__IMPLEMENTATION__FIELD"] = "63:0"
defs["CSR__MIMPID__IMPLEMENTATION__WIDTH"] = "64"
defs["CSR__MIMPID__IMPLEMENTATION__VALUE"] = "64'h0"
defs["CSR__MHARTID"] = "12'hf14"
defs["CSR__MHARTID__HART_ID__FIELD"] = "63:0"
defs["CSR__MHARTID__HART_ID__WIDTH"] = "64"
defs["CSR__MHARTID__HART_ID__VALUE"] = "64'h0"
defs["CSR__MSTATUS"] = "12'h300"
defs["CSR__MSTATUS__UIE__FIELD"] = "0"
defs["CSR__MSTATUS__UIE__WIDTH"] = "1"
defs["CSR__MSTATUS__UIE__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__UIE__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__SIE__FIELD"] = "1"
defs["CSR__MSTATUS__SIE__WIDTH"] = "1"
defs["CSR__MSTATUS__SIE__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__SIE__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__HIE__FIELD"] = "2"
defs["CSR__MSTATUS__HIE__WIDTH"] = "1"
defs["CSR__MSTATUS__HIE__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__HIE__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__MIE__FIELD"] = "3"
defs["CSR__MSTATUS__MIE__WIDTH"] = "1"
defs["CSR__MSTATUS__MIE__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__MIE__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__UPIE__FIELD"] = "4"
defs["CSR__MSTATUS__UPIE__WIDTH"] = "1"
defs["CSR__MSTATUS__UPIE__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__UPIE__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__SPIE__FIELD"] = "5"
defs["CSR__MSTATUS__SPIE__WIDTH"] = "1"
defs["CSR__MSTATUS__SPIE__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__SPIE__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__HPIE__FIELD"] = "6"
defs["CSR__MSTATUS__HPIE__WIDTH"] = "1"
defs["CSR__MSTATUS__HPIE__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__HPIE__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__MPIE__FIELD"] = "7"
defs["CSR__MSTATUS__MPIE__WIDTH"] = "1"
defs["CSR__MSTATUS__MPIE__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__MPIE__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__SPP__FIELD"] = "8"
defs["CSR__MSTATUS__SPP__WIDTH"] = "1"
defs["CSR__MSTATUS__SPP__USER"] = "1'b0"
defs["CSR__MSTATUS__SPP__SUPERVISOR"] = "1'b1"
defs["CSR__MSTATUS__HPP__FIELD"] = "10:9"
defs["CSR__MSTATUS__HPP__WIDTH"] = "2"
defs["CSR__MSTATUS__HPP__USER"] = "2'h0"
defs["CSR__MSTATUS__HPP__SUPERVISOR"] = "2'h1"
defs["CSR__MSTATUS__HPP__HYPERVISOR"] = "2'h2"
defs["CSR__MSTATUS__MPP__FIELD"] = "12:11"
defs["CSR__MSTATUS__MPP__WIDTH"] = "2"
defs["CSR__MSTATUS__MPP__USER"] = "2'h0"
defs["CSR__MSTATUS__MPP__SUPERVISOR"] = "2'h1"
defs["CSR__MSTATUS__MPP__HYPERVISOR"] = "2'h2"
defs["CSR__MSTATUS__MPP__MACHINE"] = "2'h3"
defs["CSR__MSTATUS__FS__FIELD"] = "14:13"
defs["CSR__MSTATUS__FS__WIDTH"] = "2"
defs["CSR__MSTATUS__FS__OFF"] = "2'h0"
defs["CSR__MSTATUS__FS__INITIAL"] = "2'h1"
defs["CSR__MSTATUS__FS__CLEAN"] = "2'h2"
defs["CSR__MSTATUS__FS__DIRTY"] = "2'h3"
defs["CSR__MSTATUS__XS__FIELD"] = "16:15"
defs["CSR__MSTATUS__XS__WIDTH"] = "2"
defs["CSR__MSTATUS__XS__OFF"] = "2'h0"
defs["CSR__MSTATUS__XS__INITIAL"] = "2'h1"
defs["CSR__MSTATUS__XS__CLEAN"] = "2'h2"
defs["CSR__MSTATUS__XS__DIRTY"] = "2'h3"
defs["CSR__MSTATUS__MPRV__FIELD"] = "17"
defs["CSR__MSTATUS__MPRV__WIDTH"] = "1"
defs["CSR__MSTATUS__MPRV__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__MPRV__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__PUM__FIELD"] = "18"
defs["CSR__MSTATUS__PUM__WIDTH"] = "1"
defs["CSR__MSTATUS__PUM__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__PUM__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__MXR__FIELD"] = "19"
defs["CSR__MSTATUS__MXR__WIDTH"] = "1"
defs["CSR__MSTATUS__MXR__DISABLED"] = "1'b0"
defs["CSR__MSTATUS__MXR__ENABLED"] = "1'b1"
defs["CSR__MSTATUS__WPRI__0__FIELD"] = "23:20"
defs["CSR__MSTATUS__WPRI__0__WIDTH"] = "4"
defs["CSR__MSTATUS__WPRI__0__RESET_VALUE"] = "4'h0"
defs["CSR__MSTATUS__VM__FIELD"] = "28:24"
defs["CSR__MSTATUS__VM__WIDTH"] = "5"
defs["CSR__MSTATUS__VM__MBARE"] = "5'h0"
defs["CSR__MSTATUS__VM__MBB"] = "5'h1"
defs["CSR__MSTATUS__VM__MBBID"] = "5'h2"
defs["CSR__MSTATUS__VM__SV32"] = "5'h8"
defs["CSR__MSTATUS__VM__SV39"] = "5'h9"
defs["CSR__MSTATUS__VM__SV48"] = "5'ha"
defs["CSR__MSTATUS__VM__SV57"] = "5'hb"
defs["CSR__MSTATUS__VM__SV64"] = "5'hc"
defs["CSR__MSTATUS__WPRI__1__FIELD"] = "62:29"
defs["CSR__MSTATUS__WPRI__1__WIDTH"] = "33"
defs["CSR__MSTATUS__WPRI__1__RESET_VALUE"] = "33'h0"
defs["CSR__MSTATUS__SD__FIELD"] = "63"
defs["CSR__MSTATUS__SD__WIDTH"] = "1"
defs["CSR__MSTATUS__SD__NOT_DIRTY"] = "1'b0"
defs["CSR__MSTATUS__SD__DIRTY"] = "1'b1"
defs["CSR__MTVEC"] = "12'h305"
defs["CSR__MTVEC__MODE__FIELD"] = "1:0"
defs["CSR__MTVEC__MODE__WIDTH"] = "2"
defs["CSR__MTVEC__MODE__DIRECT"] = "2'h0"
defs["CSR__MTVEC__MODE__VECTORED"] = "2'h1"
defs["CSR__MTVEC__BASE__FIELD"] = "63:2"
defs["CSR__MTVEC__BASE__WIDTH"] = "62"
defs["CSR__MTVEC__BASE__VALUE"] = "62'h0"
defs["CSR__MEDELEG"] = "12'h302"
defs["CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__FIELD"] = "63:0"
defs["CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__WIDTH"] = "64"
defs["CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__VALUE"] = "64'h0"
defs["CSR__MIDELEG"] = "12'h303"
defs["CSR__MIDELEG__INTERRUPTS__FIELD"] = "63:0"
defs["CSR__MIDELEG__INTERRUPTS__WIDTH"] = "64"
defs["CSR__MIDELEG__INTERRUPTS__VALUE"] = "64'h0"
defs["CSR__MIP"] = "12'h344"
defs["CSR__MIP__USIP__FIELD"] = "0"
defs["CSR__MIP__USIP__LSB"] = "0"
defs["CSR__MIP__USIP__MSB"] = "0"
defs["CSR__MIP__USIP__WIDTH"] = "1"
defs["CSR__MIP__USIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__USIP__PENDING"] = "1'b1"
defs["CSR__MIP__SSIP__FIELD"] = "1"
defs["CSR__MIP__SSIP__LSB"] = "1"
defs["CSR__MIP__SSIP__MSB"] = "1"
defs["CSR__MIP__SSIP__WIDTH"] = "1"
defs["CSR__MIP__SSIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__SSIP__PENDING"] = "1'b1"
defs["CSR__MIP__HSIP__FIELD"] = "2"
defs["CSR__MIP__HSIP__LSB"] = "2"
defs["CSR__MIP__HSIP__MSB"] = "2"
defs["CSR__MIP__HSIP__WIDTH"] = "1"
defs["CSR__MIP__HSIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__HSIP__PENDING"] = "1'b1"
defs["CSR__MIP__MSIP__FIELD"] = "3"
defs["CSR__MIP__MSIP__LSB"] = "3"
defs["CSR__MIP__MSIP__MSB"] = "3"
defs["CSR__MIP__MSIP__WIDTH"] = "1"
defs["CSR__MIP__MSIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__MSIP__PENDING"] = "1'b1"
defs["CSR__MIP__UTIP__FIELD"] = "4"
defs["CSR__MIP__UTIP__LSB"] = "4"
defs["CSR__MIP__UTIP__MSB"] = "4"
defs["CSR__MIP__UTIP__WIDTH"] = "1"
defs["CSR__MIP__UTIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__UTIP__PENDING"] = "1'b1"
defs["CSR__MIP__STIP__FIELD"] = "5"
defs["CSR__MIP__STIP__LSB"] = "5"
defs["CSR__MIP__STIP__MSB"] = "5"
defs["CSR__MIP__STIP__WIDTH"] = "1"
defs["CSR__MIP__STIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__STIP__PENDING"] = "1'b1"
defs["CSR__MIP__HTIP__FIELD"] = "6"
defs["CSR__MIP__HTIP__LSB"] = "6"
defs["CSR__MIP__HTIP__MSB"] = "6"
defs["CSR__MIP__HTIP__WIDTH"] = "1"
defs["CSR__MIP__HTIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__HTIP__PENDING"] = "1'b1"
defs["CSR__MIP__MTIP__FIELD"] = "7"
defs["CSR__MIP__MTIP__LSB"] = "7"
defs["CSR__MIP__MTIP__MSB"] = "7"
defs["CSR__MIP__MTIP__WIDTH"] = "1"
defs["CSR__MIP__MTIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__MTIP__PENDING"] = "1'b1"
defs["CSR__MIP__UEIP__FIELD"] = "8"
defs["CSR__MIP__UEIP__LSB"] = "8"
defs["CSR__MIP__UEIP__MSB"] = "8"
defs["CSR__MIP__UEIP__WIDTH"] = "1"
defs["CSR__MIP__UEIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__UEIP__PENDING"] = "1'b1"
defs["CSR__MIP__SEIP__FIELD"] = "9"
defs["CSR__MIP__SEIP__LSB"] = "9"
defs["CSR__MIP__SEIP__MSB"] = "9"
defs["CSR__MIP__SEIP__WIDTH"] = "1"
defs["CSR__MIP__SEIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__SEIP__PENDING"] = "1'b1"
defs["CSR__MIP__HEIP__FIELD"] = "10"
defs["CSR__MIP__HEIP__LSB"] = "10"
defs["CSR__MIP__HEIP__MSB"] = "10"
defs["CSR__MIP__HEIP__WIDTH"] = "1"
defs["CSR__MIP__HEIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__HEIP__PENDING"] = "1'b1"
defs["CSR__MIP__MEIP__FIELD"] = "11"
defs["CSR__MIP__MEIP__LSB"] = "11"
defs["CSR__MIP__MEIP__MSB"] = "11"
defs["CSR__MIP__MEIP__WIDTH"] = "1"
defs["CSR__MIP__MEIP__NOT_PENDING"] = "1'b0"
defs["CSR__MIP__MEIP__PENDING"] = "1'b1"
defs["CSR__MIP__WIRI__0__FIELD"] = "63:12"
defs["CSR__MIP__WIRI__0__LSB"] = "12"
defs["CSR__MIP__WIRI__0__MSB"] = "63"
defs["CSR__MIP__WIRI__0__WIDTH"] = "52"
defs["CSR__MIP__WIRI__0__VALUE"] = "52'h0"
defs["CSR__MIE"] = "12'h304"
defs["CSR__MIE__USIE__FIELD"] = "0"
defs["CSR__MIE__USIE__LSB"] = "0"
defs["CSR__MIE__USIE__MSB"] = "0"
defs["CSR__MIE__USIE__WIDTH"] = "1"
defs["CSR__MIE__USIE__DISABLED"] = "1'b0"
defs["CSR__MIE__USIE__ENABLED"] = "1'b1"
defs["CSR__MIE__SSIE__FIELD"] = "1"
defs["CSR__MIE__SSIE__LSB"] = "1"
defs["CSR__MIE__SSIE__MSB"] = "1"
defs["CSR__MIE__SSIE__WIDTH"] = "1"
defs["CSR__MIE__SSIE__DISABLED"] = "1'b0"
defs["CSR__MIE__SSIE__ENABLED"] = "1'b1"
defs["CSR__MIE__HSIE__FIELD"] = "2"
defs["CSR__MIE__HSIE__LSB"] = "2"
defs["CSR__MIE__HSIE__MSB"] = "2"
defs["CSR__MIE__HSIE__WIDTH"] = "1"
defs["CSR__MIE__HSIE__DISABLED"] = "1'b0"
defs["CSR__MIE__HSIE__ENABLED"] = "1'b1"
defs["CSR__MIE__MSIE__FIELD"] = "3"
defs["CSR__MIE__MSIE__LSB"] = "3"
defs["CSR__MIE__MSIE__MSB"] = "3"
defs["CSR__MIE__MSIE__WIDTH"] = "1"
defs["CSR__MIE__MSIE__DISABLED"] = "1'b0"
defs["CSR__MIE__MSIE__ENABLED"] = "1'b1"
defs["CSR__MIE__UTIE__FIELD"] = "4"
defs["CSR__MIE__UTIE__LSB"] = "4"
defs["CSR__MIE__UTIE__MSB"] = "4"
defs["CSR__MIE__UTIE__WIDTH"] = "1"
defs["CSR__MIE__UTIE__DISABLED"] = "1'b0"
defs["CSR__MIE__UTIE__ENABLED"] = "1'b1"
defs["CSR__MIE__STIE__FIELD"] = "5"
defs["CSR__MIE__STIE__LSB"] = "5"
defs["CSR__MIE__STIE__MSB"] = "5"
defs["CSR__MIE__STIE__WIDTH"] = "1"
defs["CSR__MIE__STIE__DISABLED"] = "1'b0"
defs["CSR__MIE__STIE__ENABLED"] = "1'b1"
defs["CSR__MIE__HTIE__FIELD"] = "6"
defs["CSR__MIE__HTIE__LSB"] = "6"
defs["CSR__MIE__HTIE__MSB"] = "6"
defs["CSR__MIE__HTIE__WIDTH"] = "1"
defs["CSR__MIE__HTIE__DISABLED"] = "1'b0"
defs["CSR__MIE__HTIE__ENABLED"] = "1'b1"
defs["CSR__MIE__MTIE__FIELD"] = "7"
defs["CSR__MIE__MTIE__LSB"] = "7"
defs["CSR__MIE__MTIE__MSB"] = "7"
defs["CSR__MIE__MTIE__WIDTH"] = "1"
defs["CSR__MIE__MTIE__DISABLED"] = "1'b0"
defs["CSR__MIE__MTIE__ENABLED"] = "1'b1"
defs["CSR__MIE__UEIE__FIELD"] = "8"
defs["CSR__MIE__UEIE__LSB"] = "8"
defs["CSR__MIE__UEIE__MSB"] = "8"
defs["CSR__MIE__UEIE__WIDTH"] = "1"
defs["CSR__MIE__UEIE__DISABLED"] = "1'b0"
defs["CSR__MIE__UEIE__ENABLED"] = "1'b1"
defs["CSR__MIE__SEIE__FIELD"] = "9"
defs["CSR__MIE__SEIE__LSB"] = "9"
defs["CSR__MIE__SEIE__MSB"] = "9"
defs["CSR__MIE__SEIE__WIDTH"] = "1"
defs["CSR__MIE__SEIE__DISABLED"] = "1'b0"
defs["CSR__MIE__SEIE__ENABLED"] = "1'b1"
defs["CSR__MIE__HEIE__FIELD"] = "10"
defs["CSR__MIE__HEIE__LSB"] = "10"
defs["CSR__MIE__HEIE__MSB"] = "10"
defs["CSR__MIE__HEIE__WIDTH"] = "1"
defs["CSR__MIE__HEIE__DISABLED"] = "1'b0"
defs["CSR__MIE__HEIE__ENABLED"] = "1'b1"
defs["CSR__MIE__MEIE__FIELD"] = "11"
defs["CSR__MIE__MEIE__LSB"] = "11"
defs["CSR__MIE__MEIE__MSB"] = "11"
defs["CSR__MIE__MEIE__WIDTH"] = "1"
defs["CSR__MIE__MEIE__DISABLED"] = "1'b0"
defs["CSR__MIE__MEIE__ENABLED"] = "1'b1"
defs["CSR__MIE__WPRI__0__FIELD"] = "63:12"
defs["CSR__MIE__WPRI__0__LSB"] = "12"
defs["CSR__MIE__WPRI__0__MSB"] = "63"
defs["CSR__MIE__WPRI__0__WIDTH"] = "52"
defs["CSR__MIE__WPRI__0__VALUE"] = "52'h0"
defs["CSR__MCYCLE"] = "12'hb00"
defs["CSR__MCYCLE__MCYCLE__FIELD"] = "63:0"
defs["CSR__MCYCLE__MCYCLE__WIDTH"] = "64"
defs["CSR__MCYCLE__MCYCLE__RESET_VALUE"] = "64'h0"
defs["CSR__MINSTRET"] = "12'hb02"
defs["CSR__MINSTRET__MINSTRET__FIELD"] = "63:0"
defs["CSR__MINSTRET__MINSTRET__WIDTH"] = "64"
defs["CSR__MINSTRET__MINSTRET__RESET_VALUE"] = "64'h0"
defs["CSR__MHPMCOUNTER3"] = "12'hb03"
defs["CSR__MHPMCOUNTER3__MHPMCOUNTER3__FIELD"] = "63:0"
defs["CSR__MHPMCOUNTER3__MHPMCOUNTER3__WIDTH"] = "64"
defs["CSR__MHPMCOUNTER3__MHPMCOUNTER3__VALUE"] = "64'h0"
defs["CSR__MHPMEVENT3"] = "12'h323"
defs["CSR__MHPMEVENT3__MHPMEVENT3__FIELD"] = "63:0"
defs["CSR__MHPMEVENT3__MHPMEVENT3__WIDTH"] = "64"
defs["CSR__MHPMEVENT3__MHPMEVENT3__VALUE"] = "64'h0"
defs["CSR__MSCRATCH"] = "12'h340"
defs["CSR__MSCRATCH__MSCRATCH__FIELD"] = "63:0"
defs["CSR__MSCRATCH__MSCRATCH__WIDTH"] = "64"
defs["CSR__MSCRATCH__MSCRATCH__RESET_VALUE"] = "64'h0"
defs["CSR__MEPC"] = "12'h341"
defs["CSR__MEPC__MEPC__FIELD"] = "63:0"
defs["CSR__MEPC__MEPC__WIDTH"] = "64"
defs["CSR__MEPC__MEPC__RESET_VALUE"] = "64'h0"
defs["CSR__MCAUSE"] = "12'h342"
defs["CSR__MCAUSE__EXCEPTION_CODE__FIELD"] = "62:0"
defs["CSR__MCAUSE__EXCEPTION_CODE__WIDTH"] = "63"
defs["CSR__MCAUSE__EXCEPTION_CODE__HARD_RESET"] = "63'h0"
defs["CSR__MCAUSE__EXCEPTION_CODE__INSTRUCTION_ADDRESS_MISALIGNED"] = "63'h0"
defs["CSR__MCAUSE__EXCEPTION_CODE__INSTRUCTION_ACCESS_FAULT"] = "63'h1"
defs["CSR__MCAUSE__EXCEPTION_CODE__ILLEGAL_INSTRUCTION"] = "63'h2"
defs["CSR__MCAUSE__EXCEPTION_CODE__BREAKPOINT"] = "63'h3"
defs["CSR__MCAUSE__EXCEPTION_CODE__LOAD_ADDRESS_MISALIGNED"] = "63'h4"
defs["CSR__MCAUSE__EXCEPTION_CODE__LOAD_ACCESS_FAULT"] = "63'h5"
defs["CSR__MCAUSE__EXCEPTION_CODE__STORE_ADDRESS_MISALIGNED"] = "63'h6"
defs["CSR__MCAUSE__EXCEPTION_CODE__STORE_ACCESS_FAULT"] = "63'h7"
defs["CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_U_MODE"] = "63'h8"
defs["CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_S_MODE"] = "63'h9"
defs["CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_H_MODE"] = "63'ha"
defs["CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_M_MODE"] = "63'hb"
defs["CSR__MCAUSE__EXCEPTION_CODE__MACHINE_SOFTWARE_INTERRUPT"] = "63'h3"
defs["CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT"] = "63'h7"
defs["CSR__MCAUSE__EXCEPTION_CODE__MACHINE_EXTERNAL_INTERRUPT"] = "63'hb"
defs["CSR__MCAUSE__INTERRUPT__FIELD"] = "63"
defs["CSR__MCAUSE__INTERRUPT__WIDTH"] = "1"
defs["CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT"] = "1'b0"
defs["CSR__MCAUSE__INTERRUPT__INTERRUPT"] = "1'b1"
defs["CSR__MTVAL"] = "12'h343"
defs["CSR__MTVAL__MTVAL__FIELD"] = "63:0"
defs["CSR__MTVAL__MTVAL__WIDTH"] = "64"
defs["CSR__MTVAL__MTVAL__RESET_VALUE"] = "64'h0"
defs["MEMORY_MAP__REGION__0"] = "64'b0000_0000__0000_0000__0000_0000__0000_0000__0000_????__????_????__????_????__????_????"
defs["MEMORY_MAP__REGION__1"] = "64'b0000_0000__0000_0000__0000_0000__0000_0000__1001_????__????_????__????_????__????_????"
defs["MEMORY_MAP__REGION__2"] = "64'b0000_0000__0000_0000__0000_0000__0000_0000__1010_????__????_????__????_????__????_????"
defs["MEMORY_MAP__REGION__3"] = "64'b0000_0000__0000_0000__0000_0000__0000_0000__1011_????__????_????__????_????__????_????"
defs["MEMORY_MAP__REGION__4"] = "64'b0000_0000__0000_0000__0000_0000__0000_0000__1100_????__????_????__????_????__????_????"
defs["MEMORY_MAP__REGION__5"] = "64'b0000_0000__0000_0000__0000_0000__0000_0000__1101_????__????_????__????_????__????_????"
defs["MEMORY_MAP__REGION__6"] = "64'b0000_0000__0000_0000__0000_0000__0000_0000__1110_????__????_????__????_????__????_????"
defs["MEMORY_MAP__REGION__7"] = "64'b0000_0000__0000_0000__0000_0000__0000_0000__1111_????__????_????__????_????__????_????"
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__BASE_ADDR"] = "40'h90000000"
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_SOURCE_PRIORITY__0"] = "26'h0000000"
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_SOURCE_PRIORITY__1"] = "26'h0000004"
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_PENDING_BITS__0_TO_31"] = "26'h0001000"
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_ENABLE_BITS__0_TO_31"] = "26'h0002000"
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__PRIORITY_THRESHOLD"] = "26'h0200000"
defs["PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE"] = "26'h0200004"
defs["MACHINE_TIMER_REGISTERS__BASE_ADDR"] = "40'ha0000000"
defs["MACHINE_TIMER_REGISTERS__MTIME"] = "4'h0"
defs["MACHINE_TIMER_REGISTERS__MTIME__MTIME__FIELD"] = "63:0"
defs["MACHINE_TIMER_REGISTERS__MTIME__MTIME__WIDTH"] = "64"
defs["MACHINE_TIMER_REGISTERS__MTIME__MTIME__RESET_VALUE"] = "64'h0"
defs["MACHINE_TIMER_REGISTERS__MTIMECMP"] = "4'h8"
defs["MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__FIELD"] = "63:0"
defs["MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__WIDTH"] = "64"
defs["MACHINE_TIMER_REGISTERS__MTIMECMP__MTIMECMP__RESET_VALUE"] = "64'h0"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__BASE_ADDR"] = "40'hb0000000"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__0"] = "3'h0"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__1"] = "3'h1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__2"] = "3'h2"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__3"] = "3'h3"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__4"] = "3'h4"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__5"] = "3'h5"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__6"] = "3'h6"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__7"] = "3'h7"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD"] = "0:0"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__WIDTH"] = "1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO"] = "1'b0"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__MAIN_MEMORY"] = "1'b0"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD"] = "1:1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__WIDTH"] = "1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD"] = "2:2"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__WIDTH"] = "1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD"] = "3:3"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__WIDTH"] = "1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD"] = "4:4"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__WIDTH"] = "1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD"] = "5:5"
defs["PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__WIDTH"] = "1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK"] = "2'h0"
defs["PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT"] = "2'h1"
defs["PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS"] = "2'h2"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__BASE_ADDR"] = "40'hc0000000"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__PORT__0"] = "4'h0"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__DATA__0"] = "4'h1"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__OE__0"] = "4'h2"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__PORT__1"] = "4'h3"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__DATA__1"] = "4'h4"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__OE__1"] = "4'h5"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__PORT__2"] = "4'h6"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__DATA__2"] = "4'h7"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__OE__2"] = "4'h8"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__PORT__3"] = "4'h9"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__DATA__3"] = "4'ha"
defs["GENERAL_PURPOSE_INPUT_OUTPUT__OE__3"] = "4'hb"
