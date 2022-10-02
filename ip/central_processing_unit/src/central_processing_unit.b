//==============================================
// central_processing_unit
//==============================================
module central_processing_unit
(
    input clk,
    input rst,
    output logic cpu_to_l1__valid,
    input cpu_to_l1__ready,
    output logic cpu_to_l1__we,
    output logic [63:0] cpu_to_l1__addr,
    output logic [2:0] cpu_to_l1__dtype,
    output logic [63:0] cpu_to_l1__data,
    input l1_to_cpu__valid,
    output logic l1_to_cpu__ready,
    input [63:0] l1_to_cpu__data
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


// Register File.
logic we;
logic [4:0] addr;
logic [63:0] rd_data;
logic [63:0] wr_data;

// ALU.
logic [3:0] func;
logic [63:0] a;
logic [63:0] a__n;
logic [63:0] b;
logic [63:0] b__n;
logic [63:0] c;

// Comparator.
logic eq;
logic ne;
logic lt;
logic ge;
logic ltu;
logic geu;

// Control and Status Registers
logic csr__we;
logic [11:0] csr__addr;
logic [63:0] csr__wr_data;
logic [63:0] csr__rd_data;

// FSM
logic [5:0] state;
logic [5:0] state__n;


//==============================
// decoder__0
//==============================
decoder decoder__0
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
// register_file__0
//==============================
register_file register_file__0
(
    .clk(clk),
    .rst(rst),
    .we(we),
    .addr(addr),
    .rd_data(rd_data),
    .wr_data(wr_data)
);

//==============================
// arithmetic_logic_unit__0
//==============================
arithmetic_logic_unit arithmetic_logic_unit__0
(
    .clk(clk),
    .rst(rst),
    .func(func),
    .a(a),
    .b(b),
    .c(c)
);

//==============================
// comparator__0
//==============================
comparator comparator__0
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
// control_and_status_registers__0
//==============================
control_and_status_registers control_and_status_registers__0
(
    .clk(clk),
    .rst(rst),
    .we(csr__we),
    .addr(csr__addr),
    .rd_data(csr__rd_data),
    .wr_data(csr__wr_data)
);



//==============================================
// Finite State Machine
//==============================================
PYTHON(
states = [
    'STATE__RESET', 
    'STATE__IF__0', 
    'STATE__IF__1', 
    'STATE__ID', 
    'STATE__LOAD__0', 
    'STATE__LOAD__1', 
    'STATE__LOAD__2', 
    'STATE__STORE__0', 
    'STATE__STORE__1', 
    'STATE__STORE__2', 
    'STATE__ALU__0', 
    'STATE__ALU__1', 
    'STATE__ALU__2', 
    'STATE__ALUI__0', 
    'STATE__ALUI__1', 
    'STATE__AUIPC', 
    'STATE__JALR__0', 
    'STATE__JALR__1', 
    'STATE__JALR__2', 
    'STATE__JAL__0', 
    'STATE__JAL__1', 
    'STATE__BRANCH__0', 
    'STATE__BRANCH__1', 
    'STATE__BRANCH__2', 
    'STATE__BRANCH__3', 
    'STATE__ECALL', 
    'STATE__EBREAK', 
    'STATE__FENCE', 
    'STATE__FENCE_I', 
    'STATE__LUI',
    'STATE__PC_PLUS_FOUR'
]

states = [
    'STATE__RESET',
    'STATE__FETCH__0',
    'STATE__DECODE',
    'STATE__ADD__0',
    'STATE__ADD__1',
    'STATE__ADD__2',
    'STATE__ADDI__0',
    'STATE__ADDI__1',
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
]


for i, state in enumerate(states):
    print(f"localparam {state} = 6'h{i:x};") 
)


always_comb begin
    state__n = state;

    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__FETCH__0;
        end
        
        //==============================
        // STATE__FETCH
        //==============================
        STATE__FETCH:
        begin
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = pc;
            cpu_to_l1__dtype = DTYPE__W;
            
            if (mstatus[CSR__MSTATUS__MIE__FIELD] && mip[CSR__MIP__MEIP__FIELD] && mie[CSR__MIE__MEIE__FIELD]) begin
                state__n = STATE__INTERRUPT__EXTERNAL;
            end
            else if (mstatus[CSR__MSTATUS__MIE__FIELD] && mip[CSR__MIP__MSIP__FIELD] && mie[CSR__MIE__MSIE__FIELD]) begin
                state__n = STATE__INTERRUPT__SOFTWARE;
            end
            else if (mstatus[CSR__MSTATUS__MIE__FIELD] && mip[CSR__MIP__MTIP__FIELD] && mie[CSR__MIE__MTIE__FIELD]) begin
                state__n = STATE__INTERRUPT__TIMER;
            end
            else begin
                if (cpu_to_l1__hit) begin
                    ir__n = cpu_to_l1__rd_data[31:0];
                    state__n = STATE__DECODE;
                end
            end
        end

        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            case (op)
                OP__LB:
                begin
                    state__n = STATE__;
                end
                OP__LH:
                begin
                    state__n = STATE__;
                end
                OP__LW:
                begin
                    state__n = STATE__;
                end
                OP__LD:
                begin
                    state__n = STATE__;
                end
                OP__LBU:
                begin
                    state__n = STATE__;
                end
                OP__LHU:
                begin
                    state__n = STATE__;
                end
                OP__LWU:
                begin
                    state__n = STATE__;
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
                    state__n = STATE__;
                end
                OP__SLLIW:
                begin
                    state__n = STATE__;
                end
                OP__SRLIW:
                begin
                    state__n = STATE__;
                end
                OP__SRAIW:
                begin
                    state__n = STATE__;
                end
                OP__SB:
                begin
                    state__n = STATE__;
                end
                OP__SH:
                begin
                    state__n = STATE__;
                end
                OP__SW:
                begin
                    state__n = STATE__;
                end
                OP__SD:
                begin
                    state__n = STATE__;
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
                OP__MRET:
                begin
                    state__n = STATE__;
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
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__ADD__1;
        end

        //==============================
        // STATE__ADD__1
        //==============================
        STATE__ADD__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__ADD__2;
        end

        //==============================
        // STATE__ADD__2
        //==============================
        STATE__ADD__2:
        begin
            func = FUNC__ADD;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SUB__0
        //==============================
        STATE__SUB__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SUB__1;
        end

        //==============================
        // STATE__SUB__1
        //==============================
        STATE__SUB__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SUB__2;
        end

        //==============================
        // STATE__SUB__2
        //==============================
        STATE__SUB__2:
        begin
            func = FUNC__SUB;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLL__0
        //==============================
        STATE__SLL__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SLL__1;
        end

        //==============================
        // STATE__SLL__1
        //==============================
        STATE__SLL__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SLL__2;
        end

        //==============================
        // STATE__SLL__2
        //==============================
        STATE__SLL__2:
        begin
            func = FUNC__SLL;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLT__0
        //==============================
        STATE__SLT__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SLT__1;
        end

        //==============================
        // STATE__SLT__1
        //==============================
        STATE__SLT__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SLT__2;
        end

        //==============================
        // STATE__SLT__2
        //==============================
        STATE__SLT__2:
        begin
            func = FUNC__SLT;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTU__0
        //==============================
        STATE__SLTU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SLTU__1;
        end

        //==============================
        // STATE__SLTU__1
        //==============================
        STATE__SLTU__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SLTU__2;
        end

        //==============================
        // STATE__SLTU__2
        //==============================
        STATE__SLTU__2:
        begin
            func = FUNC__SLTU;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__XOR__0
        //==============================
        STATE__XOR__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__XOR__1;
        end

        //==============================
        // STATE__XOR__1
        //==============================
        STATE__XOR__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__XOR__2;
        end

        //==============================
        // STATE__XOR__2
        //==============================
        STATE__XOR__2:
        begin
            func = FUNC__XOR;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRL__0
        //==============================
        STATE__SRL__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SRL__1;
        end

        //==============================
        // STATE__SRL__1
        //==============================
        STATE__SRL__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SRL__2;
        end

        //==============================
        // STATE__SRL__2
        //==============================
        STATE__SRL__2:
        begin
            func = FUNC__SRL;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRA__0
        //==============================
        STATE__SRA__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SRA__1;
        end

        //==============================
        // STATE__SRA__1
        //==============================
        STATE__SRA__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SRA__2;
        end

        //==============================
        // STATE__SRA__2
        //==============================
        STATE__SRA__2:
        begin
            func = FUNC__SRA;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__OR__0
        //==============================
        STATE__OR__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__OR__1;
        end

        //==============================
        // STATE__OR__1
        //==============================
        STATE__OR__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__OR__2;
        end

        //==============================
        // STATE__OR__2
        //==============================
        STATE__OR__2:
        begin
            func = FUNC__OR;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__AND__0
        //==============================
        STATE__AND__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__AND__1;
        end

        //==============================
        // STATE__AND__1
        //==============================
        STATE__AND__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__AND__2;
        end

        //==============================
        // STATE__AND__2
        //==============================
        STATE__AND__2:
        begin
            func = FUNC__AND;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDW__0
        //==============================
        STATE__ADDW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__ADDW__1;
        end

        //==============================
        // STATE__ADDW__1
        //==============================
        STATE__ADDW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__ADDW__2;
        end

        //==============================
        // STATE__ADDW__2
        //==============================
        STATE__ADDW__2:
        begin
            func = FUNC__ADDW;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SUBW__0
        //==============================
        STATE__SUBW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SUBW__1;
        end

        //==============================
        // STATE__SUBW__1
        //==============================
        STATE__SUBW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SUBW__2;
        end

        //==============================
        // STATE__SUBW__2
        //==============================
        STATE__SUBW__2:
        begin
            func = FUNC__SUBW;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLW__0
        //==============================
        STATE__SLLW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SLLW__1;
        end

        //==============================
        // STATE__SLLW__1
        //==============================
        STATE__SLLW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SLLW__2;
        end

        //==============================
        // STATE__SLLW__2
        //==============================
        STATE__SLLW__2:
        begin
            func = FUNC__SLLW;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLW__0
        //==============================
        STATE__SRLW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SRLW__1;
        end

        //==============================
        // STATE__SRLW__1
        //==============================
        STATE__SRLW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SRLW__2;
        end

        //==============================
        // STATE__SRLW__2
        //==============================
        STATE__SRLW__2:
        begin
            func = FUNC__SRLW;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAW__0
        //==============================
        STATE__SRAW__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__SRAW__1;
        end

        //==============================
        // STATE__SRAW__1
        //==============================
        STATE__SRAW__1:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__SRAW__2;
        end

        //==============================
        // STATE__SRAW__2
        //==============================
        STATE__SRAW__2:
        begin
            func = FUNC__SRAW;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ADDI__0
        //==============================
        STATE__ADDI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__ADDI__1;
        end

        //==============================
        // STATE__ADDI__1
        //==============================
        STATE__ADDI__1:
        begin
            func = FUNC__ADD;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLLI__0
        //==============================
        STATE__SLLI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SLLI__1;
        end

        //==============================
        // STATE__SLLI__1
        //==============================
        STATE__SLLI__1:
        begin
            func = FUNC__SLL;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTI__0
        //==============================
        STATE__SLTI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SLTI__1;
        end

        //==============================
        // STATE__SLTI__1
        //==============================
        STATE__SLTI__1:
        begin
            func = FUNC__SLT;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SLTIU__0
        //==============================
        STATE__SLTIU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SLTIU__1;
        end

        //==============================
        // STATE__SLTIU__1
        //==============================
        STATE__SLTIU__1:
        begin
            func = FUNC__SLTU;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__XORI__0
        //==============================
        STATE__XORI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__XORI__1;
        end

        //==============================
        // STATE__XORI__1
        //==============================
        STATE__XORI__1:
        begin
            func = FUNC__XOR;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRLI__0
        //==============================
        STATE__SRLI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SRLI__1;
        end

        //==============================
        // STATE__SRLI__1
        //==============================
        STATE__SRLI__1:
        begin
            func = FUNC__SRL;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SRAI__0
        //==============================
        STATE__SRAI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SRAI__1;
        end

        //==============================
        // STATE__SRAI__1
        //==============================
        STATE__SRAI__1:
        begin
            func = FUNC__SRA;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ORI__0
        //==============================
        STATE__ORI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__ORI__1;
        end

        //==============================
        // STATE__ORI__1
        //==============================
        STATE__ORI__1:
        begin
            func = FUNC__OR;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ANDI__0
        //==============================
        STATE__ANDI__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__ANDI__1;
        end

        //==============================
        // STATE__ANDI__1
        //==============================
        STATE__ANDI__1:
        begin
            func = FUNC__AND;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LB__0
        //==============================
        STATE__LB__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LOAD__1;
        end

        //==============================
        // STATE__LB__1
        //==============================
        STATE__LB__1:
        begin
            func = FUNC__ADD;
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = c;
            cpu_to_l1__dtype = DTYPE__B;
            state__n = STATE__LB__2;
        end

        //==============================
        // STATE__LB__2
        //==============================
        STATE__LB__2:
        begin
            if (cpu_to_l1__done) begin
                state__n = STATE__LB__3;
            end
        end

        //==============================
        // STATE__LB__3
        //==============================
        STATE__LB__3:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = cpu_to_l1__rd_data;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__SB__0
        //==============================
        STATE__SB__0:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__SB__1;
        end

        //==============================
        // STATE__SB__1
        //==============================
        STATE__SB__1:
        begin
            func = FUNC__ADD;
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__we = 1'b1;
            cpu_to_l1__addr = c;
            cpu_to_l1__dtype = DTYPE__B;
            state__n = STATE__SB__2;
        end

        //==============================
        // STATE__SB__3
        //==============================
        STATE__SB__2:
        begin
            addr = rs1;
            cpu_to_l1__wr_data = rd_data;
            state__n = STATE__SB__2;
        end

        //==============================
        // STATE__SB__3
        //==============================
        STATE__SB__3:
        begin
            if (cpu_to_l1__done) begin
                state__n = STATE__FETCH__0;
            end
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JALR__0
        //==============================
        STATE__JALR__0:
        begin
            addr = rs1;
            a__n = rd_data;  
            b__n = imm;  
            state__n = (rd_data[1:0] + imm[1:0] == 2'b10) || (rd_data[1:0] + imm[1:0] == 2'b11) ? STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH : STATE__JALR__1;
        end

        //==============================
        // STATE__JALR__1
        //==============================
        STATE__JALR__1:
        begin
            func = FUNC__ADD;
            addr = rd;
            we = 1'b1;     
            wr_data = pc + 4;
            pc__n = {c[63:1], 1'b0};
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JAL__0
        //==============================
        STATE__JAL__0:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH : STATE__JAL__1;
        end

        //==============================
        // STATE__JAL__1
        //==============================
        STATE__JAL__1:
        begin
            func__ADD;
            addr = rd;
            we = 1'b1;     
            wr_data = pc + 4;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BEQ__0
        //==============================
        STATE__BEQ__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BEQ__1;
        end

        //==============================
        // STATE__BEQ__1
        //==============================
        STATE__BEQ__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BEQ__4
        //==============================
        STATE__BEQ__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH : STATE__BEQ__5;
        end

        //==============================
        // STATE__BEQ__5
        //==============================
        STATE__BEQ__5:
        begin
            func__ADD;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BNE__0
        //==============================
        STATE__BNE__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BNE__1;
        end

        //==============================
        // STATE__BNE__1
        //==============================
        STATE__BNE__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BNE__4
        //==============================
        STATE__BNE__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH : STATE__BNE__5;
        end

        //==============================
        // STATE__BNE__5
        //==============================
        STATE__BNE__5:
        begin
            func__ADD;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLT__0
        //==============================
        STATE__BLT__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BLT__1;
        end

        //==============================
        // STATE__BLT__1
        //==============================
        STATE__BLT__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLT__4
        //==============================
        STATE__BLT__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH : STATE__BLT__5;
        end

        //==============================
        // STATE__BLT__5
        //==============================
        STATE__BLT__5:
        begin
            func__ADD;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGE__0
        //==============================
        STATE__BGE__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BGE__1;
        end

        //==============================
        // STATE__BGE__1
        //==============================
        STATE__BGE__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGE__4
        //==============================
        STATE__BGE__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH : STATE__BGE__5;
        end

        //==============================
        // STATE__BGE__5
        //==============================
        STATE__BGE__5:
        begin
            func__ADD;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLTU__0
        //==============================
        STATE__BLTU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BLTU__1;
        end

        //==============================
        // STATE__BLTU__1
        //==============================
        STATE__BLTU__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BLTU__4
        //==============================
        STATE__BLTU__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH : STATE__BLTU__5;
        end

        //==============================
        // STATE__BLTU__5
        //==============================
        STATE__BLTU__5:
        begin
            func__ADD;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGEU__0
        //==============================
        STATE__BGEU__0:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__BGEU__1;
        end

        //==============================
        // STATE__BGEU__1
        //==============================
        STATE__BGEU__1:
        begin
            addr = rs2;
            b__n = rd_data;
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
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BGEU__4
        //==============================
        STATE__BGEU__4:
        begin
            a__n = pc;
            b__n = imm;
            state__n = (imm[1:0] != 2'h0) ? STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH : STATE__BGEU__5;
        end

        //==============================
        // STATE__BGEU__5
        //==============================
        STATE__BGEU__5:
        begin
            func__ADD;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end


        //==============================
        // STATE__ECALL
        //==============================
        STATE__ECALL:
        begin
            state__n = STATE__ECALL;
        end

        //==============================
        // STATE__EBREAK
        //==============================
        STATE__EBREAK:
        begin
            state__n = STATE__EBREAK;
        end

        //==============================
        // STATE__FENCE
        //==============================
        STATE__FENCE:
        begin
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__FENCE_I
        //==============================
        STATE__FENCE_I:
        begin
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__LUI
        //==============================
        STATE__LUI:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = imm;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRW__0
        //==============================
        STATE__CSRRW__0:
        begin
            addr = rs1;
            a__n = rd_data;
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            state__n = STATE__CSRRW__2;
        end

        //==============================
        // STATE__CSRRW__2
        //==============================
        STATE__CSRRW__2:
        begin
            func = FUNC__NULL_A;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRS__0
        //==============================
        STATE__CSRRS__0:
        begin
            addr = rs1;
            a__n = rd_data;
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRC__0
        //==============================
        STATE__CSRRC__0:
        begin
            addr = rs1;
            a__n = rd_data;
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
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__CSRRC__2;
        end

        //==============================
        // STATE__CSRRC__2
        //==============================
        STATE__CSRRC__2:
        begin
            func = FUNC__NULL_B;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRWI__0
        //==============================
        STATE__CSRRWI__0:
        begin
            a__n = uimm;
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
            addr = rd;
            we = 1'b1;
            wr_data = c;
            state__n = STATE__CSRRWI__2;
        end

        //==============================
        // STATE__CSRRWI__2
        //==============================
        STATE__CSRRWI__2:
        begin
            func = FUNC__NULL_A;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRSI__0
        //==============================
        STATE__CSRRSI__0:
        begin
            a__n = uimm;
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
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__CSRRSI__2;
        end

        //==============================
        // STATE__CSRRSI__2
        //==============================
        STATE__CSRRSI__2:
        begin
            func = FUNC__NULL_B;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRCI__0
        //==============================
        STATE__CSRRCI__0:
        begin
            a__n = uimm;
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
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__CSRRCI__2;
        end

        //==============================
        // STATE__CSRRCI__2
        //==============================
        STATE__CSRRCI__2:
        begin
            func = FUNC__NULL_B;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__INTERRUPT__EXTERNAL
        //==============================
        STATE__INTERRUPT__EXTERNAL:
        begin
            csr__addr = CSR__MCAUSE;
            csr__we = 1'b1;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXEPTION_CODE__ILLEGAL_INSTRUCTION;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end


        //==============================
        // STATE__EXCEPTION__ILLEGAL_INSTRUCTION
        //==============================
        STATE__EXCEPTION__ILLEGAL_INSTRUCTION:
        begin
            csr__addr = CSR__MCAUSE;
            csr__we = 1'b1;
            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXEPTION_CODE__ILLEGAL_INSTRUCTION;
            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
            state__n = STATE__TRAP__0;
        end

        //==============================
        // STATE__TRAP__0
        //==============================
        STATE__TRAP__0:
        begin
            csr__addr = CSR__MEPC;
            csr__we = 1'b1;
            csr__wr_data[CSR__MEPC__MEPC__FIELD] = pc;
            state__n = STATE__TRAP__1;
        end

        //==============================
        // STATE__TRAP__1
        //==============================
        STATE__TRAP__1:
        begin
            csr__addr = CSR__MSTATUS;
            csr__we = 1'b1;
            csr__wr_data[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
            csr__wr_data[CSR__MSTATUS__MPIE__FIELD] <= csr__rd_data[CSR__MSTATUS__MIE__FIELD];
            state__n = STATE__TRAP__2;
        end

        //==============================
        // STATE__TRAP__2
        //==============================
        STATE__TRAP__2:
        begin
            csr__addr = CSR__MTVEC;
            pc__n = csr__rd_data; 
            state__n = STATE__FETCH__0;
        end


    endcase
end



always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state__n;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        pc <= 64'h80000000;
    end
    else begin
        pc <= pc__n;
    end
end

always_ff @(posedge clk) begin
    ir <= ir__n;
end

always_ff @(posedge clk) begin
    a <= a__n;
end

always_ff @(posedge clk) begin
    b <= b__n;
end

endmodule



//always_comb begin
//state__n = state;
//
//case (state)
//    //==============================
//    // STATE__RESET
//    //==============================
//    STATE__RESET:
//    begin
//        state__n = STATE__FETCH__0;
//    end
//    
//    //==============================
//    // STATE__FETCH
//    //==============================
//    STATE__FETCH:
//    begin
//        cpu_to_l1__valid = 1'b1;
//        cpu_to_l1__addr = pc;
//        cpu_to_l1__dtype = DTYPE__W;
//        
//        if (mstatus[CSR__MSTATUS__MIE__FIELD] && mip[CSR__MIP__MEIP__FIELD] && mie[CSR__MIE__MEIE__FIELD]) begin
//            state__n = STATE__INTERRUPT__EXTERNAL;
//        end
//        else if (mstatus[CSR__MSTATUS__MIE__FIELD] && mip[CSR__MIP__MSIP__FIELD] && mie[CSR__MIE__MSIE__FIELD]) begin
//            state__n = STATE__INTERRUPT__SOFTWARE;
//        end
//        else if (mstatus[CSR__MSTATUS__MIE__FIELD] && mip[CSR__MIP__MTIP__FIELD] && mie[CSR__MIE__MTIE__FIELD]) begin
//            state__n = STATE__INTERRUPT__TIMER;
//        end
//        else begin
//            if (cpu_to_l1__hit) begin
//                ir__n = cpu_to_l1__rd_data[31:0];
//                state__n = STATE__DECODE;
//            end
//        end
//    end
//
//    //==============================
//    // STATE__DECODE
//    //==============================
//    STATE__DECODE:
//    begin
//        case (op)
//            OP__LB:
//            begin
//                state__n = STATE__LOAD__0;
//            end
//            OP__LH:
//            begin
//                state__n = STATE__LOAD__0;
//            end
//            OP__LW:
//            begin
//                state__n = STATE__LOAD__0;
//            end
//            OP__LD:
//            begin
//                state__n = STATE__LOAD__0;
//            end
//            OP__LBU:
//            begin
//                state__n = STATE__LOAD__0;
//            end
//            OP__LHU:
//            begin
//                state__n = STATE__LOAD__0;
//            end
//            OP__LWU:
//            begin
//                state__n = STATE__LOAD__0;
//            end
//            OP__FENCE:
//            begin
//                state__n = STATE__FENCE;
//            end
//            OP__FENCE_I:
//            begin
//                state__n = STATE__FENCE_I;
//            end
//            OP__ADDI:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SLLI:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SLTI:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SLTIU:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__XORI:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SRLI:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SRAI:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__ORI:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__ANDI:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__AUIPC:
//            begin
//                state__n = STATE__AUIPC;
//            end
//            OP__ADDIW:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SLLIW:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SRLIW:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SRAIW:
//            begin
//                state__n = STATE__ALUI__0;
//            end
//            OP__SB:
//            begin
//                state__n = STATE__STORE;
//            end
//            OP__SH:
//            begin
//                state__n = STATE__STORE;
//            end
//            OP__SW:
//            begin
//                state__n = STATE__STORE;
//            end
//            OP__SD:
//            begin
//                state__n = STATE__STORE;
//            end
//            OP__ADD:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SUB:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SLL:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SLT:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SLTU:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__XOR:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SRL:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SRA:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__OR:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__AND:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__LUI:
//            begin
//                state__n = STATE__LUI;
//            end
//            OP__ADDW:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SUBW:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SLLW:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SRLW:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__SRAW:
//            begin
//                state__n = STATE__ALU__0;
//            end
//            OP__BEQ:
//            begin
//                state__n = STATE__BRANCH__0;
//            end
//            OP__BNE:
//            begin
//                state__n = STATE__BRANCH__0;
//            end
//            OP__BLT:
//            begin
//                state__n = STATE__BRANCH__0;
//            end
//            OP__BGE:
//            begin
//                state__n = STATE__BRANCH__0;
//            end
//            OP__BLTU:
//            begin
//                state__n = STATE__BRANCH__0;
//            end
//            OP__BGEU:
//            begin
//                state__n = STATE__BRANCH__0;
//            end
//            OP__JALR:
//            begin
//                state__n = STATE__JALR__0;
//            end
//            OP__JAL:
//            begin
//                state__n = STATE__JAL__0;
//            end
//            OP__ECALL:
//            begin
//                state__n = STATE__ECALL;
//            end
//            OP__EBREAK:
//            begin
//                state__n = STATE__EBREAK;
//            end
//            OP__MRET:
//            begin
//                state__n = STATE__MRET__0;
//            end
//            OP__CSRRW:
//            begin
//            end
//            OP__CSRRS:
//            begin
//            end
//            OP__CSRRC:
//            begin
//            end
//            OP__CSRRWI:
//            begin
//            end
//            OP__CSRRSI:
//            begin
//            end
//            OP__CSRRCI:
//            begin
//            end
//            default:
//            begin
//                state__n = STATE__EXCEPTION__ILLEGAL_INSTRUCTION;
//            end
//        endcase
//    end
//
//    //==============================
//    // STATE__ALU__0
//    //==============================
//    STATE__ALU__0:
//    begin
//        addr = rs1;
//        a__n = rd_data;
//        state__n = STATE__ALU__1;
//    end
//
//    //==============================
//    // STATE__ALU__1
//    //==============================
//    STATE__ALU__1:
//    begin
//        addr = rs2;
//        b__n = rd_data;
//        state__n = STATE__ALU__2;
//    end
//
//    //==============================
//    // STATE__ALU__2
//    //==============================
//    STATE__ALU__2:
//    begin
//        addr = rd;
//        we = 1'b1;
//        wr_data = c;
//        pc__n = pc + 4;
//        case (op)
//            OP__ADD:
//            begin
//                func = FUNC__ADD;
//            end
//            OP__SUB:
//            begin
//                func = FUNC__SUB;
//            end
//            OP__SLL:
//            begin
//                func = FUNC__SLL;
//            end
//            OP__SLT:
//            begin
//                func = FUNC__SLT;
//            end
//            OP__SLTU:
//            begin
//                func = FUNC__SLTU;
//            end
//            OP__XOR:
//            begin
//                func = FUNC__XOR;
//            end
//            OP__SRL:
//            begin
//                func = FUNC__SRL;
//            end
//            OP__SRA:
//            begin
//                func = FUNC__SRA;
//            end
//            OP__OR:
//            begin
//                func = FUNC__OR;
//            end
//            OP__AND:
//            begin
//                func = FUNC__AND;
//            end
//            OP__ADDW:
//            begin
//                func = FUNC__ADDW;
//            end
//            OP__SUBW:
//            begin
//                func = FUNC__SUBW;
//            end
//            OP__SLLW:
//            begin
//                func = FUNC__SLLW;
//            end
//            OP__SRLW:
//            begin
//                func = FUNC__SRLW;
//            end
//            OP__SRAW:
//            begin
//                func = FUNC__SRAW;
//            end
//        endcase
//        state__n = STATE__FETCH__0;
//    end
//
//    //==============================
//    // STATE__ALUI__0
//    //==============================
//    STATE__ALUI__0:
//    begin
//        addr = rs1;
//        a__n = rd_data;
//        b__n = imm;
//        state__n = STATE__ALUI__1;
//    end
//
//    //==============================
//    // STATE__ALUI__1
//    //==============================
//    STATE__ALUI__1:
//    begin
//        addr = rd;
//        we = 1'b1;
//        wr_data = c;
//        pc__n = pc + 4;
//        case (op)
//            OP__ADDI:
//            begin
//                func = FUNC__ADD;
//            end
//            OP__SLLI:
//            begin
//                func = FUNC__SLL;
//            end
//            OP__SLTI:
//            begin
//                func = FUNC__SLT;
//            end
//            OP__SLTIU:
//            begin
//                func = FUNC__SLTU;
//            end
//            OP__XORI:
//            begin
//                func = FUNC__XOR;
//            end
//            OP__SRLI:
//            begin
//                func = FUNC__SRL;
//            end
//            OP__SRAI:
//            begin
//                func = FUNC__SRA;
//            end
//            OP__ORI:
//            begin
//                func = FUNC__OR;
//            end
//            OP__ANDI:
//            begin
//                func = FUNC__AND;
//            end
//            OP__ADDIW:
//            begin
//                func = FUNC__ADDW;
//            end
//            OP__SLLIW:
//            begin
//                func = FUNC__SLLW;
//            end
//            OP__SRLIW:
//            begin
//                func = FUNC__SRLW;
//            end
//            OP__SRAIW:
//            begin
//                func = FUNC__SRAW;
//            end
//        endcase
//        state__n = STATE__FETCH__0;
//    end
//
//    //==============================
//    // STATE__LOAD__0
//    //==============================
//    STATE__LOAD__0:
//    begin
//        addr = rs1;
//        a__n = rd_data;
//        b__n = imm;
//        state__n = STATE__LOAD__1;
//    end
//
//    //==============================
//    // STATE__LOAD__1
//    //==============================
//    STATE__LOAD__1:
//    begin
//        func = FUNC__ADD;
//        cpu_to_l1__valid = 1'b1;
//        cpu_to_l1__addr = c;
//        addr = rd;
//        wr_data = cpu_to_l1__rd_data;
//
//        case (op)
//            OP__LB:
//            begin
//                cpu_to_l1__dtype = DTYPE__B;
//            end
//            OP__LH:
//            begin
//                cpu_to_l1__dtype = DTYPE__H;
//            end
//            OP__LW:
//            begin
//                cpu_to_l1__dtype = DTYPE__W;
//            end
//            OP__LD:
//            begin
//                cpu_to_l1__dtype = DTYPE__D;
//            end
//            OP__LBU:
//            begin
//                cpu_to_l1__dtype = DTYPE__BU;
//            end
//            OP__LHU:
//            begin
//                cpu_to_l1__dtype = DTYPE__HU;
//            end
//            OP__LWU:
//            begin
//                cpu_to_l1__dtype = DTYPE__WU;
//            end
//        endcase
//
//        if (cpu_to_l1__hit) begin
//            we = 1'b1;
//            pc__n = pc + 4;
//            state__n = STATE__FETCH;
//        end
//    end
//
//    //==============================
//    // STATE__STORE
//    //==============================
//    STATE__STORE:
//    begin
//        func = FUNC__ADD;
//        a = rd_data__0;
//        b = imm;
//        cpu_to_l1__valid = 1'b1;
//        cpu_to_l1__addr = c;
//        cpu_to_l1__dtype = dtype;
//        cpu_to_l1__data = rd_data__1;
//
//        if (cpu_to_l1__ready) begin
//            pc__n = pc + 4;
//            state__n = STATE__FETCH__0;
//        end
//    end
//
//    //==============================
//    // STATE__AUIPC__0
//    //==============================
//    STATE__AUIPC__0:
//    begin
//        a__n = pc;
//        b__n = imm;
//        state__n = STATE__AUIPC__1;
//    end
//
//    //==============================
//    // STATE__AUIPC__1
//    //==============================
//    STATE__AUIPC__1:
//    begin
//        addr = rd;
//        we = 1'b1;
//        wr_data = c;
//        func = FUNC__ADD;
//        state__n = STATE__PC_PLUS_FOUR;
//    end
//
//    //==============================
//    // STATE__JALR__0
//    //==============================
//    STATE__JALR__0:
//    begin
//        addr = rs1;
//        a__n = rd_data;  
//        b__n = imm;  
//        state__n = STATE__JALR__1;
//    end
//
//    //==============================
//    // STATE__JALR__1
//    //==============================
//    STATE__JALR__1:
//    begin
//        addr = rd;
//        wr_data = pc + 4;
//        func = FUNC__ADD;
//
//        if (c[1] == 1'b0) begin
//            we = 1'b1;     
//            pc__n = {c[63:1], 1'b0};
//            state__n = STATE__FETCH__0;
//        end
//        else begin
//            state__n = STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH;
//        end
//    end
//
//    //==============================
//    // STATE__JAL__0
//    //==============================
//    STATE__JAL__0:
//    begin
//        a__n = pc;
//        b__n = imm;
//        state__n = STATE__JAL__1;
//    end
//
//    //==============================
//    // STATE__JAL__1
//    //==============================
//    STATE__JAL__1:
//    begin
//        addr = rd;
//        wr_data = pc + 4;
//        func__ADD;
//
//        if (c[1:0] == 2'h0) begin
//            we = 1'b1;     
//            pc__n = c;
//            state__n = STATE__FETCH__0;
//        end
//        else begin
//            state__n = STATE__EXCEPTION__MISALIGNED_INSTRUCTION_FETCH;
//        end
//    end
//
//
//    //==============================
//    // STATE__BEQ__0
//    //==============================
//    STATE__BEQ__0:
//    begin
//        addr = rs1;
//        a__n = rd_data;
//        state__n = STATE__BEQ__1;
//    end
//
//    //==============================
//    // STATE__BEQ__1
//    //==============================
//    STATE__BEQ__1:
//    begin
//        addr = rs2;
//        b__n = rd_data;
//        state__n = STATE__BEQ__2;
//    end
//
//    //==============================
//    // STATE__BEQ__2
//    //==============================
//    STATE__BEQ__2:
//    begin
//        state__n = eq ? STATE__BRANCH__0 : STATE__PC_PLUS_FOUR; 
//    end
//
//    //==============================
//    // STATE__BRANCH__0
//    //==============================
//    STATE__BRANCH__0:
//    begin
//        a__n = pc;
//        b__n = imm;
//        state__n = STATE__BRANCH__1;
//    end
//
//    //==============================
//    // STATE__BRANCH__1
//    //==============================
//    STATE__BRANCH__1:
//    begin
//        func = FUNC__ADD;
//        pc__n = c;
//
//        case (interrupt) 1'b0:
//            begin
//                state__n = STATE__FETCH__0;
//            end
//            1'b1:
//            begin
//                state__n = STATE__INTERRUPT;
//            end
//        endcase
//    end
//
//    //==============================
//    // STATE__ECALL
//    //==============================
//    STATE__ECALL:
//    begin
//        state__n = STATE__ECALL;
//    end
//
//    //==============================
//    // STATE__EBREAK
//    //==============================
//    STATE__EBREAK:
//    begin
//        state__n = STATE__EBREAK;
//    end
//
//    //==============================
//    // STATE__FENCE
//    //==============================
//    STATE__FENCE:
//    begin
//        state__n = STATE__PC_PLUS_FOUR;
//    end
//
//    //==============================
//    // STATE__FENCE_I
//    //==============================
//    STATE__FENCE_I:
//    begin
//        state__n = STATE__PC_PLUS_FOUR;
//    end
//
//    //==============================
//    // STATE__LUI
//    //==============================
//    STATE__LUI:
//    begin
//        addr = rd;
//        wr_data = imm;
//        we = 1'b1;
//        state__n = STATE__PC_PLUS_FOUR;
//    end
//
//    //==============================
//    // STATE__CSRRW__0
//    //==============================
//    STATE__CSRRW__0:
//    begin
//        addr = rs1;
//        a__n = rd_data;
//        csr__addr = imm[11:0];
//        b__n = csr__rd_data;
//
//        case (rd)
//            5'h0:
//            begin
//                state__n = STATE__CSRRW__2;
//            end
//            default:
//            begin
//                case (imm[11:10])
//                    3'h3:
//                    begin
//                        state__n = STATE__ILLEGAL_INSTRUCTION;
//                    end
//                    default:
//                    begin
//                        state__n = STATE__CSRRW__1;
//                    end
//                endcase
//            end
//        endcase
//    end
//
//
//    //==============================
//    // STATE__CSRRW__1
//    //==============================
//    STATE__CSRRW__1:
//    begin
//        addr = rd;
//        we = 1'b1;
//        wr_data = c;
//        func = FUNC__NULL_B;
//        state__n = STATE__CSRRW__2;
//    end
//
//    //==============================
//    // STATE__CSRRW__2
//    //==============================
//    STATE__CSRRW__2:
//    begin
//        csr__addr = imm[11:0];
//        csr__we = 1'b1;
//        csr__wr_data = c;
//        func = FUNC__NULL_A;
//        state__n = STATE__PC_PLUS_FOUR;
//    end
//
//    //==============================
//    // STATE__CSRRS__0
//    //==============================
//    STATE__CSRRS__0:
//    begin
//        addr = rs1;
//        a__n = rd_data;
//        csr__addr = imm[11:0];
//        b__n = csr__rd_data;
//
//        case (rs1)
//            5'h0:
//            begin
//                state__n = STATE__CSRRS__2;
//            end
//            default:
//            begin
//                state__n = STATE__CSRRS__1;
//            end
//        endcase
//
//    end
//
//    //==============================
//    // STATE__CSRRS__1
//    //==============================
//    STATE__CSRRS__1:
//    begin
//        csr__addr = imm[11:0];
//        csr__we = 1'b1;
//        csr__wr_data = c;
//        func = FUNC__OR;
//        state__n = STATE__CSRRS__2;
//    end
//
//    //==============================
//    // STATE__CSRRS__2
//    //==============================
//    STATE__CSRRS__2:
//    begin
//        addr = rd;
//        we = 1'b1;
//        wr_data = c;
//        func = FUNC__NULL_B;
//        state__n = STATE__PC_PLUS_FOUR;
//    end
//
//    //==============================
//    // STATE__INTERRUPT__EXTERNAL
//    //==============================
//    STATE__INTERRUPT__EXTERNAL:
//    begin
//        csr__addr = CSR__MCAUSE;
//        csr__we = 1'b1;
//        csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXEPTION_CODE__ILLEGAL_INSTRUCTION;
//        csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
//        state__n = STATE__TRAP__0;
//    end
//
//
//    //==============================
//    // STATE__EXCEPTION__ILLEGAL_INSTRUCTION
//    //==============================
//    STATE__EXCEPTION__ILLEGAL_INSTRUCTION:
//    begin
//        csr__addr = CSR__MCAUSE;
//        csr__we = 1'b1;
//        csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXEPTION_CODE__ILLEGAL_INSTRUCTION;
//        csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
//        state__n = STATE__TRAP__0;
//    end
//
//    //==============================
//    // STATE__TRAP__0
//    //==============================
//    STATE__TRAP__0:
//    begin
//        csr__addr = CSR__MEPC;
//        csr__we = 1'b1;
//        csr__wr_data[CSR__MEPC__MEPC__FIELD] = pc;
//        state__n = STATE__TRAP__1;
//    end
//
//    //==============================
//    // STATE__TRAP__1
//    //==============================
//    STATE__TRAP__1:
//    begin
//        csr__addr = CSR__MSTATUS;
//        csr__we = 1'b1;
//        csr__wr_data[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
//        csr__wr_data[CSR__MSTATUS__MPIE__FIELD] <= csr__rd_data[CSR__MSTATUS__MIE__FIELD];
//        state__n = STATE__TRAP__2;
//    end
//
//    //==============================
//    // STATE__TRAP__2
//    //==============================
//    STATE__TRAP__2:
//    begin
//        csr__addr = CSR__MTVEC;
//        pc__n = csr__rd_data; 
//        state__n = STATE__FETCH__0;
//    end
//
//
//endcase
//end

