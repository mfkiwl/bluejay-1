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
logic [4:0] rd_addr__0;
logic [63:0] rd_data__0;
logic [4:0] rd_addr__1;
logic [63:0] rd_data__1;
logic [4:0] wr_addr;
logic [63:0] wr_data;

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

// Extra Register
logic [63:0] tmp;
logic [63:0] tmp__n;

// Control and Status Registers
logic csr__we;
logic [11:0] csr__addr;
logic [63:0] csr__wr_data;
logic [63:0] csr__rd_data;


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
    .rd_addr__0(rd_addr__0),
    .rd_data__0(rd_data__0),
    .rd_addr__1(rd_addr__1),
    .rd_data__1(rd_data__1),
    .wr_addr(wr_addr),
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
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = pc;
            cpu_to_l1__dtype = dtype;

            if (cpu_to_l1__ready) begin
                state__n = STATE__FETCH__1;
            end
        end

        //==============================
        // STATE__FETCH__1
        //==============================
        STATE__FETCH__1:
        begin
            l1_to_cpu__ready = 1'b1;

            if (l1_to_cpu__valid) begin
                ir__n = l1_to_cpu__data[31:0];
                state__n = STATE__DECODE;
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
                    state__n = STATE__ALUI;
                end
                OP__SLLI:
                begin
                    state__n = STATE__ALUI;
                end
                OP__SLTI:
                begin
                    state__n = STATE__ALUI;
                end
                OP__SLTIU:
                begin
                    state__n = STATE__ALUI;
                end
                OP__XORI:
                begin
                    state__n = STATE__ALUI;
                end
                OP__SRLI:
                begin
                    state__n = STATE__ALUI;
                end
                OP__SRAI:
                begin
                    state__n = STATE__ALUI;
                end
                OP__ORI:
                begin
                    state__n = STATE__ALUI;
                end
                OP__ANDI:
                begin
                    state__n = STATE__ALUI;
                end
                OP__AUIPC:
                begin
                    state__n = STATE__AUIPC;
                end
                OP__ADDIW:
                begin
                    state__n = STATE__ALUI;
                end
                OP__SLLIW:
                begin
                    state__n = STATE__ALUI;
                end
                OP__SRLIW:
                begin
                    state__n = STATE__ALUI;
                end
                OP__SRAIW:
                begin
                    state__n = STATE__ALUI;
                end
                OP__SB:
                begin
                    state__n = STATE__STORE;
                end
                OP__SH:
                begin
                    state__n = STATE__STORE;
                end
                OP__SW:
                begin
                    state__n = STATE__STORE;
                end
                OP__SD:
                begin
                    state__n = STATE__STORE;
                end
                OP__ADD:
                begin
                    state__n = STATE__ALU;
                end
                OP__SUB:
                begin
                    state__n = STATE__ALU;
                end
                OP__SLL:
                begin
                    state__n = STATE__ALU;
                end
                OP__SLT:
                begin
                    state__n = STATE__ALU;
                end
                OP__SLTU:
                begin
                    state__n = STATE__ALU;
                end
                OP__XOR:
                begin
                    state__n = STATE__ALU;
                end
                OP__SRL:
                begin
                    state__n = STATE__ALU;
                end
                OP__SRA:
                begin
                    state__n = STATE__ALU;
                end
                OP__OR:
                begin
                    state__n = STATE__ALU;
                end
                OP__AND:
                begin
                    state__n = STATE__ALU;
                end
                OP__LUI:
                begin
                    state__n = STATE__LUI;
                end
                OP__ADDW:
                begin
                    state__n = STATE__ALU;
                end
                OP__SUBW:
                begin
                    state__n = STATE__ALU;
                end
                OP__SLLW:
                begin
                    state__n = STATE__ALU;
                end
                OP__SRLW:
                begin
                    state__n = STATE__ALU;
                end
                OP__SRAW:
                begin
                    state__n = STATE__ALU;
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
                    state__n = STATE__EXCEPTION__ILLEGAL_INSTRUCTION;
                end
            endcase
        end


        //==============================
        // STATE__ALU
        //==============================
        STATE__ALU:
        begin
            a = rd_data__0;
            b = rd_data__1;
            wr_data = c;
            we = 1'b1;
            pc__n = pc + 4;

            case (op)
                OP__ADD:
                begin
                    func = FUNC__ADD;
                end
                OP__SUB:
                begin
                    func = FUNC__SUB;
                end
                OP__SLL:
                begin
                    func = FUNC__SLL;
                end
                OP__SLT:
                begin
                    func = FUNC__SLT;
                end
                OP__SLTU:
                begin
                    func = FUNC__SLTU;
                end
                OP__XOR:
                begin
                    func = FUNC__XOR;
                end
                OP__SRL:
                begin
                    func = FUNC__SRL;
                end
                OP__SRA:
                begin
                    func = FUNC__SRA;
                end
                OP__OR:
                begin
                    func = FUNC__OR;
                end
                OP__AND:
                begin
                    func = FUNC__AND;
                end
                OP__ADDW:
                begin
                    func = FUNC__ADDW;
                end
                OP__SUBW:
                begin
                    func = FUNC__SUBW;
                end
                OP__SLLW:
                begin
                    func = FUNC__SLLW;
                end
                OP__SRLW:
                begin
                    func = FUNC__SRLW;
                end
                OP__SRAW:
                begin
                    func = FUNC__SRAW;
                end
            endcase

            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__ALUI
        //==============================
        STATE__ALUI:
        begin
            a = rd_data__0;
            b = imm;
            wr_data = c;
            we = 1'b1;
            pc__n = pc + 4;

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

            state__n = STATE__FETCH__0;
        end


        //==============================
        // STATE__LOAD__0
        //==============================
        STATE__LOAD__0:
        begin
            func = FUNC__ADD;
            a = rd_data__0;
            b = imm;
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = c;
            cpu_to_l1__dtype = dtype;

            if (cpu_to_l1__ready) begin
                state__n = STATE__LOAD__1;
            end
        end

        //==============================
        // STATE__LOAD__1
        //==============================
        STATE__LOAD__1:
        begin
            l1_to_cpu__ready = 1'b1;

            if (l1_to_cpu__valid) begin
                wr_data = l1_to_cpu__data;
                we = 1'b1;
                pc__n = pc + 4;
                state__n = STATE__FETCH__0;
            end
        end

        //==============================
        // STATE__STORE
        //==============================
        STATE__STORE:
        begin
            func = FUNC__ADD;
            a = rd_data__0;
            b = imm;
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = c;
            cpu_to_l1__dtype = dtype;
            cpu_to_l1__data = rd_data__1;

            if (cpu_to_l1__ready) begin
                pc__n = pc + 4;
                state__n = STATE__FETCH__0;
            end
        end

        //==============================
        // STATE__AUIPC
        //==============================
        STATE__AUIPC:
        begin
            func = FUNC__ADD;
            a = pc;
            b = imm;
            wr_data = c;
            we = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JALR
        //==============================
        STATE__JALR:
        begin
            func = FUNC__ADD;
            a = rd_data__0;  
            b = imm;  
            pc__n = c;
            wr_data = pc + 4;
            we = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__JAL
        //==============================
        STATE__JAL:
        begin
            func__ADD;
            a = pc;
            b = imm;
            pc__n = c;
            wr_data = pc + 4;
            we = 1'b1;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BRANCH__0
        //==============================
        STATE__BRANCH__0:
        begin
            a = rd_data__0;
            b = rd_data__1;

            case (op)
                OP__BEQ:
                begin
                    state__n = eq ? STATE__BRANCH__1 : STATE__BRANCH__2; 
                end
                OP__BNE:
                begin
                    state__n = ne ? STATE__BRANCH__1 : STATE__BRANCH__2; 
                end
                OP__BLT:
                begin
                    state__n = lt ? STATE__BRANCH__1 : STATE__BRANCH__2; 
                end
                OP__BGE:
                begin
                    state__n = ge ? STATE__BRANCH__1 : STATE__BRANCH__2; 
                end
                OP__BLTU:
                begin
                    state__n = ltu ? STATE__BRANCH__1 : STATE__BRANCH__2; 
                end
                OP__BGEU:
                begin
                    state__n = geu ? STATE__BRANCH__1 : STATE__BRANCH__2; 
                end
            endcase
        end

        //==============================
        // STATE__BRANCH__1
        //==============================
        STATE__BRANCH__1:
        begin
            func = FUNC__ADD;
            a = pc;
            b = imm;
            pc__n = c;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__BRANCH__2
        //==============================
        STATE__BRANCH__1:
        begin
            pc__n = pc + 4;
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
            wr_data = imm;
            we = 1'b1;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end


        //==============================
        // STATE__CSRRW
        //==============================
        STATE__CSRRW__0:
        begin
            wr_data = csr__rd_data;
            we = 1'b1;
            csr__addr = imm[11:0]; 
            csr__wr_data = rd_data__0; 
            csr__we = 1'b1; 
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRS
        //==============================
        STATE__CSRRS__0:
        begin
            wr_data = csr__rd_data;
            we = 1'b1;
            csr__addr = imm[11:0]; 
            csr__wr_data = c; 
            csr__we = 1'b1; 
            func = FUNC__OR;
            a = rd_data__0;
            b = csr__rd_data;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
        end

        //==============================
        // STATE__CSRRC
        //==============================
        STATE__CSRRC:
        begin
            wr_data = csr__rd_data;
            we = 1'b1;
            csr__addr = imm[11:0]; 
            csr__wr_data = c; 
            csr__we = 1'b1; 
            func = FUNC__CLR;
            a = rd_data__0;
            b = csr__rd_data;
            pc__n = pc + 4;
            state__n = STATE__FETCH__0;
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
            csr__wr_data[CSR__MEPC__MEPC__FIELD] <= pc;
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
            csr__wr_data[CSR__MSTATUS__MPIE__FIELD] <= mstatus[CSR__MSTATUS__MIE__FIELD];
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
    tmp <= tmp__n;
end


endmodule



