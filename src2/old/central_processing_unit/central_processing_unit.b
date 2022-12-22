//==============================================
// central_processing_unit
//==============================================
module central_processing_unit
(
    input clk,
    input rst,

    output logic il1_to_mem__valid,
    output logic [63:0] il1_to_mem__data,
    input il1_to_mem__credit,
    input mem_to_il1__valid,
    input [63:0] mem_to_il1__data,
    output mem_to_il1__credit,

    output logic dl1_to_mem__valid,
    output logic [63:0] dl1_to_mem__data,
    input dl1_to_mem__credit,
    input mem_to_dl1__valid,
    input [63:0] mem_to_dl1__data,
    output mem_to_dl1__credit
);


// IF
logic IF__valid;
logic IF__ready;                         
logic [63:0] IF__pc;
logic [63:0] IF__pc_n;
logic [31:0] IF__ir;
logic [63:0] IF__il1__rd_data;
logic IF__il1__valid;
logic IF__il1__ready;
logic [39:0] IF__il1__addr;
logic IF__il1__rw;
logic [63:0] IF__il1__wr_data;
logic [2:0] IF__il1__dtype;
logic IF__il1__hit;
logic [63:0] IF__il1__rd_data;

// ID
logic ID__valid;
logic ID__ready;
logic [63:0] ID__pc;
logic [31:0] ID__ir;
logic [5:0] ID__op;
logic [3:0] ID__func;
logic [4:0] ID__rd_addr__0;
logic [4:0] ID__rd_addr__1;
logic [4:0] ID__wr_addr;
logic [63:0] ID__imm;
logic ID__we;
logic ID__sel__a;
logic ID__sel__b;
logic [1:0] ID__sel__wr_data;
logic ID__mem_valid;
logic ID__mem_rw;
logic [2:0] ID__mem_dtype;
logic [63:0] ID__rd_data__0;
logic [63:0] ID__rd_data__1;

// EX
logic EX__valid;
logic EX__ready;
logic [63:0] EX__pc;
logic [31:0] EX__ir;
logic [5:0] EX__op;
logic [3:0] EX__func;
logic [4:0] EX__wr_addr;
logic [63:0] EX__imm;
logic EX__we;
logic EX__sel__a;
logic EX__sel__b;
logic [1:0] EX__sel__wr_data;
logic EX__mem_valid;
logic EX__mem_rw;
logic [2:0] EX__mem_dtype;
logic [63:0] EX__rd_data__0;
logic [63:0] EX__rd_data__1;
logic [63:0] EX__a;
logic [63:0] EX__b;
logic [63:0] EX__c;
logic EX__eq;
logic EX__ne;
logic EX__lt;
logic EX__ltu;
logic EX__ge;
logic EX__geu;
logic EX__take_branch;

// MEM
logic MEM__valid;
logic MEM__ready;
logic [63:0] MEM__pc;
logic [31:0] MEM__ir;
logic [5:0] MEM__op;
logic [4:0] MEM__wr_addr;
logic MEM__we;
logic [1:0] MEM__sel__wr_data;
logic MEM__mem_valid;
logic [63:0] MEM__rd_data__1;
logic [63:0] MEM__c;
logic MEM__mem_valid;
logic MEM__mem_rw;
logic [2:0] MEM__mem_dtype;
logic MEM__take_branch;
logic [63:0] MEM__mem_rd_data;
logic MEM__dl1__valid;
logic MEM__dl1__ready;
logic [39:0] MEM__dl1__addr;
logic MEM__dl1__rw;
logic [63:0] MEM__dl1__wr_data;
logic [2:0] MEM__dl1__dtype;
logic MEM__dl1__hit;
logic [63:0] MEM__dl1__rd_data;

// WB
logic WB__valid;
logic WB__ready;
logic [63:0] WB__pc;
logic [31:0] WB__ir;
logic [5:0] WB__op;
logic [4:0] WB__wr_addr;
logic WB__we;
logic [1:0] WB__sel__wr_data;
logic [63:0] WB__rd_data__1;
logic [63:0] WB__c;
logic WB__take_branch;
logic [63:0] WB__mem_rd_data;
logic [63:0] WB__wr_data;

//==============================================
// Intruction Fetch (IF)
//==============================================
// IF pipe stage (valid).
always_ff @(posedge clk) begin
    if (rst) begin
        IF__valid <= 1'b1;
    end
    else begin
        IF__valid <= IF__ready ? WB__valid : IF__valid;     
    end
