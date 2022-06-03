//==============================================
// central_processing_unit
//==============================================
module central_processing_unit
(
    input clk,
    input rst,
);


logic [63:0] pc;
logic [32:0] ir;
logic [63:0] a;
logic [63:0] b;
logic [63:0] c;
logic [3:0] alu_func;
logic we__pc;
logic we__ir;
logic we__a;
logic we__b;
logic we__temp;
logic [4:0] rf__addr;
logic rf__we;
logic [63:0] rf__wr_data;
logic [63:0] rf__rd_data;
logic l1__valid;
logic [4:0] l1__addr;
logic l1__we;
logic [63:0] l1__rd_data;
logic [63:0] l1__wr_data;
logic eq;
logic ne;
logic lt;
logic ge;
logic ltu;
logic geu;
logic op;
logic func;
logic [5:0] rs1;
logic [5:0] rs2;
logic [5:0] rd;
logic [63:0] imm;
logic [2:0] dtype;
logic [2:0] sel__data;
logic [63:0] data;
logic [5:0] state;
logic [5:0] state_n;
logic cpu_to_l1__valid;
logic cpu_to_l1__ready;
logic cpu_to_l1__we;
logic [63:0] cpu_to_l1__addr;
logic [63:0] cpu_to_l1__data;
logic l1_to_cpu__valid;
logic l1_to_cpu__ready;
logic [63:0] l1_to_cpu__data;
logic l1_to_l2__valid;
logic [63:0] l1_to_l2__data;
logic l1_to_l2__credit;
logic l2_to_l1__valid;
logic [63:0] l2_to_l1__data;
logic l2_to_l1__credit;


//==============================================
// decoder__0
//==============================================
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
    .addr(rf__addr),
    .we(rf__we),
    .wr_data(rf__wr_data),
    .rd_data(rf__rd_data)
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

//==============================
// l1__0
//==============================
l1 l1__0 
(
    .clk(clk),
    .rst(rst),
    .cpu_to_l1__valid(cpu_to_l1__valid),
    .cpu_to_l1__ready(cpu_to_l1__ready),
    .cpu_to_l1__we(cpu_to_l1__we),
    .cpu_to_l1__addr(cpu_to_l1__addr),
    .cpu_to_l1__data(cpu_to_l1__data),
    .l1_to_cpu__valid(l1_to_cpu__valid),
    .l1_to_cpu__ready(l1_to_cpu__ready),
    .l1_to_cpu__data(l1_to_cpu__data),
    .l1_to_l2__valid(l1_to_l2__valid),
    .l1_to_l2__data(l1_to_l2__data),
    .l1_to_l2__credit(l1_to_l2__credit),
    .l2_to_l1__valid(l2_to_l1__valid),
    .l2_to_l1__data(l2_to_l1__data),
    .l2_to_l1__credit(l2_to_l1__credit)
);

assign cpu_to_l1__data = data;




//==============================================
// Finite State Machine
//==============================================
localparam STATE__RESET = 6'h0;
localparam STATE__IR = 6'h0;
localparam STATE__RR__RS1_TO_A = 6'h0;
localparam STATE__RR__RS2_TO_B = 6'h0;
localparam STATE__RR__C_TO_RD = 6'h0;
localparam STATE__RI__RS1_TO_A = 6'h0;
localparam STATE__RI__IMM_TO_B = 6'h0;
localparam STATE__RI__C_TO_RD = 6'h0;

