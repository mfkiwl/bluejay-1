//==============================================
// jay 
//==============================================
module jay 
(
    input clk,
    input rst,
    output logic cs,
    output logic we,
    output logic [63:0] addr,
    output logic [1:0] size,
    output logic [63:0] wr_data,
    input ready,
    input resp,
    input [63:0] rd_data,
    input sip,
    input tip,
    input eip
);

// Program Counter/Instruction Register
logic [63:0] pc;
logic [63:0] pc__n;
logic [31:0] ir;
logic [31:0] ir__n;

// Decoder.
logic [5:0] op;
logic [4:0] rs1;
logic [4:0] rs2;
logic [4:0] rd;
logic [63:0] imm;
logic [63:0] uimm;

// Register File
logic rf__cs;
logic rf__we;
logic [4:0] rf__addr;
logic [63:0] rf__rd_data;
logic [63:0] rf__wr_data;

// ALU
logic [4:0] func;
logic [63:0] a;
logic [63:0] a__n;
logic [63:0] b;
logic [63:0] b__n;
logic [63:0] c;

// Comparator
logic eq;
logic ne;
logic lt;
logic ge;
logic ltu;
logic geu;

// Control and Status Registers
logic csr__cs;
logic csr__we;
logic [11:0] csr__addr;
logic [63:0] csr__wr_data;
logic [63:0] csr__rd_data;
logic mstatus__mie;
logic mie__meie;
logic mie__msie;
logic mie__mtie;
logic mip__meip;
logic mip__msip;
logic mip__mtip;


// CSR logic
logic instret;

// FSM
logic [7:0] state;
logic [7:0] state__n;


//==============================
// decoder
//==============================
jay__decoder decoder
(
    .clk(clk),
    .rst(rst),
    .ir(ir),
    .op(op),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .imm(imm),
    .uimm(uimm)
);


//==============================
// register_file
//==============================
jay__register_file register_file
(
    .clk(clk),
    .rst(rst),
    .cs(rf__cs),
    .we(rf__we),
    .addr(rf__addr),
    .rd_data(rf__rd_data),
    .wr_data(rf__wr_data)
);

//==============================
// arithmetic_logic_unit
//==============================
jay__arithmetic_logic_unit arithmetic_logic_unit
(
    .clk(clk),
    .rst(rst),
    .func(func),
    .a(a),
    .b(b),
    .c(c)
);

//==============================
// comparator
//==============================
jay__comparator comparator
(
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .eq(eq),
    .ne(ne),
    .lt(lt),
    .ltu(ltu),
    .ge(ge),
    .geu(geu)
);

//==============================
// control_and_status_registers
//==============================
jay__control_and_status_registers control_and_status_registers
(
    .clk(clk),
    .rst(rst),
    .cs(csr__cs),
    .we(csr__we),
    .addr(csr__addr),
    .rd_data(csr__rd_data),
    .wr_data(csr__wr_data),
    .sip(sip),
    .tip(tip),
    .eip(eip),
    .instret(instret),
    .mstatus__mie(mstatus__mie),
    .mie__meie(mie__meie),
    .mie__msie(mie__msie),
    .mie__mtie(mie__mtie),
    .mip__meip(mip__meip),
    .mip__msip(mip__msip),
    .mip__mtip(mip__mtip)
);