end

// IF pipe stage (data).
always_ff @(posedge clk) begin
    if (rst) begin
        IF__pc <= 64'h0;
    end
    else begin
        if (IF__ready & WB__valid) begin
            IF__pc <= IF__pc_n;
        end        
    end
end

// Determine the next pc.
always_comb begin
    IF__pc_n = IF__pc + 4;

    if ((WB__op == OP__BEQ) | (WB__op == OP__BNE) | (WB__op == OP__BLT) | (WB__op == OP__BGE) | (WB__op == OP__BLTU) | (WB__op == OP__BGEU)) begin
        IF__pc_n = WB__take_branch ? WB__c : IF__pc + 4;
    end
    else if ((WB__op == OP__JAL) | (WB__op == OP__JALR)) begin
        IF__pc_n = WB__c;
    end
end

// IF ready signal.
// assign IF__ready = ID__ready;

// il1
logic cpu_to_il1__valid;
logic cpu_to_il1__ready;
logic [39:0] cpu_to_il1__addr;
logic cpu_to_il1__rw;
logic [63:0] cpu_to_il1__data;
logic [2:0] cpu_to_il1__dtype;
logic il1_to_cpu__valid;
logic il1_to_cpu__ready;
logic [63:0] il1_to_cpu__data;
logic il1_to_mem__valid;
logic il1_to_mem__ready;
logic [63:0] il1_to_mem__data;
logic mem_to_il1__valid;
logic mem_to_il1__ready;
logic [63:0] mem_to_il1__data;

assign IF__il1__valid = IF__valid;
assign IF__ready = IF__valid ? (ID__ready & IF__il1__hit) : ID__ready;
assign IF__il1__addr = IF__pc;
assign IF__il1__rw = 1'b0;
assign IF__il1__wr_data = 0;
assign IF__il1__dtype = DTYPE__WORD_UNSIGNED;
assign IF__ir = IF__il1__rd_data[31:0];



//==============================
// il1
//==============================
l1 il1
(
    .clk(clk),
    .rst(rst),
    .valid(IF__il1__valid),
    .ready(IF__il1__ready),
    .addr(IF__il1__addr),
    .rw(IF__il1__rw),
    .wr_data(IF__il1__wr_data),
    .dtype(IF__il1__dtype),
    .hit(IF__il1__hit),
    .rd_data(IF__il1__rd_data),
    .l1_to_mem__valid(il1_to_mem__valid),
    .l1_to_mem__data(il1_to_mem__data),
    .l1_to_mem__credit(il1_to_mem__credit),
    .mem_to_l1__valid(mem_to_il1__valid),
    .mem_to_l1__data(mem_to_il1__data),
    .mem_to_l1__credit(mem_to_il1__credit)
);


// logic IF__il1__valid;
// logic IF__il1__ready;
// logic [39:0] IF__il1__addr;
// logic IF__il1__rw;
// logic [63:0] IF__il1__wr_data;
// logic [63:0] IF__il1__rd_data;
// logic IF__il1__hit;
// logic [2:0] IF__il1__dtype;
// logic IF__il1__l1_to_mem__valid;
// logic IF__il1__l1_to_mem__ready;
// logic [63:0] IF__il1__l1_to_mem__data;
// logic IF__il1__mem_to_l1__valid;
// logic IF__il1__mem_to_l1__ready;
// logic [63:0] IF__il1__mem_to_l1__data;



//==============================================
// Instruction Decode (ID)
//==============================================  
// IF/ID pipe stage (valid).
always_ff @(posedge clk) begin
    if (rst) begin
        ID__valid <= 1'b0;
    end
    else begin
        ID__valid <= ID__ready ? (IF__valid & IF__il1__hit) : ID__valid;
    end
end

// IF/ID pipe stage (data).
always_ff @(posedge clk) begin
    if ((IF__valid & IF__il1__hit) & ID__ready) begin
        ID__pc <= IF__pc;
        ID__ir <= IF__ir;
    end
end

//==============================
// decoder
//==============================
decoder decoder__0
(
    .clk(clk),
    .rst(rst),
    .ir(ID__ir),
    .op(ID__op),
    .func(ID__func),
    .rd_addr__0(ID__rd_addr__0),
    .rd_addr__1(ID__rd_addr__1),
    .wr_addr(ID__wr_addr),
    .imm(ID__imm),
    .we(ID__we),
    .sel__a(ID__sel__a),
    .sel__b(ID__sel__b),
    .sel__wr_data(ID__sel__wr_data),
    .mem_valid(ID__mem_valid),
    .mem_rw(ID__mem_rw),
    .mem_dtype(ID__mem_dtype)
);

