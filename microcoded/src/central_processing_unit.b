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
logic [3:0] func;
logic [4:0] rs1;
logic [4:0] rs2;
logic [4:0] rd;
logic [63:0] imm;
logic [2:0] dtype;

// Register File.
logic we;
logic [4:0] rd_addr;
logic [63:0] rd_data;
logic [4:0] wr_addr;
logic [63:0] wr_data;
logic [63:0] rd_data__0;
logic [63:0] rd_data__0__n;
logic [63:0] rd_data__1;
logic [63:0] rd_data__1__n;

// ALU.
logic [3:0] alu_func;
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
    .func(func),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .imm(imm),
    .dtype(dtype)
);

//==============================
// register_file__0
//==============================
register_file register_file__0
(
    .clk(clk),
    .rst(rst),
    .we(we),
    .rd_addr(rd_addr),
    .rd_data(rd_data),
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
    .func(alu_func),
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
    'STATE__PC4'
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
    rd_addr = rs1;
    we = 1'b0;
    wr_addr = rd;
    wr_data = c;
    alu_func = FUNC__ADD;
    a = rd_data__0;
    b = imm;
    cpu_to_l1__valid = 1'b0;
    cpu_to_l1__addr = pc;
    cpu_to_l1__data = rd_data__1;
    cpu_to_l1__we = 1'b0;
    cpu_to_l1__dtype = DTYPE__DOUBLE_WORD;
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
            cpu_to_l1__dtype = DTYPE__WORD;

            if (cpu_to_l1__ready) begin
                state__n = STATE__IF__1;
            end
        end

        //==============================
        // STATE__IF__1
        //==============================
        STATE__IF__1:
        begin
            l1_to_cpu__ready = 1'b1;

            if (l1_to_cpu__valid) begin
                ir__n = l1_to_cpu__data[31:0];
                state__n = STATE__ID;
            end
        end

        //==============================
        // STATE__ID
        //==============================
        STATE__ID:
        begin
            if ((op == OP__BEQ) || (op == OP__BNE) || (op == OP__BLT) || (op == OP__BGE) || (op == OP__BLTU) || (op == OP__BGEU)) begin
                state__n = STATE__BRANCH__0;
            end
            else if (op == OP__JAL) begin
                state__n = STATE__JAL__0;
            end
            else if (op == OP__JALR) begin
                state__n = STATE__JALR__0;
            end
            else if ((op == OP__ADD) || (op == OP__ADDW) || (op == OP__AND) || (op == OP__OR) || (op == OP__SLL) || (op == OP__SLLW) || (op == OP__SLT) || (op == OP__SLTU) || (op == OP__SRA) || (op == OP__SRAW) || (op == OP__SRL) || (op == OP__SRLW) || (op == OP__SUB) || (op == OP__SUBW) || (op == OP__XOR)) begin
                state__n = STATE__ALU__0;
            end
            else if ((op == OP__ADDI) || (op == OP__ADDIW) || (op == OP__ANDI) || (op == OP__ORI) || (op == OP__SLLI) || (op == OP__SLLIW) || (op == OP__SLTI) || (op == OP__SLTIU) || (op == OP__SRAI) || (op == OP__SRAIW) || (op == OP__SRLI) || (op == OP__SRLIW) || (op == OP__XORI)) begin
                state__n = STATE__ALUI__0;
            end
            else if ((op == OP__LB) || (op == OP__LBU) || (op == OP__LH) || (op == OP__LHU) || (op == OP__LW) || (op == OP__LWU) || (op == OP__LD)) begin
                state__n = STATE__LOAD__0;
            end
            else if ((op == OP__SB) || (op == OP__SH) || (op == OP__SW) || (op == OP__SD)) begin
                state__n = STATE__STORE__0;
            end
            else if (op == OP__AUIPC) begin
                state__n = STATE__AUIPC;
            end
            else if (op == OP__ECALL) begin
                state__n = STATE__ECALL;
            end
            else if (op == OP__EBREAK) begin
                state__n = STATE__EBREAK;
            end
            else if (op == OP__FENCE) begin
                state__n = STATE__FENCE;
            end
            else if (op == OP__FENCE_I) begin
                state__n = STATE__FENCE_I;
            end
            else if (op == OP__LUI) begin
                state__n = STATE__LUI;
            end
        end


        //==============================
        // STATE__LOAD__0
        //==============================
        STATE__LOAD__0:
        begin
            rd_addr = rs1;
            rd_data__0__n = rd_data;
            state__n = STATE__LOAD__1;
        end

        //==============================
        // STATE__LOAD__1
        //==============================
        STATE__LOAD__1:
        begin
            a = rd_data__0;
            b = imm;
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = c;
            cpu_to_l1__dtype = dtype;

            if (cpu_to_l1__ready) begin
                state__n = STATE__LOAD__2;
            end
        end

        //==============================
        // STATE__LOAD__2
        //==============================
        STATE__LOAD__2:
        begin
            l1_to_cpu__ready = 1'b1;

            if (l1_to_cpu__valid) begin
                wr_data = l1_to_cpu__data;
                we = 1'b1;
                state__n = STATE__PC4;
            end
        end

        //==============================
        // STATE__STORE__0
        //==============================
        STATE__STORE__0:
        begin
            rd_addr = rs1;
            rd_data__0__n = rd_data;
            state__n = STATE__STORE__1;
        end

        //==============================
        // STATE__STORE__1
        //==============================
        STATE__STORE__1:
        begin
            rd_addr = rs2;
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
            cpu_to_l1__valid = 1'b1;
            cpu_to_l1__addr = c;
            cpu_to_l1__data = rd_data__1;
            cpu_to_l1__we = 1'b1;
            cpu_to_l1__dtype = dtype;

            if (cpu_to_l1__ready) begin
                state__n = STATE__PC4;
            end
        end

        //==============================
        // STATE__ALU__0
        //==============================
        STATE__ALU__0:
        begin
            rd_addr = rs1;
            rd_data__0__n = rd_data;
            state__n = STATE__ALU__1;
        end

        //==============================
        // STATE__ALU__1
        //==============================
        STATE__ALU__1:
        begin
            rd_addr = rs2;
            rd_data__1__n = rd_data;
            state__n = STATE__ALU__2;
        end

        //==============================
        // STATE__ALU__2
        //==============================
        STATE__ALU__2:
        begin
            a = rd_data__0;
            b = rd_data__1;
            wr_data = c;
            we = 1'b1;
            alu_func = func;
            state__n = STATE__PC4;
        end

        //==============================
        // STATE__ALUI__0
        //==============================
        STATE__ALUI__0:
        begin
            rd_addr = rs1;
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
            alu_func = func;
            state__n = STATE__PC4;
        end

        //==============================
        // STATE__AUIPC
        //==============================
        STATE__AUIPC:
        begin
            a = pc;
            b = imm;
            wr_data = c;
            we = 1'b1;
            alu_func = FUNC__ADD;
            state__n = STATE__PC4;
        end

        //==============================
        // STATE__JALR__0
        //==============================
        STATE__JALR__0:
        begin
            rd_addr = rs1;
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
            wr_data = c;
            we = 1'b1;
            state__n = STATE__JALR__2;
        end

        //==============================
        // STATE__JALR__2
        //==============================
        STATE__JALR__2:
        begin
            a = rd_data__0;
            b = imm;
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
            wr_data = c;
            we = 1'b1;
            state__n = STATE__JAL__1;
        end

        //==============================
        // STATE__JAL__1
        //==============================
        STATE__JAL__1:
        begin
            a = pc;
            b = imm;
            pc__n = c;
            state__n = STATE__IF__0;
        end

        //==============================
        // STATE__BRANCH__0
        //==============================
        STATE__BRANCH__0:
        begin
            rd_addr = rs1;
            rd_data__0__n = rd_data;
            state__n = STATE__BRANCH__1;
        end

        //==============================
        // STATE__BRANCH__1
        //==============================
        STATE__BRANCH__1:
        begin
            rd_addr = rs2;
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
                    state__n = eq ? STATE__BRANCH__3 : STATE__PC4; 
                OP__BNE:
                    state__n = ne ? STATE__BRANCH__3 : STATE__PC4; 
                OP__BLT:
                    state__n = lt ? STATE__BRANCH__3 : STATE__PC4; 
                OP__BGE:
                    state__n = ge ? STATE__BRANCH__3 : STATE__PC4; 
                OP__BLTU:
                    state__n = ltu ? STATE__BRANCH__3 : STATE__PC4; 
                OP__BGEU:
                    state__n = geu ? STATE__BRANCH__3 : STATE__PC4; 
            endcase
        end

        //==============================
        // STATE__BRANCH__3
        //==============================
        STATE__BRANCH__3:
        begin
            a = pc;
            b = imm;
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
            state__n = STATE__PC4;
        end

        //==============================
        // STATE__FENCE_I
        //==============================
        STATE__FENCE_I:
        begin
            state__n = STATE__PC4;
        end

        //==============================
        // STATE__LUI
        //==============================
        STATE__LUI:
        begin
            wr_data = imm;
            we = 1'b1;
            state__n = STATE__PC4;
        end

        //==============================
        // STATE__PC4
        //==============================
        STATE__PC4:
        begin
            a = pc;
            b = 4;
            pc__n = c;
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


endmodule
