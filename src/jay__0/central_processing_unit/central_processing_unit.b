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
logic [4:0] addr;
logic we;
logic [63:0] wr_data;
logic [63:0] rd_data;
logic mem__valid;
logic [4:0] mem__addr;
logic mem__we;
logic [63:0] mem__rd_data;
logic [63:0] mem__wr_data;
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
logic [2:0] sel_data;
logic [63:0] data;
logic [5:0] state;
logic [5:0] state_n;


//==============================================
// decoder
//==============================================
module decoder
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
// register_file
//==============================
memory #(.WIDTH(64), .DEPTH(32), .DEPTH__LOG2(5)) register_file
(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .we(we),
    .wr_data(wr_data),
    .rd_data(rd_data)
);

//==============================
// alu
//==============================
arithmetic_logic_unit alu
(
    .clk(clk),
    .rst(rst),
    .func(alu_func),
    .a(a),
    .b(b),
    .c(c)
);

//==============================
// comp
//==============================
comparator comp
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
localparam STATE__RR__RS1_TO_A = 6'h0;
localparam STATE__RR__RS2_TO_B = 6'h0;
localparam STATE__RR__C_TO_RD = 6'h0;
localparam STATE__RESET = 6'h0;
localparam STATE__RESET = 6'h0;
localparam STATE__RESET = 6'h0;
localparam STATE__RESET = 6'h0;
localparam STATE__RESET = 6'h0;
localparam STATE__RESET = 6'h0;
localparam STATE__RESET = 6'h0;

always_comb begin
    we = 1'b0;
    we__pc = 1'b0;
    we__ir = 1'b0;
    we__a = 1'b0;
    we__b = 1'b0;


    case (state)
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end

        //==============================
        // STATE__RR__RS1_TO_A
        //==============================
        STATE__RR__RS1_TO_A:
        begin
            we__a = 1'b1;
            sel_data = SEL_DATA__RF;
            addr = rs1;
            state_n = STATE__RR__RS2_TO_B;
        end

        //==============================
        // STATE__RR__RS2_TO_B
        //==============================
        STATE__RESET:
        begin
            we__b = 1'b1;
            sel_data = SEL_DATA__RF;
            addr = rs2;
            state_n = STATE__RR__C_TO_RD;
        end

        //==============================
        // STATE__RR__C_TO_RD
        //==============================
        STATE__RR__C_TO_RD:
        begin
            we = 1'b1;
            sel_data = SEL_DATA__C;
            addr = rd;
            state_n = STATE__IF;
        end

        //==============================
        // STATE__PC4__PC_TO_A
        //==============================
        STATE__RESET:
        begin
            state_n = STATE__PC4__;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
            state_n = STATE__IF;
        end
        STATE__RESET:
        begin
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