//==============================
// register_file
//==============================
register_file register_file__0
(
    .clk(clk),
    .rst(rst),
    .we(WB__we & WB__valid),
    .rd_addr__0(ID__rd_addr__0),
    .rd_data__0(ID__rd_data__0),
    .rd_addr__1(ID__rd_addr__1),
    .rd_data__1(ID__rd_data__1),
    .wr_addr(WB__wr_addr),
    .wr_data(WB__wr_data)
);

// ID ready signal.
assign ID__ready = EX__ready;

//==============================================
// Execute (EX)
//==============================================
// ID/EX pipe stage (valid).
always_ff @(posedge clk) begin
    if (rst) begin
        EX__valid <= 1'b0;
    end
    else begin
        EX__valid <= EX__ready ? ID__valid : EX__valid;
    end
end

// ID/EX pipe stage (data).
always_ff @(posedge clk) begin
    if (ID__valid & EX__ready) begin
        EX__pc <= ID__pc;
        EX__ir <= ID__ir;
        EX__op <= ID__op;
        EX__func <= ID__func;
        EX__wr_addr <= ID__wr_addr;
        EX__imm <= ID__imm;
        EX__we <= ID__we;
        EX__sel__a <= ID__sel__a;
        EX__sel__b <= ID__sel__b;
        EX__sel__wr_data <= ID__sel__wr_data;
        EX__mem_valid <= ID__mem_valid;
        EX__mem_rw <= ID__mem_rw;
        EX__mem_dtype <= ID__mem_dtype;
        EX__rd_data__0 <= ID__rd_data__0;
        EX__rd_data__1 <= ID__rd_data__1;
    end
end

//==============================
// arithmetic_logic_unit
//==============================
arithmetic_logic_unit arithmetic_logic_unit__0
(
    .clk(clk),
    .rst(rst),
    .func(EX__func),
    .a(EX__a),
    .b(EX__b),
    .c(EX__c)
);

//==============================
// comparator
//==============================
comparator comparator__0
(
    .clk(clk),
    .rst(rst),
    .a(EX__rd_data__0),
    .b(EX__rd_data__0),
    .eq(EX__eq),
    .ne(EX__ne),
    .lt(EX__lt),
    .ltu(EX__ltu),
    .ge(EX__ge),
    .geu(EX__geu)
);

// Select a (input to ALU).
always_comb begin
    case (EX__sel__a)
        SEL__A__RD_DATA__0:
        begin
            EX__a = EX__rd_data__0;
        end
        SEL__A__PC:
        begin
            EX__a = EX__pc;
        end
    endcase
end

// Select b (input to ALU).
always_comb begin
    case (EX__sel__b)
        SEL__B__RD_DATA__1:
        begin
            EX__b = EX__rd_data__1;
        end
        SEL__B__IMM:
        begin
            EX__b = EX__imm;
        end
    endcase
end

// If the instruction is a branch, decide if the branch should be taken.
always_comb begin
    EX__take_branch = 1'b0;
    case (EX__op)
        OP__BEQ:
        begin
            EX__take_branch = EX__eq;
        end
        OP__BNE:
        begin
            EX__take_branch = EX__ne;
        end        
        OP__BLT:
        begin
            EX__take_branch = EX__lt;
        end        
        OP__BGE:
        begin
            EX__take_branch = EX__ge;
        end        
        OP__BLTU:
        begin
            EX__take_branch = EX__ltu;
        end        
        OP__BGEU:
        begin
            EX__take_branch = EX__geu;
        end
    endcase
end

// EX ready signal.
assign EX__ready = MEM__ready;

//==============================================
// Memory (MEM)
//==============================================
// EX/MEM pipe stage (valid).
always_ff @(posedge clk) begin
    if (rst) begin
        MEM__valid <= 1'b0;
    end
    else begin
        MEM__valid <= MEM__ready ? EX__valid : MEM__valid;
    end
end

