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
logic [63:0] rd_data__0;
logic [63:0] rd_data__0__n;
logic [63:0] rd_data__1;
logic [63:0] rd_data__1__n;

// ALU.
logic [3:0] func;
logic [63:0] a;
logic [63:0] b;
logic [63:0] c;

// Comparator.
logic eq;
logic ne;
logic lt;
logic ge;
logic ltu;
logic geu;

// FSM.
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

for i, state in enumerate(states):
    print(f"localparam {state} = 6'h{i:x};") 
)


always_comb begin
    state__n = state;
    pc__n = pc;
    ir__n = ir;
    rd_data__0__n = rd_data__0;
    rd_data__1__n = rd_data__1;
    addr = rs1;
    we = 1'b0;
    wr_data = c;
    func = FUNC__ADD;
    a = rd_data__0;
    b = imm;
    cpu_to_l1__valid = 1'b0;
    cpu_to_l1__addr = pc;
    cpu_to_l1__data = rd_data__1;
    cpu_to_l1__we = 1'b0;
    cpu_to_l1__dtype = DTYPE__D;
    l1_to_cpu__ready = 1'b0;

    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__IF__0;
        end


        //==============================
        // STATE__IF__0
        //==============================
        STATE__IF__0:
        begin
            
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = pc;
            cpu_to_l1__dtype = DTYPE__W;

            case (cpu_to_l1__ready)
                1'b0: 
                begin
                    state__n = state;
                end
                1'b1:
                begin
                    state__n = STATE__IF__1;
                end
            endcase
        end

        //==============================
        // STATE__IF__1
        //==============================
        STATE__IF__1:
        begin
            l1_to_cpu__ready = 1'b1;
            ir__n = l1_to_cpu__data[31:0];

            case (l1_to_cpu__valid)
                1'b0:
                begin
                    state__n = state;
                end
                1'b1:
                begin
                    state__n = STATE__ID;
                end
            endcase
        end

        //==============================
        // STATE__ID
        //==============================
        STATE__ID:
        begin
            case (op)
                OP__LB:
                begin
                    state__n = STATE__LOAD__0;
                end
                OP__LH:
                begin
                    state__n = STATE__LOAD__0;
                end
                OP__LW:
                begin
                    state__n = STATE__LOAD__0;
                end
                OP__LD:
                begin
                    state__n = STATE__LOAD__0;
                end
                OP__LBU:
                begin
                    state__n = STATE__LOAD__0;
                end
                OP__LHU:
                begin
                    state__n = STATE__LOAD__0;
                end
                OP__LWU:
                begin
                    state__n = STATE__LOAD__0;
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
                    state__n = STATE__ALUI__0;
                end
                OP__SLLI:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__SLTI:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__SLTIU:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__XORI:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__SRLI:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__SRAI:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__ORI:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__ANDI:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__AUIPC:
                begin
                    state__n = STATE__AUIPC;
                end
                OP__ADDIW:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__SLLIW:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__SRLIW:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__SRAIW:
                begin
                    state__n = STATE__ALUI__0;
                end
                OP__SB:
                begin
                    state__n = STATE__STORE__0;
                end
                OP__SH:
                begin
                    state__n = STATE__STORE__0;
                end
                OP__SW:
                begin
                    state__n = STATE__STORE__0;
                end
                OP__SD:
                begin
                    state__n = STATE__STORE__0;
                end
                OP__ADD:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SUB:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SLL:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SLT:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SLTU:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__XOR:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SRL:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SRA:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__OR:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__AND:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__LUI:
                begin
                    state__n = STATE__LUI;
                end
                OP__ADDW:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SUBW:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SLLW:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SRLW:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__SRAW:
                begin
                    state__n = STATE__ALU__0;
                end
                OP__BEQ:
                begin
                    state__n = STATE__BRANCH__0;
                end
                OP__BNE:
                begin
                    state__n = STATE__BRANCH__0;
                end
                OP__BLT:
                begin
                    state__n = STATE__BRANCH__0;
                end
                OP__BGE:
                begin
                    state__n = STATE__BRANCH__0;
                end
                OP__BLTU:
                begin
                    state__n = STATE__BRANCH__0;
                end
                OP__BGEU:
                begin
                    state__n = STATE__BRANCH__0;
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
                    state__n = STATE__MRET__0;
                end
                OP__CSRRW:
                begin
                end
                OP__CSRRS:
                begin
                end
                OP__CSRRC:
                begin
                end
                OP__CSRRWI:
                begin
                end
                OP__CSRRSI:
                begin
                end
                OP__CSRRCI:
                begin
                end
                default:
                begin
                    state__n = STATE__ILLEGAL_INSTRUCTION;
                end
            endcase
        end


        //==============================
        // STATE__LOAD__RS1_TO_A_IMM_TO_B
        //==============================
        STATE__LOAD__RS1_TO_A_IMM_TO_B:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__LOAD__SEL_DTYPE;
        end

        //=============================
        // STATE__LOAD__SEL_DTYPE
        //==============================
        STATE__LOAD__SEL_DTYPE:
        begin
            case (op)
                OP__LB:
                begin
                    state__n = STATE__LOAD__LB;
                end
                OP__LBU:
                begin
                    state__n = STATE__LOAD__LBU;
                end
                OP__LH:
                begin
                    state__n = STATE__LOAD__LH;
                end
                OP__LHU:
                begin
                    state__n = STATE__LOAD__LHU;
                end
                OP__LW:
                begin
                    state__n = STATE__LOAD__LW;
                end
                OP__LWU:
                begin
                    state__n = STATE__LOAD__LWU;
                end
                OP__LD:
                begin
                    state__n = STATE__LOAD__LD;
                end
            endcase
        end

        //=============================
        // STATE__LOAD__LB
        //==============================
        STATE__LOAD__LB:
        begin
            func = FUNC__ADD;
            cpu_to_l1__addr = c;
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__dtype = DTYPE__B;

            case (cpu_to_l1__ready)
                1'b0: 
                begin
                    state__n = state;
                end
                1'b1:
                begin
                    state__n = STATE__LOAD__WAIT;
                end
            endcase
        end

        //==============================
        // STATE__LOAD__WAIT
        //==============================
        STATE__LOAD__WAIT:
        begin
            case (l1_to_cpu__valid)
                1'b0:
                begin
                    state__n = state;
                end
                1'b1:
                begin
                    state__n = STATE__LOAD__MEM_TO_RD;
                end
            endcase
        end

        //==============================
        // STATE__LOAD__MEM_TO_RD
        //==============================
        STATE__LOAD__MEM_TO_RD:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = l1_to_cpu__data;
            l1_to_cpu__ready = 1'b1;
            state__n = STATE__PC_PLUS_FOUR;
        end

        //==============================
        // STATE__STORE__RS1_TO_A_IMM_TO_B
        //==============================
        STATE__STORE__RS1_TO_A_IMM_TO_B:
        begin
            addr = rs1;
            a__n = rd_data;
            b__n = imm;
            state__n = STATE__STORE__SEL_DTYPE;
        end

        //==============================
        // STATE__STORE__1
        //==============================
        STATE__STORE__1:
        begin
            addr = rs2;
            rd_data__1__n = rd_data;
            state__n = STATE__STORE__2;
        end

        //==============================
        // STATE__STORE__2
        //==============================
        STATE__STORE__2:
        begin
            a = rd_data__0;
            b = imm;
            func = FUNC__ADD;
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = c;
            cpu_to_l1__data = rd_data__1;
            cpu_to_l1__we = 1'b1;

            case (op)
                OP__SB:
                begin
                    cpu_to_l1__dtype = DTYPE__B;
                end
                OP__SH:
                begin
                    cpu_to_l1__dtype = DTYPE__H;
                end
                OP__SW:
                begin
                    cpu_to_l1__dtype = DTYPE__W;
                end
                OP__SD:
                begin
                    cpu_to_l1__dtype = DTYPE__D;
                end
            endcase

            if (cpu_to_l1__ready) begin
                state__n = STATE__PC_PLUS_FOUR;
            end
        end

        //==============================
        // STATE__ALU__RS1_TO_A
        //==============================
        STATE__ALU__READ_RS1:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__ALU__RS2_TO_B;
        end

        //==============================
        // STATE__ALU__RS2_TO_B
        //==============================
        STATE__ALU__RS2_TO_B:
        begin
            addr = rs2;
            b__n = rd_data;
            state__n = STATE__ALU__SEL_FUNC;
        end

        //==============================
        // STATE__ALU__SEL_FUNC
        //==============================
        STATE__ALU__SEL_FUNC:
        begin
            case (op)
                OP__ADD:
                begin
                    state__n = STATE__ALU__ADD;
                end
            endcase
        end

        //==============================
        // STATE__ALU__ADD
        //==============================
        STATE__ALU__SEL_FUNC:
        begin
            func = FUNC__ADD;
            addr = rd;
            we = 1'b1;
            wr_data = c;
            state__n = STATE__PC_PLUS_FOUR;
        end




        //==============================
        // STATE__ALUI__0
        //==============================
        STATE__ALUI__0:
        begin
            addr = rs1;
            rd_data__0__n = rd_data;
            state__n = STATE__ALUI__1;
        end

        //==============================
        // STATE__ALUI__1
        //==============================
        STATE__ALUI__1:
        begin
            a = rd_data__0;
            b = imm;
            wr_data = c;
            we = 1'b1;
            addr = rd;

            case (op)
                OP__ADDI:
                begin
                    func = FUNC__ADD;
                end
                OP__SLLI:
                begin
                    func = FUNC__SLL;
                end
                OP__SLTI:
                begin
                    func = FUNC__SLT;
                end
                OP__SLTIU:
                begin
                    func = FUNC__SLTU;
                end
                OP__XORI:
                begin
                    func = FUNC__XOR;
                end
                OP__SRLI:
                begin
                    func = FUNC__SRL;
                end
                OP__SRAI:
                begin
                    func = FUNC__SRA;
                end
                OP__ORI:
                begin
                    func = FUNC__OR;
                end
                OP__ANDI:
                begin
                    func = FUNC__AND;
                end
                OP__ADDIW:
                begin
                    func = FUNC__ADDW;
                end
                OP__SLLIW:
                begin
                    func = FUNC__SLLW;
                end
                OP__SRLIW:
                begin
                    func = FUNC__SRLW;
                end
                OP__SRAIW:
                begin
                    func = FUNC__SRAW;
                end
            endcase

            state__n = STATE__PC_PLUS_FOUR;
        end

        //==============================
        // STATE__AUIPC
        //==============================
        STATE__AUIPC:
        begin
            a = pc;
            b = imm;
            func = FUNC__ADD;
            wr_data = c;
            we = 1'b1;
            addr = rd;
            func = FUNC__ADD;
            state__n = STATE__PC_PLUS_FOUR;
        end

        //==============================
        // STATE__JALR__0
        //==============================
        STATE__JALR__0:
        begin
            addr = rs1;
            rd_data__0__n = rd_data;
            state__n = STATE__JALR__1;
        end

        //==============================
        // STATE__JALR__1
        //==============================
        STATE__JALR__1:
        begin
            a = pc;
            b = 4;
            func = FUNC__ADD;
            wr_data = c;
            we = 1'b1;
            addr = rd;
            state__n = STATE__JALR__2;
        end

        //==============================
        // STATE__JALR__2
        //==============================
        STATE__JALR__2:
        begin
            a = rd_data__0;
            b = imm;
            func = FUNC__ADD;
            pc__n = c;
            state__n = STATE__IF__0;
        end

        //==============================
        // STATE__JAL__0
        //==============================
        STATE__JAL__0:
        begin
            a = pc;
            b = 4;
            func = FUNC__ADD;
            wr_data = c;
            we = 1'b1;
            addr = rd;
            state__n = STATE__JAL__1;
        end

        //==============================
        // STATE__JAL__1
        //==============================
        STATE__JAL__1:
        begin
            a = pc;
            b = imm;
            func = FUNC__ADD;
            pc__n = c;
            state__n = STATE__IF__0;
        end

        //==============================
        // STATE__BRANCH__0
        //==============================
        STATE__BRANCH__0:
        begin
            addr = rs1;
            rd_data__0__n = rd_data;
            state__n = STATE__BRANCH__1;
        end

        //==============================
        // STATE__BRANCH__1
        //==============================
        STATE__BRANCH__1:
        begin
            addr = rs2;
            rd_data__1__n = rd_data;
            state__n = STATE__BRANCH__2;
        end

        //==============================
        // STATE__BRANCH__2
        //==============================
        STATE__BRANCH__2:
        begin
            a = rd_data__0;
            b = rd_data__1;

            case (op)
                OP__BEQ:
                begin
                    state__n = eq ? STATE__BRANCH__3 : STATE__PC_PLUS_FOUR; 
                end
                OP__BNE:
                begin
                    state__n = ne ? STATE__BRANCH__3 : STATE__PC_PLUS_FOUR; 
                end
                OP__BLT:
                begin
                    state__n = lt ? STATE__BRANCH__3 : STATE__PC_PLUS_FOUR; 
                end
                OP__BGE:
                begin
                    state__n = ge ? STATE__BRANCH__3 : STATE__PC_PLUS_FOUR; 
                end
                OP__BLTU:
                begin
                    state__n = ltu ? STATE__BRANCH__3 : STATE__PC_PLUS_FOUR; 
                end
                OP__BGEU:
                begin
                    state__n = geu ? STATE__BRANCH__3 : STATE__PC_PLUS_FOUR; 
                end
            endcase
        end

        //==============================
        // STATE__BRANCH__3
        //==============================
        STATE__BRANCH__3:
        begin
            a = pc;
            b = imm;
            func = FUNC__ADD;
            pc__n = c;
            state__n = STATE__IF__0;
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
            state__n = STATE__PC_PLUS_FOUR;
        end

        //==============================
        // STATE__FENCE_I
        //==============================
        STATE__FENCE_I:
        begin
            state__n = STATE__PC_PLUS_FOUR;
        end

        //==============================
        // STATE__LUI
        //==============================
        STATE__LUI:
        begin
            wr_data = imm;
            we = 1'b1;
            addr = rd;
            state__n = STATE__PC_PLUS_FOUR;
        end

        //==============================
        // STATE__PC_PLUS_FOUR
        //==============================
        STATE__PC_PLUS_FOUR:
        begin
            a = pc;
            b = 4;
            func = FUNC__ADD;
            pc__n = c;
            state__n = STATE__IF__0;
        end


        //==============================
        // STATE__MRET__0
        //==============================
        STATE__MRET__0:
        begin
            mstatus__n[CSR__MSTATUS__MIE__FIELD] <= mstatus[CSR__MSTATUS__MPIE__FIELD];
            mstatus__n[CSR__MSTATUS__MPIE__FIELD] <= CSR__MSTATUS__MPIE__ENABLED;
            pc__n = mepc;
            state__n = STATE__IF__0;
        end


        //==============================
        // STATE__CSRR__READ_OPS
        //==============================
        STATE__CSRR__READ_OPS:
        begin
            csr__addr = imm[11:0];
            a__n = csr__rd_data;
            b__n = 64'h0;
            state__n = STATE__CSRR__WRITE_RD;
        end

        //==============================
        // STATE__CSRR__WRITE_RD
        //==============================
        STATE__CSRR__WRITE_RD;
        begin
            addr = rd;
            we = 1'b1;
            wr_data = c;
            state__n = STATE__PC_PLUS_FOUR;
        end


        //==============================
        // STATE__CSRW___CSR
        //==============================
        STATE__CSRW__WRITE_CSR:
        begin
            addr = rs1;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = rd_data; 
            state__n = STATE__PC_PLUS_FOUR;
        end


        //==============================
        // STATE__CSRRW__READ_RS1
        //==============================
        STATE__CSRRS__READ_RS1:
        begin
            addr = rs1;
            a__n = rd_data;
            state__n = STATE__CSRRS__READ_CSR;
        end

        //==============================
        // STATE__CSRRS__READ_OPS
        //==============================
        STATE__CSRRS__READ_OPS:
        begin
            addr = rs1;
            a__n = rd_data;
            csr__addr = imm[11:0]
            b__n = csr__rd_data;
            state__n = STATE__CSRRS__READ_CSR;
        end

        //==============================
        // STATE__CSRRS__APPLY_SET_MASK
        //==============================
        STATE__CSRRS__APPLY_SET_MASK:
        begin
            addr = rd;
            we = 1'b1;
            wr_data = b;
            func = FUNC__OR;
            csr__addr = imm[11:0];
            csr__we = 1'b1;
            csr__wr_data = c;
            state__n = STATE__PC_PLUS_FOUR;
        end


        //==============================
        // STATE__CSR__RW__READ_RS1
        //==============================
        STATE__CSR__RW__READ_CSR:
        begin
            addr = rs1;
            we = 1'b1;
            wr_data = csr__rd_data;
            csr__addr = imm[11:0];
            state__n = STATE__PC_PLUS_FOUR;
        end



        //==============================
        // STATE__CSR__READ_CSR_INTO_TEMP
        //==============================
        STATE__CSRR__2:
        begin
        end





        //==============================
        // 
        //==============================
        STATE__CSRR__2:
        begin
            case (op)
                OP__CSRRW:
                begin
                    case (rd)
                        5'h0:
                        begin
                            state__n = OP__CSRWO__0;
                        end
                        default:
                        begin
                            state__n = OP__CSRRW__0;
                        end
                    endcase
                end
                OP__CSRRS:
                begin
                    case (rs1)
                        5'h0:
                        begin
                            state__n = OP__CSRRO__0;
                        end
                        default:
                        begin
                            state__n = OP__CSRRW__0;
                        end
                    endcase
                end
                OP__CSRRC:
                begin
                    case (rs1)
                        5'h0:
                        begin
                            state__n = OP__CSRRO__0;
                        end
                        default:
                        begin
                            state__n = OP__CSRRW__0;
                        end
                    endcase
                end
            endcase
        end


        //==============================
        // STATE__CSRR
        //==============================
        STATE__CSRR:
        begin
            addr = rd;
            wr_data = temp;
            we = 1'b1;
            state__n =  
        end

        //==============================
        // STATE__CSRW
        //==============================
        STATE__CSRW:
        begin
            case (op)
                OP__CSRRW:
                begin
                    state__n = STATE__CSRW__1;
                end
                OP__CSRRS:
                begin
                    case (rs1)
                        5'h0:
                        begin
                            state__n = STATE__PC_PLUS_FOUR;
                        end
                        default:
                        begin
                            state__n = STATE__CSRW__1;
                        end
                    endcase
                end
                OP__CSRRC:
                begin
                    case (rs1)
                        5'h0:
                        begin
                            state__n = STATE__PC_PLUS_FOUR;
                        end
                        default:
                        begin
                            state__n = STATE__CSRW__1;
                        end
                    endcase
                end
            endcase
        end

        //==============================
        // STATE__CSRRS__1
        //==============================
        STATE__CSRRS__1:
        begin
            case (imm[11:10])
                2'h3:
                begin
                    mcause__n[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXEPTION_CODE__ILLEGAL_INSTRUCTION;
                    mcause__n[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
                    state__n = STATE__TRAP;
                end
                default:
                begin
                    state__n = STATE__CSRW__1;
                end
            endcase
        end

        //==============================
        // STATE__CSRW__1
        //==============================
        STATE__CSRW__1:
        begin
            case (op)
                OP__CSRRW:
                begin
                    temp__n = rd_data__0;
                end
                OP__CSRRS:
                begin
                    a = rd_data__0;
                    b = temp;
                    temp__n = c;
                    func = OP__OR;
                end
                OP__CSRRC:
                begin
                    a = rd_data__0;
                    b = temp;
                    temp__n = c;
                    func = OP__CLR;
                end
            endcase
        end

        //==============================
        // STATE__CSRR__2
        //==============================
        STATE__CSRR__2:
        begin
            case (imm[11:0]) begin
                MTVEC:
                begin
                    mtvec__n = temp;
                end
            endcase

            state__n = STATE__PC_PLUS_FOUR;
        end


        //==============================
        // STATE__CSRW__1
        //==============================
        STATE__CSRW__1:
        begin
            case (op)
                OP__CSRRW:
                begin
                    temp__n = rd_data__0;
                end
                OP__CSRRS:
                begin
                    a = rd_data__0;
                    b = temp;
                    temp__n = c;
                    func = OP__OR;
                end
                OP__CSRRC:
                begin
                    a = rd_data__0;
                    b = temp;
                    temp__n = c;
                    func = OP__CLR;
                end
            endcase
        end
        

        //==============================
        // STATE__CSRR__2
        //==============================
        STATE__CSRR__2:
        begin
        end

        //==============================
        // STATE__CSRR__2
        //==============================
        STATE__CSRR__2:
        begin
            case (op)
                OP__CSRRW:
                begin
                    state__n = ;
                end
                OP__CSRRS:
                begin
                    temp__n = c;
                    func = FUNC__OR;
                end
                OP__CSRRC:
                begin
                    temp__n = c;
                    func = FUNC__CLR;
                end
            endcase

            state__n = 
        end



        //==============================
        // STATE__CSRR__3
        //==============================
        STATE__CSRR__3:
        begin
            temp__n = rd_data__0;
        end

        

        //==============================
        // STATE__CSRRS__2
        //==============================
        STATE__CSRRS__2:
        begin
            case (imm[11:0]) begin
                MTVEC:
                begin
                    wr_data = mtvec;
                    b = mtvec;
                    mtvec__n = c; 
                end
            endcase
        end
        



        //==============================
        // STATE__CSRRS__2
        //==============================
        STATE__CSRRS__2:
        begin
            addr = rd;
            we = 1'b1;
            a = rd_data__0;
            func = FUNC__OR;

            case (imm[11:0]) begin
                MTVEC:
                begin
                    wr_data = mtvec;
                    b = mtvec;
                    mtvec__n = c; 
                end
            endcase
        end


        //==============================
        // STATE__CSRRSC__0
        //==============================
        STATE__CSRRS__0:
        begin
            case (rs1)
                5'h0:
                begin
                    STATE__CSRR__0;
                end
                default:
                begin
                    case (imm[11:10) begin
                        2'h3:
                        begin
                            csr__addr = CSR__MCAUSE;     
                            csr__we = 1'b1;
                            csr__wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXEPTION_CODE__ILLEGAL_INSTRUCTION;
                            csr__wr_data[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
                            state__n = STATE__TRAP;
                        end
                        default:
                        begin
                            state__n = 
                        end
                    end
                end
            endcase
        end


        //==============================
        // STATE__CSRR__0
        //==============================
        STATE__CSRR__0:
        begin
            csr__addr = imm[11:0]; 
            addr = rd;
            we = 1'b1;
            wr_data = csr__rd_data;
            state__n = STATE__PC_PLUS_FOUR;
        end


        STATE__CSRRS__1:
        begin
            a = rd_data__0;
            b = csr__rd_data;
            csr__addr = imm[11:0]
            csr__wr_data = c; 
        end



        //==============================
        // STATE__CSRRS__0
        //==============================
        STATE__CSRRS__0:
        begin
            addr = rs1;
            rd_data__0__n = rd_data;
        end

        STATE__CSRRS__1:
        begin
            a = rd_data__0;
            b = csr__rd_data;
            csr__addr = imm[11:0]
            csr__wr_data = c; 
        end


        //==============================
        // STATE__CSRRS__0
        //==============================
        STATE__CSRRS__0:
        begin
            addr = rs1;
            a = rd_data__0;
            temp__n = csr__rd_data;

            data & ~rd_data__0;
            data | rd_data__0;
        end


            case (imm[11:10])
                2'h3:
                begin
                    mcause__n[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXEPTION_CODE__ILLEGAL_INSTRUCTION;
                    mcause__n[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
                    state__n = STATE__TRAP;
                end
                default:
                begin
                    state__n = STATE__CSRRW__1;
                end
            endcase
        end






            case (imm[11:10])
                2'h3:
                begin
                    mcause__n[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = CSR__MCAUSE__EXEPTION_CODE__ILLEGAL_INSTRUCTION;
                    mcause__n[CSR__MCAUSE__INTERRUPT__FIELD] = CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT;
                    state__n = STATE__TRAP;
                end
                default:
                begin
                    state__n = STATE__CSRRW__2;
                end
            endcase



        //==============================
        // STATE__CSRRW__0
        //==============================
        STATE__CSRRW__0:
        begin
            case (rd)
                5'h0:
                begin
                    state__n = STATE__CSRW__0;        
                end
            endcase
        end




        //==============================
        // STATE__CSR_RW__0
        //==============================
        STATE__CSR_RW__0:
        begin
        end

        //==============================
        // STATE__CSR_WO__0
        //==============================
        STATE__CSR_WO__0:
        begin
        end


        //==============================
        // STATE__CSR_READ__0
        //==============================
        STATE__CSR_READ__0:
        begin
        end

        //==============================
        // STATE__CSR_WRITE__0
        //==============================
        STATE__CSR_WRITE__1:
        begin
            csr__addr = imm[11:0];
            csr__wr_data = rd_data__0;
            csr__ce = 1'b1;
            csr__rw = 1'b1;
        end

        //==============================
        // STATE__TRAP
        //==============================
        STATE__TRAP:
        begin
            mepc__n[CSR__MEPC__MEPC__FIELD] = pc;
            mstatus__n[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
            mstatus__n[CSR__MSTATUS__MPIE__FIELD] <= mstatus[CSR__MSTATUS__MIE__FIELD];
            pc__n = mtvec;  
            state__n = STATE__IF__0;
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
    rd_data__0 <= rd_data__0__n;
end

always_ff @(posedge clk) begin
    rd_data__1 <= rd_data__1__n;
end


logic [63:0] misa;
logic [63:0] misa__n;
logic [63:0] mstatus;
logic [63:0] mstatus__n;
logic [63:0] mcause;
logic [63:0] mcause__n;
logic [63:0] mepc;
logic [63:0] mepc__n;
logic [63:0] mtvec;
logic [63:0] mtvec__n;


//==============================================
// misa (Machine ISA Register), RW
//==============================================
assign misa[CSR__MISA__EXTENSIONS__FIELD] = CSR__MISA__EXTENSIONS__I;
assign misa[CSR__MISA__WIRI__0__FIELD] = CSR__MISA__WIRI__0__VALUE;
assign misa[CSR__MISA__BASE__FIELD] = CSR__MISA__BASE__RV64;

// mstatus
assign mstatus[CSR__MSTATUS__UIE__FIELD] = CSR__MSTATUS__UIE__DISABLED;
assign mstatus[CSR__MSTATUS__SIE__FIELD] = CSR__MSTATUS__SIE__DISABLED;
assign mstatus[CSR__MSTATUS__HIE__FIELD] = CSR__MSTATUS__HIE__DISABLED;
assign mstatus[CSR__MSTATUS__UPIE__FIELD] = CSR__MSTATUS__UPIE__DISABLED;
assign mstatus[CSR__MSTATUS__SPIE__FIELD] = CSR__MSTATUS__SPIE__DISABLED;
assign mstatus[CSR__MSTATUS__HPIE__FIELD] = CSR__MSTATUS__HPIE__DISABLED;
assign mstatus[CSR__MSTATUS__MPP__FIELD] = CSR__MSTATUS__MPP__MACHINE;
assign mstatus[CSR__MSTATUS__FS__FIELD] = CSR__MSTATUS__FS__OFF;
assign mstatus[CSR__MSTATUS__XS__FIELD] = CSR__MSTATUS__XS__OFF;
assign mstatus[CSR__MSTATUS__MPRV__FIELD] = CSR__MSTATUS__MPRV__DISABLED;
assign mstatus[CSR__MSTATUS__PUM__FIELD] = CSR__MSTATUS__PUM__DISABLED;
assign mstatus[CSR__MSTATUS__MXR__FIELD] = CSR__MSTATUS__MXR__DISABLED;
assign mstatus[CSR__MSTATUS__VM__FIELD] = CSR__MSTATUS__VM__MBARE;
assign mstatus[CSR__MSTATUS__SD__FIELD] = CSR__MSTATUS__SD__NOT_DIRTY;

always_ff @(posedge clk) begin
    if (rst) begin
        mstatus[CSR__MSTATUS__MIE__FIELD] <= CSR__MSTATUS__MIE__DISABLED;
        mstatus[CSR__MSTATUS__MPIE__FIELD] <= CSR__MSTATUS__MPIE__DISABLED;
        mstatus[CSR__MSTATUS__WPRI__0__FIELD] <= CSR__MSTATUS__WPRI__0__RESET_VALUE;
        mstatus[CSR__MSTATUS__WPRI__1__FIELD] <= CSR__MSTATUS__WPRI__1__RESET_VALUE;
    end
    else begin
        mstatus[CSR__MSTATUS__MIE__FIELD] <= mstatus__n[CSR__MSTATUS__MIE__FIELD];
        mstatus[CSR__MSTATUS__MPIE__FIELD] <= mstatus__n[CSR__MSTATUS__MPIE__FIELD];
        mstatus[CSR__MSTATUS__WPRI__0__FIELD] <= mstatus__n[CSR__MSTATUS__WPRI__0__FIELD];
        mstatus[CSR__MSTATUS__WPRI__1__FIELD] <= mstatus__n[CSR__MSTATUS__WPRI__1__FIELD];
    end
end


// mcause
always_ff @(posedge clk) begin
    mcause[CSR__MCAUSE__EXCEPTION_CODE__FIELD] <= mcause__n[CSR__MCAUSE__EXCEPTION_CODE__FIELD];
    mcause[CSR__MCAUSE__INTERRUPT__FIELD] <= mcause__n[CSR__MCAUSE__INTERRUPT__FIELD];
end

// mepc
always_ff @(posedge clk) begin
    mepc[CSR__MEPC__MEPC__FIELD] <= mepc__n[CSR__MEPC__MEPC__FIELD];
end

// mtvec
assign mtvec[CSR__MTVEC__OFFSET__FIELD] = CSR__MTVEC__OFFSET__VALUE;

always_ff @(posedge clk) begin
    if (rst) begin
        mtvec[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD] <= CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__RESET_VALUE;
    end
    else begin
        mtvec[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD] <= mtvec[CSR__MTVEC__TRAP_VECTOR_BASE_ADDRESS__FIELD];
    end
end



endmodule