//==============================================
// Finite State Machine
//==============================================
PYTHON
(
    states = [
        'STATE__RESET',
        'STATE__FETCH__0',
        'STATE__FETCH__1',
        'STATE__DECODE',
        'STATE__LB__0',
        'STATE__LB__1',
        'STATE__LB__2',
        'STATE__LB__3',
        'STATE__LH__0',
        'STATE__LH__1',
        'STATE__LH__2',
        'STATE__LH__3',
        'STATE__LW__0',
        'STATE__LW__1',
        'STATE__LW__2',
        'STATE__LW__3',
        'STATE__LD__0',
        'STATE__LD__1',
        'STATE__LD__2',
        'STATE__LD__3',
        'STATE__LBU__0',
        'STATE__LBU__1',
        'STATE__LBU__2',
        'STATE__LBU__3',
        'STATE__LHU__0',
        'STATE__LHU__1',
        'STATE__LHU__2',
        'STATE__LHU__3',
        'STATE__LWU__0',
        'STATE__LWU__1',
        'STATE__LWU__2',
        'STATE__LWU__3',
        'STATE__SB__0', 
        'STATE__SB__1', 
        'STATE__SB__2', 
        'STATE__SB__3', 
        'STATE__SH__0', 
        'STATE__SH__1', 
        'STATE__SH__2', 
        'STATE__SH__3', 
        'STATE__SW__0', 
        'STATE__SW__1', 
        'STATE__SW__2', 
        'STATE__SW__3', 
        'STATE__SD__0', 
        'STATE__SD__1', 
        'STATE__SD__2', 
        'STATE__SD__3', 
        'STATE__ADD__0',
        'STATE__ADD__1',
        'STATE__ADD__2',
        'STATE__SUB__0',
        'STATE__SUB__1',
        'STATE__SUB__2',
        'STATE__SLL__0',
        'STATE__SLL__1',
        'STATE__SLL__2',
        'STATE__SLT__0',
        'STATE__SLT__1',
        'STATE__SLT__2',
        'STATE__SLTU__0',
        'STATE__SLTU__1',
        'STATE__SLTU__2',
        'STATE__XOR__0',
        'STATE__XOR__1',
        'STATE__XOR__2',
        'STATE__SRL__0',
        'STATE__SRL__1',
        'STATE__SRL__2',
        'STATE__SRA__0',
        'STATE__SRA__1',
        'STATE__SRA__2',
        'STATE__OR__0',
        'STATE__OR__1',
        'STATE__OR__2',
        'STATE__AND__0',
        'STATE__AND__1',
        'STATE__AND__2',
        'STATE__LUI',
        'STATE__ADDW__0',
        'STATE__ADDW__1',
        'STATE__ADDW__2',
        'STATE__SUBW__0',
        'STATE__SUBW__1',
        'STATE__SUBW__2',
        'STATE__SLLW__0',
        'STATE__SLLW__1',
        'STATE__SLLW__2',
        'STATE__SRLW__0',
        'STATE__SRLW__1',
        'STATE__SRLW__2',
        'STATE__SRAW__0',
        'STATE__SRAW__1',
        'STATE__SRAW__2',
        'STATE__ADDI__0',
        'STATE__ADDI__1',
        'STATE__SLLI__0',
        'STATE__SLLI__1',
        'STATE__SLTI__0',
        'STATE__SLTI__1',
        'STATE__SLTIU__0',
        'STATE__SLTIU__1',
        'STATE__XORI__0',
        'STATE__XORI__1',
        'STATE__SRLI__0', 
        'STATE__SRLI__1',
        'STATE__SRAI__0', 
        'STATE__SRAI__1',
        'STATE__ORI__0', 
        'STATE__ORI__1',
        'STATE__ANDI__0', 
        'STATE__ANDI__1',
        'STATE__ADDIW__0', 
        'STATE__ADDIW__1',
        'STATE__SLLIW__0', 
        'STATE__SLLIW__1',
        'STATE__SRLIW__0', 
        'STATE__SRLIW__1',
        'STATE__SRAIW__0', 
        'STATE__SRAIW__1',
        'STATE__AUIPC__0', 
        'STATE__AUIPC__1', 
        'STATE__JALR__0', 
        'STATE__JALR__1', 
        'STATE__JAL__0', 
        'STATE__JAL__1', 
        'STATE__BEQ__0',
        'STATE__BEQ__1',
        'STATE__BEQ__2',
        'STATE__BEQ__3',
        'STATE__BEQ__4',
        'STATE__BEQ__5',
        'STATE__BNE__0',
        'STATE__BNE__1',
        'STATE__BNE__2',
        'STATE__BNE__3',
        'STATE__BNE__4',
        'STATE__BNE__5',
        'STATE__BLT__0',
        'STATE__BLT__1',
        'STATE__BLT__2',
        'STATE__BLT__3',
        'STATE__BLT__4',
        'STATE__BLT__5',
        'STATE__BGE__0',
        'STATE__BGE__1',
        'STATE__BGE__2',
        'STATE__BGE__3',
        'STATE__BGE__4',
        'STATE__BGE__5',
        'STATE__BLTU__0',
        'STATE__BLTU__1',
        'STATE__BLTU__2',
        'STATE__BLTU__3',
        'STATE__BLTU__4',
        'STATE__BLTU__5',
        'STATE__BGEU__0',
        'STATE__BGEU__1',
        'STATE__BGEU__2',
        'STATE__BGEU__3',
        'STATE__BGEU__4',
        'STATE__BGEU__5',
        'STATE__ECALL',
        'STATE__EBREAK',
        'STATE__WFI',
        'STATE__FENCE',
        'STATE__FENCE_I',
        'STATE__CSRRW__0',
        'STATE__CSRRW__1',
        'STATE__CSRRW__2',
        'STATE__CSRRS__0',
        'STATE__CSRRS__1',
        'STATE__CSRRS__2',
        'STATE__CSRRC__0',
        'STATE__CSRRC__1',
        'STATE__CSRRC__2',
        'STATE__CSRRWI__0',
        'STATE__CSRRWI__1',
        'STATE__CSRRWI__2',
        'STATE__CSRRSI__0',
        'STATE__CSRRSI__1',
        'STATE__CSRRSI__2',
        'STATE__CSRRCI__0',
        'STATE__CSRRCI__1',
        'STATE__CSRRCI__2',
        'STATE__MRET__0',
        'STATE__MRET__1',
        'STATE__TRAP__0',
        'STATE__TRAP__1',
        'STATE__TRAP__2',
        'STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0',
        'STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR',
        'STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1',
        'STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0',
        'STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1',
        'STATE__EXCEPTION__ILLEGAL_INSTRUCTION',
        'STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0',
        'STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1',
        'STATE__EXCEPTION__LOAD_ACCESS_FAULT__0',
        'STATE__EXCEPTION__LOAD_ACCESS_FAULT__1',
        'STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0',
        'STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1',
        'STATE__EXCEPTION__STORE_ACCESS_FAULT__0',
        'STATE__EXCEPTION__STORE_ACCESS_FAULT__1',
        'STATE__INTERRUPT__SOFTWARE',
        'STATE__INTERRUPT__TIMER',
        'STATE__INTERRUPT__EXTERNAL',
        'STATE__FATAL',
    ]

    for i in range(len(states)):
        print(f"localparam {states[i]} = 8'h{i:x};") 
)