// EX/MEM pipe stage (data).
always_ff @(posedge clk) begin
    if (EX__valid & MEM__ready) begin
        MEM__pc <= EX__pc;
        MEM__ir <= EX__ir;
        MEM__op <= EX__op;
        MEM__wr_addr <= EX__wr_addr;
        MEM__we <= EX__we;
        MEM__sel__wr_data <= EX__sel__wr_data;
        MEM__mem_valid <= EX__mem_valid;
        MEM__mem_rw <= EX__mem_rw;
        MEM__mem_dtype <= EX__mem_dtype;
        MEM__rd_data__1 <= EX__rd_data__1;
        MEM__c <= EX__c;
        MEM__take_branch <= EX__take_branch;
    end
end

//==============================
// dl1
//==============================
l1 dl1
(
    .clk(clk),
    .rst(rst),
    .valid(MEM__dl1__valid),
    .ready(MEM__dl1__ready),
    .addr(MEM__dl1__addr),
    .rw(MEM__dl1__rw),
    .wr_data(MEM__dl1__wr_data),
    .dtype(MEM__dl1__dtype),
    .hit(MEM__dl1__hit),
    .rd_data(MEM__dl1__rd_data),
    .l1_to_mem__valid(dl1_to_mem__valid),
    .l1_to_mem__data(dl1_to_mem__data),
    .l1_to_mem__credit(dl1_to_mem__credit),
    .mem_to_l1__valid(mem_to_dl1__valid),
    .mem_to_l1__data(mem_to_dl1__data),
    .mem_to_l1__credit(mem_to_dl1__credit)
);

assign MEM__dl1__valid = MEM__valid & MEM__mem_valid;
assign MEM__ready = (MEM__valid & MEM__mem_valid) ? (WB__ready & MEM__dl1__hit) : WB__ready;
assign MEM__dl1__addr = MEM__c;
assign MEM__dl1__rw = MEM__mem_rw;
assign MEM__dl1__wr_data = MEM__rd_data__1;
assign MEM__dl1__dtype = MEM__mem_dtype;
assign MEM__mem_rd_data = MEM__dl1__rd_data;


//==============================================
// Write Back (WB)
//==============================================
// EX/MEM pipe stage (valid).
always_ff @(posedge clk) begin
    if (rst) begin
        WB__valid <= 1'b0;
    end
    else begin
        WB__valid <= WB__ready ? ((MEM__valid & MEM__mem_valid) ? MEM__dl1__hit : MEM__valid) : WB__valid;
    end
end

// EX/MEM pipe stage (data).
always_ff @(posedge clk) begin
    if (((MEM__valid & MEM__mem_valid) ? MEM__dl1__hit : MEM__valid) & WB__ready) begin
        WB__pc <= MEM__pc;
        WB__ir <= MEM__ir;
        WB__op <= MEM__op;
        WB__wr_addr <= MEM__wr_addr;
        WB__we <= MEM__we;
        WB__sel__wr_data <= MEM__sel__wr_data;
        WB__c <= MEM__c;
        WB__mem_rd_data <= MEM__mem_rd_data;
        WB__take_branch <= MEM__take_branch;
    end
end

// Select wr_data (the data to be writen back to the register file).
always_comb begin
    case (WB__sel__wr_data)
        SEL__WD_DATA__C:
        begin
            WB__wr_data = WB__c;
        end
        SEL__WD_DATA__MEM_RD_DATA:
        begin
            WB__wr_data = WB__mem_rd_data;
        end
        SEL__WD_DATA__PC_PLUS_FOUR:
        begin
            WB__wr_data = WB__pc + 4;
        end
    endcase
end

// WB ready signal.
assign WB__ready = 1'b1;

//==============================================
// Finite State Machine
//==============================================
// localparam STATE__RESET = 2'h0;
// localparam STATE__FETCH = 2'h1;
// localparam STATE__WAIT = 2'h2;

// logic [1:0] state;
// logic [1:0] state_n;

// always_ff @(posedge clk) begin
//     if (rst) begin
//         state <= STATE__RESET;
//     end
//     else begin
//         state <= state_n;
//     end
// end

// always_comb begin
//     IF__valid = 1'b0;

//     case (state)
//         STATE__RESET:
//         begin
//             if (IF__ready) begin
//                 state_n = STATE__FETCH;
//             end
//         end
//         STATE__FETCH:
//         begin
//             state_n = STATE__WAIT;
//             IF__valid = 1'b1;
//         end
//         STATE__WAIT:
//         begin
//             state_n = WB__valid ? STATE__FETCH : STATE__WAIT;
//         end
//     endcase
// end






endmodule