always_comb begin
    rf__we = 1'b0;
    rf__addr = rs1;
    l1__we = 1'b0;
    we__pc = 1'b0;
    we__ir = 1'b0;
    we__a = 1'b0;
    we__b = 1'b0;
    we__temp = 1'b0;
    sel__data = SEL__DATA__RF;
    alu_func = FUNC__ADD;
    cpu_to_l1__valid = 1'b0;
    state_n = state;

    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        
        //==============================
        // STATE__IF
        //==============================
        STATE__IF:
        begin
            sel__data = SEL__DATA__PC;
            cpu_to_l1__valid = 1'b1;


            if (cpu_to_l1__ready) begin
                state_n = STATE__IF;
            end
        end

        //==============================
        // STATE__ID
        //==============================
        STATE__ID:
        begin
            if ((op == OP__BEQ) || (op == OP__BNE) || (op == OP__BLT) || (op == OP__BGE) || (op == OP__BLTU) || (op = OP__BGEU)) begin
                state_n = STATE__BRANCH__RS1_TO_A;
            end
            else if (op == OP__JAL) begin

            end
            state_n = STATE__IF;
        end

        //==============================
        // STATE__RR__RS1_TO_A
        //==============================
        STATE__RR__RS1_TO_A:
        begin
            sel__data = SEL__DATA__RF;
            we__a = 1'b1;
            rf__addr = rs1;
            state_n = STATE__RR__RS2_TO_B;
        end

        //==============================
        // STATE__RR__RS2_TO_B
        //==============================
        STATE__RR__RS2_TO_B:
        begin
            sel__data = SEL__DATA__RF;
            we__b = 1'b1;
            rf__addr = rs2;
            state_n = STATE__RR__C_TO_RD;
        end

        //==============================
        // STATE__RR__C_TO_RD
        //==============================
        STATE__RR__C_TO_RD:
        begin
            sel__data = SEL__DATA__C;
            rf__we = 1'b1;
            rf__addr = rd;
            alu_func = func;
            state_n = STATE__P4C__PC_TO_A;
        end

        //==============================
        // STATE__RI__RS1_TO_A
        //==============================
        STATE__RI__RS1_TO_A:
        begin
            sel__data = SEL__DATA__RF;
            we__a = 1'b1;
            rf__addr = rs1;
            state_n = STATE__RI__IMM_TO_B;
        end

        //==============================
        // STATE__RI__IMM_TO_B
        //==============================
        STATE__RI__IMM_TO_B:
        begin
            sel__data = SEL__DATA__IMM;
            we__b = 1'b1;
            state_n = STATE__RI__C_TO_RD;
        end

        //==============================
        // STATE__RI__C_TO_RD
        //==============================
        STATE__RI__C_TO_RD:
        begin
            sel__data = SEL__DATA__C;
            rf__we = 1'b1;
            rf__addr = rd;
            alu_func = func;
            state_n = STATE__P4C__PC_TO_A;
        end

        //==============================
        // STATE__PC4__PC_TO_A
        //==============================
        STATE__PC4__PC_TO_A:
        begin
            sel__data = SEL__DATA__PC;
            we__a = 1'b1;
            state_n = STATE__PC4__FOUR_TO_B;
        end

        //==============================
        // STATE__PC4__FOUR_TO_B
        //==============================
        STATE__PC4__FOUR_TO_B:
        begin
            sel__data = SEL__DATA__FOUR;
            we__b = 1'b1;
            state_n = STATE__PC4__FOUR_TO_B;
        end

        //==============================
        // STATE__PC4__C_TO_PC
        //==============================
        STATE__PC4__C_TO_PC:
        begin
            sel__data = SEL__DATA__C;
            we__pc = 1'b1;
            state_n = STATE__IF;
        end

        //==============================
        // STATE__JAL__PC_TO_A
        //==============================
        STATE__JAL__PC_TO_A:
        begin
            sel__data = SEL__DATA__PC;
            we__a = 1'b1;
            state_n = STATE__JAL__FOUR_TO_B;
        end

        //==============================
        // STATE__JAL__FOUR_TO_B
        //==============================
        STATE__JAL__FOUR_TO_B:
        begin
            sel__data = SEL__DATA__FOUR;
            we__b = 1'b1;
            state_n = STATE__JAL__C_TO_RD;
        end

        //==============================
        // STATE__JAL__C_TO_RD
        //==============================
        STATE__JAL__C_TO_RD:
        begin
            sel__data = SEL__DATA__C;
            rf__we = 1'b1;
            rf__addr = rd;
            state_n = STATE__JAL__IMM_TO_B;
        end

        //==============================
        // STATE__JAL__IMM_TO_B
        //==============================
        STATE__JAL__IMM_TO_B:
        begin
            sel__data = SEL__DATA__IMM;
            we__b = 1'b1;
            state_n = STATE__JAL__C_TO_PC;
        end

        //==============================
        // STATE__JAL__C_TO_PC
        //==============================
        STATE__JAL__C_TO_PC:
        begin
            sel__data = SEL__DATA__C;
            we__pc = 1'b1;
            state_n = STATE__IF;
        end

        //==============================
        // STATE__JALR__PC_TO_A
        //==============================
        STATE__JALR__PC_TO_A:
        begin
            sel__data = SEL__DATA__PC;
            we__a = 1'b1;
            state_n = STATE__JALR__FOUR_TO_B;
        end

        //==============================
        // STATE__JALR__FOUR_TO_B
        //==============================
        STATE__JALR__FOUR_TO_B:
        begin
            sel__data = SEL__DATA__FOUR;
            we__b = 1'b1;
            state_n = STATE__JALR__C_TO_PC__0;
        end

        //==============================
        // STATE__JALR__C_TO_PC__0
        //==============================
        STATE__JALR__C_TO_PC__0:
        begin
            sel__data = SEL__DATA__C;
            we__pc = 1'b1;
            state_n = STATE__JALR__RS1_TO_A;
        end

        //==============================
        // STATE__JALR__RS1_TO_A
        //==============================
        STATE__JAL__JAL_RS1_TO_A:
        begin
            sel__data = SEL__DATA__RF;
            we__a = 1'b1;
            rf__addr = rs1;
            state_n = STATE__JALR__IMM_TO_B;
        end

        //==============================
        // STATE__JALR__IMM_TO_B
        //==============================
        STATE__JALR__IMM_TO_B:
        begin
            sel__data = SEL__DATA__IMM;
            we__b = 1'b1;
            state_n = STATE__JALR__TEMP_TO_RD;
        end

        //==============================
        // STATE__JALR__PC_TO_RD
        //==============================
        STATE__JALR__PC_TO_RD:
        begin
            sel__data = SEL__DATA__PC;
            rf__we = 1'b1;
            rf__addr = rd;
            state_n = STATE__JALR__C_TO_PC__1;
        end

        //==============================
        // STATE__JALR__C_TO_PC__1
        //==============================
        STATE__JALR__C_TO_PC__1:
        begin
            sel__data = SEL__DATA__C;
            we__pc = 1'b1;
            state_n = STATE__IF;
        end

        //==============================
        // STATE__BRANCH__RS1_TO_A
        //==============================
        STATE__BRANCH__RS1_TO_A:
        begin
            sel__data = SEL__DATA__RF;
            we__a = 1'b1;
            rf__addr = rs1;
            state_n = STATE__BRANCH__RS2_TO_B;
        end

        //==============================
        // STATE__BRANCH__RS2_TO_B
        //==============================
        STATE__BRANCH__RS2_TO_B:
        begin
            sel__data = SEL__DATA__RF;
            we__b = 1'b1;
            rf__addr = rs2;
            state_n = STATE__BRANCH__COMPARE;
        end

        //==============================
        // STATE__BRANCH__COMPARE
        //==============================
        STATE__BRANCH__COMPARE:
        begin
            case (op)
                OP__BEQ:
                    state_n = eq ? STATE__BRANCH__PC_TO_A : STATE__P4C__PC_TO_A; 
                OP__BNE:
                    state_n = ne ? STATE__BRANCH__PC_TO_A : STATE__P4C__PC_TO_A; 
                OP__BLT:
                    state_n = lt ? STATE__BRANCH__PC_TO_A : STATE__P4C__PC_TO_A; 
                OP__BGE:
                    state_n = ge ? STATE__BRANCH__PC_TO_A : STATE__P4C__PC_TO_A; 
                OP__BLTU:
                    state_n = ltu ? STATE__BRANCH__PC_TO_A : STATE__P4C__PC_TO_A; 
                OP__BGEU:
                    state_n = geu ? STATE__BRANCH__PC_TO_A : STATE__P4C__PC_TO_A; 
            endcase
            state_n = STATE__P4C__PC_TO_A;
        end

        //==============================
        // STATE__BRANCH__PC_TO_A
        //==============================
        STATE__BRANCH__PC_TO_A:
        begin
            sel__data = SEL__DATA__PC;
            we__a = 1'b1;
            state_n = STATE__BRANCH__IMM_TO_B;
        end

        //==============================
        // STATE__BRANCH__IMM_TO_B
        //==============================
        STATE__BRANCH__IMM_TO_B:
        begin
            sel__data = SEL__DATA__IMM;
            we__b = 1'b1;
            state_n = STATE__BRANCH__C_TO_PC;
        end

        //==============================
        // STATE__BRANCH__C_TO_PC
        //==============================
        STATE__BRANCH__C_TO_PC:
        begin
            sel__data = SEL__DATA__C;
            we__pc = 1'b1;
            state_n = STATE__IF;
        end

    endcase
end


always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state_n;
    end
end




endmodule