always_comb begin
    state__n = state;
    ir__n = ir;
    pc__n = pc;
    a__n = a;
    b__n = b;
    func = FUNC__ADD;
    rf__cs = 1'b0;
    rf__we = 1'b0;
    rf__addr = rd;
    rf__wr_data = c;
    cs = 1'b0;
    we = 1'b0;
    size = SIZE__WORD;
    wr_data = rf__rd_data;
    csr__cs = 1'b0;
    csr__we = 1'b0;
    csr__addr = imm[11:0];
    csr__wr_data = c;
    instret = 1'b0;

    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__FETCH__0;
        end
        
        //==============================
        // STATE__FETCH__0
        //==============================
        STATE__FETCH__0:
        begin
            state__n = (mstatus__mie & mie__meie & mip__meip) ? STATE__INTERRUPT__EXTERNAL : (mstatus__mie & mie__msie & mip__msip) ? STATE__INTERRUPT__SOFTWARE : (mstatus__mie & mie__mtie & mip__mtip) ? STATE__INTERRUPT__TIMER : STATE__FETCH__1;
        end

        //==============================
        // STATE__FETCH__1
        //==============================
        STATE__FETCH__1:
        begin
            cs = 1'b1;
            addr = pc;
            size = SIZE__WORD;
            ir__n = rd_data[31:0];
            state__n = (ready & ~resp) ? STATE__DECODE : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0 : STATE__FETCH__1;
        end

        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            case (op)
                OP__LB:
                begin
                    state__n = STATE__LB__0;
                end
                OP__LH:
                begin
                    state__n = STATE__LH__0;
                end
                OP__LW:
                begin
                    state__n = STATE__LW__0;
                end
                OP__LD:
                begin
                    state__n = STATE__LD__0;
                end
                OP__LBU:
                begin
                    state__n = STATE__LBU__0;
                end
                OP__LHU:
                begin
                    state__n = STATE__LHU__0;
                end
                OP__LWU:
                begin
                    state__n = STATE__LWU__0;
                end
                OP__FENCE:
                begin
                    state__n = STATE__FENCE;
                end
                OP__FENCE_I:
                begin
                    state__n = STATE__FENCE_I;
                end
                OP__ADDI:
                begin
                    state__n = STATE__ADDI__0;
                end
                OP__SLLI:
                begin
                    state__n = STATE__SLLI__0;
                end
                OP__SLTI:
                begin
                    state__n = STATE__SLTI__0;
                end
                OP__SLTIU:
                begin
                    state__n = STATE__SLTIU__0;
                end
                OP__XORI:
                begin
                    state__n = STATE__XORI__0;
                end
                OP__SRLI:
                begin
                    state__n = STATE__SRLI__0;
                end
                OP__SRAI:
                begin
                    state__n = STATE__SRAI__0;
                end
                OP__ORI:
                begin
                    state__n = STATE__ORI__0;
                end
                OP__ANDI:
                begin
                    state__n = STATE__ANDI__0;
                end
                OP__AUIPC:
                begin
                    state__n = STATE__AUIPC__0;
                end
                OP__ADDIW:
                begin
                    state__n = STATE__ADDIW__0;
                end
                OP__SLLIW:
                begin
                    state__n = STATE__SLLIW__0;
                end
                OP__SRLIW:
                begin
                    state__n = STATE__SRLIW__0;
                end
                OP__SRAIW:
                begin
                    state__n = STATE__SRAIW__0;
                end
                OP__SB:
                begin
                    state__n = STATE__SB__0;
                end
                OP__SH:
                begin
                    state__n = STATE__SH__0;
                end
                OP__SW:
                begin
                    state__n = STATE__SW__0;
                end
                OP__SD:
                begin
                    state__n = STATE__SD__0;
                end
                OP__ADD:
                begin
                    state__n = STATE__ADD__0;
                end
                OP__SUB:
                begin
                    state__n = STATE__SUB__0;
                end
                OP__SLL:
                begin
                    state__n = STATE__SLL__0;
                end
                OP__SLT:
                begin
                    state__n = STATE__SLT__0;
                end
                OP__SLTU:
                begin
                    state__n = STATE__SLTU__0;
                end
                OP__XOR:
                begin
                    state__n = STATE__XOR__0;
                end
                OP__SRL:
                begin
                    state__n = STATE__SRL__0;
                end
                OP__SRA:
                begin
                    state__n = STATE__SRA__0;
                end
                OP__OR:
                begin
                    state__n = STATE__OR__0;
                end
                OP__AND:
                begin
                    state__n = STATE__AND__0;
                end
                OP__LUI:
                begin
                    state__n = STATE__LUI;
                end
                OP__ADDW:
                begin
                    state__n = STATE__ADDW__0;
                end
                OP__SUBW:
                begin
                    state__n = STATE__SUBW__0;
                end
                OP__SLLW:
                begin
                    state__n = STATE__SLLW__0;
                end
                OP__SRLW:
                begin
                    state__n = STATE__SRLW__0;
                end
                OP__SRAW:
                begin
                    state__n = STATE__SRAW__0;
                end
                OP__BEQ:
                begin
                    state__n = STATE__BEQ__0;
                end
                OP__BNE:
                begin
                    state__n = STATE__BNE__0;
                end
                OP__BLT:
                begin
                    state__n = STATE__BLT__0;
                end
                OP__BGE:
                begin
                    state__n = STATE__BGE__0;
                end
                OP__BLTU:
                begin
                    state__n = STATE__BLTU__0;
                end
                OP__BGEU:
                begin
                    state__n = STATE__BGEU__0;
                end
                OP__JALR:
                begin
                    state__n = STATE__JALR__0;
                end
                OP__JAL:
                begin
                    state__n = STATE__JAL__0;
                end
                OP__ECALL:
                begin
                    state__n = STATE__ECALL;
                end
                OP__EBREAK:
                begin
                    state__n = STATE__EBREAK;
                end
                OP__WFI:
                begin
                    state__n = STATE__WFI;
                end
                OP__CSRRW:
                begin
                    state__n = STATE__CSRRW__0;
                end
                OP__CSRRS:
                begin
                    state__n = STATE__CSRRS__0;
                end
                OP__CSRRC:
                begin
                    state__n = STATE__CSRRC__0;
                end
                OP__CSRRWI:
                begin
                    state__n = STATE__CSRRWI__0;
                end
                OP__CSRRSI:
                begin
                    state__n = STATE__CSRRSI__0;
                end
                OP__CSRRCI:
                begin
                    state__n = STATE__CSRRCI__0;
                end
                OP__MRET:
                begin
                    state__n = STATE__MRET__0;
                end
                default:
                begin
                    state__n = STATE__EXCEPTION__ILLEGAL_INSTRUCTION;
                end
            endcase
        end

        //==============================
        // STATE__ADD__0
        //==============================
        STATE__ADD__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__ADD__1;
        end

        //==============================
        // STATE__ADD__1
        //==============================
        STATE__ADD__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__ADD__2;
        end

        //==============================
        // STATE__ADD__2
        //==============================
        STATE__ADD__2:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SUB__0
        //==============================
        STATE__SUB__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SUB__1;
        end

        //==============================
        // STATE__SUB__1
        //==============================
        STATE__SUB__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SUB__2;
        end

        //==============================
        // STATE__SUB__2
        //==============================
        STATE__SUB__2:
        begin
            func = FUNC__SUB;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLL__0
        //==============================
        STATE__SLL__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SLL__1;
        end

        //==============================
        // STATE__SLL__1
        //==============================
        STATE__SLL__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SLL__2;
        end

        //==============================
        // STATE__SLL__2
        //==============================
        STATE__SLL__2:
        begin
            func = FUNC__SLL;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLT__0
        //==============================
        STATE__SLT__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SLT__1;
        end

        //==============================
        // STATE__SLT__1
        //==============================
        STATE__SLT__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SLT__2;
        end

        //==============================
        // STATE__SLT__2
        //==============================
        STATE__SLT__2:
        begin
            func = FUNC__SLT;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTU__0
        //==============================
        STATE__SLTU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SLTU__1;
        end

        //==============================
        // STATE__SLTU__1
        //==============================
        STATE__SLTU__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SLTU__2;
        end

        //==============================
        // STATE__SLTU__2
        //==============================
        STATE__SLTU__2:
        begin
            func = FUNC__SLTU;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__XOR__0
        //==============================
        STATE__XOR__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__XOR__1;
        end

        //==============================
        // STATE__XOR__1
        //==============================
        STATE__XOR__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__XOR__2;
        end

        //==============================
        // STATE__XOR__2
        //==============================
        STATE__XOR__2:
        begin
            func = FUNC__XOR;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRL__0
        //==============================
        STATE__SRL__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SRL__1;
        end

        //==============================
        // STATE__SRL__1
        //==============================
        STATE__SRL__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SRL__2;
        end

        //==============================
        // STATE__SRL__2
        //==============================
        STATE__SRL__2:
        begin
            func = FUNC__SRL;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRA__0
        //==============================
        STATE__SRA__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SRA__1;
        end

        //==============================
        // STATE__SRA__1
        //==============================
        STATE__SRA__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SRA__2;
        end

        //==============================
        // STATE__SRA__2
        //==============================
        STATE__SRA__2:
        begin
            func = FUNC__SRA;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__OR__0
        //==============================
        STATE__OR__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__OR__1;
        end

        //==============================
        // STATE__OR__1
        //==============================
        STATE__OR__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__OR__2;
        end

        //==============================
        // STATE__OR__2
        //==============================
        STATE__OR__2:
        begin
            func = FUNC__OR;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__AND__0
        //==============================
        STATE__AND__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__AND__1;
        end

        //==============================
        // STATE__AND__1
        //==============================
        STATE__AND__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__AND__2;
        end

        //==============================
        // STATE__AND__2
        //==============================
        STATE__AND__2:
        begin
            func = FUNC__AND;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDW__0
        //==============================
        STATE__ADDW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__ADDW__1;
        end

        //==============================
        // STATE__ADDW__1
        //==============================
        STATE__ADDW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__ADDW__2;
        end

        //==============================
        // STATE__ADDW__2
        //==============================
        STATE__ADDW__2:
        begin
            func = FUNC__ADDW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SUBW__0
        //==============================
        STATE__SUBW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SUBW__1;
        end

        //==============================
        // STATE__SUBW__1
        //==============================
        STATE__SUBW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SUBW__2;
        end

        //==============================
        // STATE__SUBW__2
        //==============================
        STATE__SUBW__2:
        begin
            func = FUNC__SUBW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLW__0
        //==============================
        STATE__SLLW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SLLW__1;
        end

        //==============================
        // STATE__SLLW__1
        //==============================
        STATE__SLLW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SLLW__2;
        end

        //==============================
        // STATE__SLLW__2
        //==============================
        STATE__SLLW__2:
        begin
            func = FUNC__SLLW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLW__0
        //==============================
        STATE__SRLW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SRLW__1;
        end

        //==============================
        // STATE__SRLW__1
        //==============================
        STATE__SRLW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SRLW__2;
        end

        //==============================
        // STATE__SRLW__2
        //==============================
        STATE__SRLW__2:
        begin
            func = FUNC__SRLW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAW__0
        //==============================
        STATE__SRAW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__SRAW__1;
        end

        //==============================
        // STATE__SRAW__1
        //==============================
        STATE__SRAW__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__SRAW__2;
        end

        //==============================
        // STATE__SRAW__2
        //==============================
        STATE__SRAW__2:
        begin
            func = FUNC__SRAW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDI__0
        //==============================
        STATE__ADDI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__ADDI__1;
        end

        //==============================
        // STATE__ADDI__1
        //==============================
        STATE__ADDI__1:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLI__0
        //==============================
        STATE__SLLI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SLLI__1;
        end

        //==============================
        // STATE__SLLI__1
        //==============================
        STATE__SLLI__1:
        begin
            func = FUNC__SLL;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTI__0
        //==============================
        STATE__SLTI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SLTI__1;
        end

        //==============================
        // STATE__SLTI__1
        //==============================
        STATE__SLTI__1:
        begin
            func = FUNC__SLT;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTIU__0
        //==============================
        STATE__SLTIU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SLTIU__1;
        end

        //==============================
        // STATE__SLTIU__1
        //==============================
        STATE__SLTIU__1:
        begin
            func = FUNC__SLTU;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__XORI__0
        //==============================
        STATE__XORI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__XORI__1;
        end

        //==============================
        // STATE__XORI__1
        //==============================
        STATE__XORI__1:
        begin
            func = FUNC__XOR;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLI__0
        //==============================
        STATE__SRLI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SRLI__1;
        end

        //==============================
        // STATE__SRLI__1
        //==============================
        STATE__SRLI__1:
        begin
            func = FUNC__SRL;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAI__0
        //==============================
        STATE__SRAI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SRAI__1;
        end

        //==============================
        // STATE__SRAI__1
        //==============================
        STATE__SRAI__1:
        begin
            func = FUNC__SRA;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ORI__0
        //==============================
        STATE__ORI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__ORI__1;
        end

        //==============================
        // STATE__ORI__1
        //==============================
        STATE__ORI__1:
        begin
            func = FUNC__OR;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ANDI__0
        //==============================
        STATE__ANDI__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__ANDI__1;
        end

        //==============================
        // STATE__ANDI__1
        //==============================
        STATE__ANDI__1:
        begin
            func = FUNC__AND;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDIW__0
        //==============================
        STATE__ADDIW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__ADDIW__1;
        end

        //==============================
        // STATE__ADDIW__1
        //==============================
        STATE__ADDIW__1:
        begin
            func = FUNC__ADDW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLIW__0
        //==============================
        STATE__SLLIW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SLLIW__1;
        end

        //==============================
        // STATE__SLLIW__1
        //==============================
        STATE__SLLIW__1:
        begin
            func = FUNC__SLLW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLIW__0
        //==============================
        STATE__SRLIW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SRLIW__1;
        end

        //==============================
        // STATE__SRLIW__1
        //==============================
        STATE__SRLIW__1:
        begin
            func = FUNC__SRLW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAIW__0
        //==============================
        STATE__SRAIW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SRAIW__1;
        end

        //==============================
        // STATE__SRAIW__1
        //==============================
        STATE__SRAIW__1:
        begin
            func = FUNC__SRAW;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LB__0
        //==============================
        STATE__LB__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LB__1;
        end

        //==============================
        // STATE__LB__1
        //==============================
        STATE__LB__1:
        begin
            func = FUNC__ADD;
            cs = 1'b1;
            addr = c;
            size = SIZE__BYTE;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {{56{rd_data[7]}}, rd_data[7:0]};
            state__n = (ready & ~resp) ? STATE__LB__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LB__1;
        end

        //==============================
        // STATE__LB__2
        //==============================
        STATE__LB__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LH__0
        //==============================
        STATE__LH__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LH__1;
        end

        //==============================
        // STATE__LH__1
        //==============================
        STATE__LH__1:
        begin
            func = FUNC__ADD;
            cs = 1'b1;
            addr = c;
            size = SIZE__HALF_WORD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {{48{rd_data[15]}}, rd_data[15:0]};
            state__n = (ready & ~resp) ? STATE__LH__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LH__1;
        end

        //==============================
        // STATE__LH__2
        //==============================
        STATE__LH__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LW__0
        //==============================
        STATE__LW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LW__1;
        end

        //==============================
        // STATE__LW__1
        //==============================
        STATE__LW__1:
        begin
            func = FUNC__ADD;
            cs = 1'b1;
            addr = c;
            size = SIZE__WORD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {{32{rd_data[31]}}, rd_data[31:0]};
            state__n = (ready & ~resp) ? STATE__LW__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LW__1;
        end

        //==============================
        // STATE__LW__2
        //==============================
        STATE__LW__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LD__0
        //==============================
        STATE__LD__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LD__1;
        end

        //==============================
        // STATE__LD__1
        //==============================
        STATE__LD__1:
        begin
            func = FUNC__ADD;
            cs = 1'b1;
            addr = c;
            size = SIZE__DOUBLE_WORD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = rd_data;
            state__n = (ready & ~resp) ? STATE__LD__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LD__1;
        end

        //==============================
        // STATE__LD__2
        //==============================
        STATE__LD__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LBU__0
        //==============================
        STATE__LBU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LBU__1;
        end

        //==============================
        // STATE__LBU__1
        //==============================
        STATE__LBU__1:
        begin
            func = FUNC__ADD;
            cs = 1'b1;
            addr = c;
            size = SIZE__BYTE;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {56'h0, rd_data[7:0]};
            state__n = (ready & ~resp) ? STATE__LBU__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LBU__1;
        end

        //==============================
        // STATE__LBU__2
        //==============================
        STATE__LBU__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LHU__0
        //==============================
        STATE__LHU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LHU__1;
        end

        //==============================
        // STATE__LHU__1
        //==============================
        STATE__LHU__1:
        begin
            func = FUNC__ADD;
            cs = 1'b1;
            addr = c;
            size = SIZE__HALF_WORD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {48'h0, rd_data[15:0]};
            state__n = (ready & ~resp) ? STATE__LHU__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LHU__1;
        end

        //==============================
        // STATE__LHU__2
        //==============================
        STATE__LHU__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LWU__0
        //==============================
        STATE__LWU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__LWU__1;
        end

        //==============================
        // STATE__LWU__1
        //==============================
        STATE__LWU__1:
        begin
            func = FUNC__ADD;
            cs = 1'b1;
            addr = c;
            size = SIZE__WORD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = ready & ~resp;
            rf__wr_data = {32'h0, rd_data[31:0]};
            state__n = (ready & ~resp) ? STATE__LWU__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__LOAD_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0 : STATE__LWU__1;
        end

        //==============================
        // STATE__LWU__2
        //==============================
        STATE__LWU__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SB__0
        //==============================
        STATE__SB__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SB__1;
        end

        //==============================
        // STATE__SB__1
        //==============================
        STATE__SB__1:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rs2;
            cs = 1'b1;
            we = 1'b1;
            addr = c;
            size = SIZE__BYTE;
            wr_data = rf__rd_data;
            state__n = (ready & ~resp) ? STATE__SB__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SB__1;
        end


        //==============================
        // STATE__SB__2
        //==============================
        STATE__SB__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SH__0
        //==============================
        STATE__SH__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SH__1;
        end

        //==============================
        // STATE__SH__1
        //==============================
        STATE__SH__1:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rs2;
            cs = 1'b1;
            we = 1'b1;
            addr = c;
            size = SIZE__HALF_WORD;
            wr_data = rf__rd_data;
            state__n = (ready & ~resp) ? STATE__SH__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SH__1;
        end

        //==============================
        // STATE__SH__2
        //==============================
        STATE__SH__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SW__0
        //==============================
        STATE__SW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SW__1;
        end

        //==============================
        // STATE__SW__1
        //==============================
        STATE__SW__1:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rs2;
            cs = 1'b1;
            we = 1'b1;
            addr = c;
            size = SIZE__WORD;
            wr_data = rf__rd_data;
            state__n = (ready & ~resp) ? STATE__SW__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SW__1;
        end

        //==============================
        // STATE__SW__2
        //==============================
        STATE__SW__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SD__0
        //==============================
        STATE__SD__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            b__n = imm;
            state__n = STATE__SD__1;
        end

        //==============================
        // STATE__SD__1
        //==============================
        STATE__SD__1:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rs2;
            cs = 1'b1;
            we = 1'b1;
            addr = c;
            size = SIZE__DOUBLE_WORD;
            wr_data = rf__rd_data;
            state__n = (ready & ~resp) ? STATE__SD__2 : (ready & resp & (rd_data == ERRORCODE__ACCESS_FAULT)) ? STATE__EXCEPTION__STORE_ACCESS_FAULT__0 : (ready & resp & (rd_data == ERRORCODE__MISALIGNED_ADDRESS)) ? STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0 : STATE__SD__1;
        end

        //==============================
        // STATE__SD__2
        //==============================
        STATE__SD__2:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__AUIPC__0
        //==============================
        STATE__AUIPC__0:
        begin
            a__n = pc;
            b__n = imm;
            state__n = STATE__AUIPC__1;
        end

        //==============================
        // STATE__AUIPC__1
        //==============================
        STATE__AUIPC__1:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JALR__0
        //==============================
        STATE__JALR__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;  
            b__n = imm;  
            //state__n = ((rf__rd_data[1:0] == 2'b00) && (imm[1:0] == 2'b10)) || ((rf__rd_data[1:0] == 2'b00) && (imm[1:0] == 2'b11)) || ((rf__rd_data[1:0] == 2'b01) && (imm[1:0] == 2'b01)) || ((rf__rd_data[1:0] == 2'b01) && (imm[1:0] == 2'b10)) ||((rf__rd_data[1:0] == 2'b10) && (imm[1:0] == 2'b00)) ||((rf__rd_data[1:0] == 2'b10) && (imm[1:0] == 2'b01)) || ((rf__rd_data[1:0] == 2'b11) && (imm[1:0] == 2'b00)) || ((rf__rd_data[1:0] == 2'b11) && (imm[1:0] == 2'b11)) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR : STATE__JALR__1;
            state__n = (rf__rd_data[1:0] + imm[1:0] == 2'b10) || (rf__rd_data[1:0] + imm[1:0] == 2'b11) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR : STATE__JALR__1;
        end

        //==============================
        // STATE__JALR__1
        //==============================
        STATE__JALR__1:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;     
            rf__wr_data = pc + 4;
            pc__n = {c[63:1], 1'b0};
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JAL__0
        //==============================
        STATE__JAL__0:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__JAL__1;
        end

        //==============================
        // STATE__JAL__1
        //==============================
        STATE__JAL__1:
        begin
            func = FUNC__ADD;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;     
            rf__wr_data = pc + 4;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BEQ__0
        //==============================
        STATE__BEQ__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BEQ__1;
        end

        //==============================
        // STATE__BEQ__1
        //==============================
        STATE__BEQ__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BEQ__2;
        end

        //==============================
        // STATE__BEQ__2
        //==============================
        STATE__BEQ__2:
        begin
            state__n = eq ? STATE__BEQ__4 : STATE__BEQ__3; 
        end

        //==============================
        // STATE__BEQ__3
        //==============================
        STATE__BEQ__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BEQ__4
        //==============================
        STATE__BEQ__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BEQ__5;
        end

        //==============================
        // STATE__BEQ__5
        //==============================
        STATE__BEQ__5:
        begin
            func = FUNC__ADD;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BNE__0
        //==============================
        STATE__BNE__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BNE__1;
        end

        //==============================
        // STATE__BNE__1
        //==============================
        STATE__BNE__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BNE__2;
        end

        //==============================
        // STATE__BNE__2
        //==============================
        STATE__BNE__2:
        begin
            state__n = ne ? STATE__BNE__4 : STATE__BNE__3; 
        end

        //==============================
        // STATE__BNE__3
        //==============================
        STATE__BNE__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BNE__4
        //==============================
        STATE__BNE__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BNE__5;
        end

        //==============================
        // STATE__BNE__5
        //==============================
        STATE__BNE__5:
        begin
            func = FUNC__ADD;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLT__0
        //==============================
        STATE__BLT__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BLT__1;
        end

        //==============================
        // STATE__BLT__1
        //==============================
        STATE__BLT__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BLT__2;
        end

        //==============================
        // STATE__BLT__2
        //==============================
        STATE__BLT__2:
        begin
            state__n = lt ? STATE__BLT__4 : STATE__BLT__3; 
        end

        //==============================
        // STATE__BLT__3
        //==============================
        STATE__BLT__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLT__4
        //==============================
        STATE__BLT__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BLT__5;
        end

        //==============================
        // STATE__BLT__5
        //==============================
        STATE__BLT__5:
        begin
            func = FUNC__ADD;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGE__0
        //==============================
        STATE__BGE__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BGE__1;
        end

        //==============================
        // STATE__BGE__1
        //==============================
        STATE__BGE__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BGE__2;
        end

        //==============================
        // STATE__BGE__2
        //==============================
        STATE__BGE__2:
        begin
            state__n = ge ? STATE__BGE__4 : STATE__BGE__3; 
        end

        //==============================
        // STATE__BGE__3
        //==============================
        STATE__BGE__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGE__4
        //==============================
        STATE__BGE__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BGE__5;
        end

        //==============================
        // STATE__BGE__5
        //==============================
        STATE__BGE__5:
        begin
            func = FUNC__ADD;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLTU__0
        //==============================
        STATE__BLTU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BLTU__1;
        end

        //==============================
        // STATE__BLTU__1
        //==============================
        STATE__BLTU__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BLTU__2;
        end

        //==============================
        // STATE__BLTU__2
        //==============================
        STATE__BLTU__2:
        begin
            state__n = ltu ? STATE__BLTU__4 : STATE__BLTU__3; 
        end

        //==============================
        // STATE__BLTU__3
        //==============================
        STATE__BLTU__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLTU__4
        //==============================
        STATE__BLTU__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BLTU__5;
        end

        //==============================
        // STATE__BLTU__5
        //==============================
        STATE__BLTU__5:
        begin
            func = FUNC__ADD;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGEU__0
        //==============================
        STATE__BGEU__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            state__n = STATE__BGEU__1;
        end

        //==============================
        // STATE__BGEU__1
        //==============================
        STATE__BGEU__1:
        begin
            rf__cs = 1'b1;
            rf__addr = rs2;
            b__n = rf__rd_data;
            state__n = STATE__BGEU__2;
        end

        //==============================
        // STATE__BGEU__2
        //==============================
        STATE__BGEU__2:
        begin
            state__n = geu ? STATE__BGEU__4 : STATE__BGEU__3; 
        end

        //==============================
        // STATE__BGEU__3
        //==============================
        STATE__BGEU__3:
        begin
            pc__n = pc + 4;  
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGEU__4
        //==============================
        STATE__BGEU__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0 : STATE__BGEU__5;
        end

        //==============================
        // STATE__BGEU__5
        //==============================
        STATE__BGEU__5:
        begin
            func = FUNC__ADD;
            pc__n = c;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ECALL
        //==============================
        STATE__ECALL:
        begin
            csr__cs = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__ENVIRONMENT_CALL_FROM_M_MODE;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EBREAK
        //==============================
        STATE__EBREAK:
        begin
            csr__cs = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__we = 1'b1;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__BREAKPOINT;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__WFI
        //==============================
        STATE__WFI:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FENCE
        //==============================
        STATE__FENCE:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FENCE_I
        //==============================
        STATE__FENCE_I:
        begin
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LUI
        //==============================
        STATE__LUI:
        begin
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = imm;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRW__0
        //==============================
        STATE__CSRRW__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : (rd == 5'h0) ? STATE__CSRRW__2 : STATE__CSRRW__1; 
        end

        //==============================
        // STATE__CSRRW__1
        //==============================
        STATE__CSRRW__1:
        begin
            func = FUNC__NULL_B;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            state__n = STATE__CSRRW__2;
        end

        //==============================
        // STATE__CSRRW__2
        //==============================
        STATE__CSRRW__2:
        begin
            func = FUNC__NULL_A;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRS__0
        //==============================
        STATE__CSRRS__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (rs1 == 5'h0) ? STATE__CSRRS__2 : (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : STATE__CSRRS__1; 
        end

        //==============================
        // STATE__CSRRS__1
        //==============================
        STATE__CSRRS__1:
        begin
            func = FUNC__OR;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__CSRRS__2;
        end

        //==============================
        // STATE__CSRRS__2
        //==============================
        STATE__CSRRS__2:
        begin
            func = FUNC__NULL_B;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRC__0
        //==============================
        STATE__CSRRC__0:
        begin
            rf__cs = 1'b1;
            rf__addr = rs1;
            a__n = rf__rd_data;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (rs1 == 5'h0) ? STATE__CSRRC__2 : (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : STATE__CSRRC__1; 
        end

        //==============================
        // STATE__CSRRC__1
        //==============================
        STATE__CSRRC__1:
        begin
            func = FUNC__CLR;
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = imm[11:0];
            csr__wr_data = c;
            state__n = STATE__CSRRC__2;
        end

        //==============================
        // STATE__CSRRC__2
        //==============================
        STATE__CSRRC__2:
        begin
            func = FUNC__NULL_B;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRWI__0
        //==============================
        STATE__CSRRWI__0:
        begin
            a__n = uimm;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : (rd == 5'h0) ? STATE__CSRRWI__2 : STATE__CSRRWI__1; 
        end

        //==============================
        // STATE__CSRRWI__1
        //==============================
        STATE__CSRRWI__1:
        begin
            func = FUNC__NULL_B;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            state__n = STATE__CSRRWI__2;
        end

        //==============================
        // STATE__CSRRWI__2
        //==============================
        STATE__CSRRWI__2:
        begin
            func = FUNC__NULL_A;
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = imm[11:0];
            csr__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRSI__0
        //==============================
        STATE__CSRRSI__0:
        begin
            a__n = uimm;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (uimm[4:0] == 5'h0) ? STATE__CSRRSI__2 : (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : STATE__CSRRSI__1; 
        end

        //==============================
        // STATE__CSRRSI__1
        //==============================
        STATE__CSRRSI__1:
        begin
            func = FUNC__OR;
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = imm[11:0];
            csr__wr_data = c;
            state__n = STATE__CSRRSI__2;
        end

        //==============================
        // STATE__CSRRSI__2
        //==============================
        STATE__CSRRSI__2:
        begin
            func = FUNC__NULL_B;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRCI__0
        //==============================
        STATE__CSRRCI__0:
        begin
            a__n = uimm;
            csr__cs = 1'b1;
            csr__addr = imm[11:0];
            b__n = csr__rd_data;
            state__n = (uimm[4:0] == 5'h0) ? STATE__CSRRCI__2 : (imm[11:10] == 2'h3) ? STATE__EXCEPTION__ILLEGAL_INSTRUCTION : STATE__CSRRCI__1; 
        end

        //==============================
        // STATE__CSRRCI__1
        //==============================
        STATE__CSRRCI__1:
        begin
            func = FUNC__CLR;
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = imm[11:0];
            csr__wr_data = c;
            state__n = STATE__CSRRCI__2;
        end

        //==============================
        // STATE__CSRRCI__2
        //==============================
        STATE__CSRRCI__2:
        begin
            func = FUNC__NULL_B;
            rf__cs = 1'b1;
            rf__addr = rd;
            rf__we = 1'b1;
            rf__wr_data = c;
            pc__n = pc + 4;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__MRET__0
        //==============================
        STATE__MRET__0:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MSTATUS;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MSTATUS__MIE__FIELD] <= csr__rd_data[CSR__MSTATUS__MPIE__FIELD];
            csr__wr_data[CSR__MSTATUS__MPIE__FIELD] <= CSR__MSTATUS__MIE__ENABLED;
            state__n = STATE__MRET__1;
        end

        //==============================
        // STATE__MRET__1
        //==============================
        STATE__MRET__1:
        begin
            csr__cs = 1'b1;
            csr__addr = CSR__MEPC;
            pc__n = csr__rd_data;
            instret = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__EXCEPTION__ILLEGAL_INSTRUCTION
        //==============================
        STATE__EXCEPTION__ILLEGAL_INSTRUCTION:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__ILLEGAL_INSTRUCTION;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__0:
        begin
            func = FUNC__ADD; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MTVAL;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MTVAL__MTVAL__FIELD] = pc;
            state__n = STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ACCESS_FAULT__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__INSTRUCTION_ACCESS_FAULT;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0:
        begin
            func = FUNC__ADD; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MTVAL;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MTVAL__MTVAL__FIELD] = c;
            state__n = STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__0__JALR:
        begin
            func = FUNC__ADD; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MTVAL;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MTVAL__MTVAL__FIELD] = {c[63:1], 1'b0};
            state__n = STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__INSTRUCTION_ADDRESS_MISALIGNED__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__INSTRUCTION_ADDRESS_MISALIGNED;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ACCESS_FAULT__0
        //==============================
        STATE__EXCEPTION__LOAD_ACCESS_FAULT__0:
        begin
            func = FUNC__ADD; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MTVAL;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MTVAL__MTVAL__FIELD] = c;
            state__n = STATE__EXCEPTION__LOAD_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__LOAD_ACCESS_FAULT__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__LOAD_ACCESS_FAULT;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0
        //==============================
        STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__0:
        begin
            func = FUNC__ADD; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MTVAL;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MTVAL__MTVAL__FIELD] = c;
            state__n = STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__LOAD_ADDRESS_MISALIGNED__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__LOAD_ADDRESS_MISALIGNED;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ACCESS_FAULT__0
        //==============================
        STATE__EXCEPTION__STORE_ACCESS_FAULT__0:
        begin
            func = FUNC__ADD; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MTVAL;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MTVAL__MTVAL__FIELD] = c;
            state__n = STATE__EXCEPTION__STORE_ACCESS_FAULT__1;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ACCESS_FAULT__1
        //==============================
        STATE__EXCEPTION__STORE_ACCESS_FAULT__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__STORE_ACCESS_FAULT;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0
        //==============================
        STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__0:
        begin
            func = FUNC__ADD; 
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MTVAL;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MTVAL__MTVAL__FIELD] = c;
            state__n = STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1;
        end

        //==============================
        // STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1
        //==============================
        STATE__EXCEPTION__STORE_ADDRESS_MISALIGNED__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__STORE_ADDRESS_MISALIGNED;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__INTERRUPT__SOFTWARE
        //==============================
        STATE__INTERRUPT__SOFTWARE:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__MACHINE_SOFTWARE_INTERRUPT;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__INTERRUPT__TIMER
        //==============================
        STATE__INTERRUPT__TIMER:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__MACHINE_TIMER_INTERRUPT;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__INTERRUPT__EXTERNAL
        //==============================
        STATE__INTERRUPT__EXTERNAL:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MCAUSE;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXCEPTION_CODE__MACHINE_EXTERNAL_INTERRUPT;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__INTERRUPT;
            state__n = STATE__TRAP__0;
        end


        //==============================
        // STATE__TRAP__0
        //==============================
        STATE__TRAP__0:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MSTATUS;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
            csr__wr_data[CSR__MSTATUS__MPIE__FIELD] <= csr__rd_data[CSR__MSTATUS__MIE__FIELD];
            state__n = STATE__TRAP__1;
        end

        //==============================
        // STATE__TRAP__1
        //==============================
        STATE__TRAP__1:
        begin
            csr__cs = 1'b1;
            csr__we = 1'b1;
            csr__addr = CSR__MEPC;
            csr__wr_data = csr__rd_data;
            csr__wr_data[CSR__MEPC__MEPC__FIELD] = pc;
            state__n = STATE__TRAP__2;
        end

        //==============================
        // STATE__TRAP__2
        //==============================
        STATE__TRAP__2:
        begin
            csr__cs = 1'b1;
            csr__addr = CSR__MTVEC;
            pc__n = {csr__rd_data[CSR__MTVEC__BASE__FIELD], 2'h0}; 
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FATAL
        //==============================
        STATE__FATAL:
        begin
            state__n = STATE__FATAL;
        end
        
    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(8), .RESET_VALUE(STATE__RESET)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

//==============================
// d_flip_flop__pc
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(PC_RESET_VALUE)) d_flip_flop__pc
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(pc__n),
    .q(pc)
);

//==============================
// d_flip_flop__ir
//==============================
d_flip_flop #(.WIDTH(32)) d_flip_flop__ir
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(ir__n),
    .q(ir)
);

//==============================
// d_flip_flop__a
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__a
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(a__n),
    .q(a)
);

//==============================
// d_flip_flop__b
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__b
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(b__n),
    .q(b)
);


endmodule

