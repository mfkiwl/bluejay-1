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
localparam STATE__RESET = 6'h0;
localparam STATE__IF__0 = 6'h1;
localparam STATE__IF__1 = 6'h2;
localparam STATE__ID = 6'h3;
localparam STATE__LOAD__0 = 6'h4;
localparam STATE__LOAD__1 = 6'h5;
localparam STATE__LOAD__2 = 6'h6;
localparam STATE__STORE__0 = 6'h7;
localparam STATE__STORE__1 = 6'h8;
localparam STATE__STORE__2 = 6'h9;
localparam STATE__ALU__0 = 6'ha;
localparam STATE__ALU__1 = 6'hb;
localparam STATE__ALU__2 = 6'hc;
localparam STATE__ALUI__0 = 6'hd;
localparam STATE__ALUI__1 = 6'he;
localparam STATE__AUIPC = 6'hf;
localparam STATE__JALR__0 = 6'h10;
localparam STATE__JALR__1 = 6'h11;
localparam STATE__JALR__2 = 6'h12;
localparam STATE__JAL__0 = 6'h13;
localparam STATE__JAL__1 = 6'h14;
localparam STATE__BRANCH__0 = 6'h15;
localparam STATE__BRANCH__1 = 6'h16;
localparam STATE__BRANCH__2 = 6'h17;
localparam STATE__BRANCH__3 = 6'h18;
localparam STATE__ECALL = 6'h19;
localparam STATE__EBREAK = 6'h1a;
localparam STATE__FENCE = 6'h1b;
localparam STATE__FENCE_I = 6'h1c;
localparam STATE__LUI = 6'h1d;
localparam STATE__PC4 = 6'h1e;


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
    alu_func = 4'h0;
    a = rd_data__0;
    b = imm;
    cpu_to_l1__valid = 1'b0;
    cpu_to_l1__addr = pc;
    cpu_to_l1__data = rd_data__1;
    cpu_to_l1__we = 1'b0;
    cpu_to_l1__dtype = 3'h0;
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
            cpu_to_l1__dtype = 3'h1;

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
            if ((op == 6'h2c) || (op == 6'h2d) || (op == 6'h2e) || (op == 6'h2f) || (op == 6'h30) || (op == 6'h31)) begin
                state__n = STATE__BRANCH__0;
            end
            else if (op == 6'h33) begin
                state__n = STATE__JAL__0;
            end
            else if (op == 6'h32) begin
                state__n = STATE__JALR__0;
            end
            else if ((op == 6'h1c) || (op == 6'h27) || (op == 6'h25) || (op == 6'h24) || (op == 6'h1e) || (op == 6'h29) || (op == 6'h1f) || (op == 6'h20) || (op == 6'h23) || (op == 6'h2b) || (op == 6'h22) || (op == 6'h2a) || (op == 6'h1d) || (op == 6'h28) || (op == 6'h21)) begin
                state__n = STATE__ALU__0;
            end
            else if ((op == 6'ha) || (op == 6'h14) || (op == 6'h12) || (op == 6'h11) || (op == 6'hb) || (op == 6'h15) || (op == 6'hc) || (op == 6'hd) || (op == 6'h10) || (op == 6'h17) || (op == 6'hf) || (op == 6'h16) || (op == 6'he)) begin
                state__n = STATE__ALUI__0;
            end
            else if ((op == 6'h1) || (op == 6'h5) || (op == 6'h2) || (op == 6'h6) || (op == 6'h3) || (op == 6'h7) || (op == 6'h4)) begin
                state__n = STATE__LOAD__0;
            end
            else if ((op == 6'h18) || (op == 6'h19) || (op == 6'h1a) || (op == 6'h1b)) begin
                state__n = STATE__STORE__0;
            end
            else if (op == 6'h13) begin
                state__n = STATE__AUIPC;
            end
            else if (op == 6'h34) begin
                state__n = STATE__ECALL;
            end
            else if (op == 6'h35) begin
                state__n = STATE__EBREAK;
            end
            else if (op == 6'h8) begin
                state__n = STATE__FENCE;
            end
            else if (op == 6'h9) begin
                state__n = STATE__FENCE_I;
            end
            else if (op == 6'h26) begin
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
            alu_func = 4'h0;
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
                6'h2c:
                    state__n = eq ? STATE__BRANCH__3 : STATE__PC4; 
                6'h2d:
                    state__n = ne ? STATE__BRANCH__3 : STATE__PC4; 
                6'h2e:
                    state__n = lt ? STATE__BRANCH__3 : STATE__PC4; 
                6'h2f:
                    state__n = ge ? STATE__BRANCH__3 : STATE__PC4; 
                6'h30:
                    state__n = ltu ? STATE__BRANCH__3 : STATE__PC4; 
                6'h31:
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
            state__n = STATE__FENCE;
        end

        //==============================
        // STATE__FENCE_I
        //==============================
        STATE__FENCE_I:
        begin
            state__n = STATE__FENCE_I;
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
        pc <= 64'h10000;
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
