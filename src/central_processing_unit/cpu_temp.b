//==============================================================
// central_processing_unit
//==============================================================
module central_processing_unit
(
    input clk,
    input rst,
    output logic [63:0] IF__pc,
    input [31:0] IF__ir 
);

//==============================================
// Intruction Fetch (IF)
//==============================================   
logic [31:0] IF__ir;                           
logic [63:0] IF__pc;
logic IF__ready;

// IF pipe stage.
always_ff @(posedge clk) begin
    if (rst) IF__pc <= 64'h0;
    else if (MEM__branch) IF__pc <= MEM__branch_pc;
    else if (IF__ready) IF__pc <= IF__pc + 4;
end


//==============================================
// Instruction Decode (ID)
//==============================================  
logic ID__ready;
logic ID__stall;
logic [63:0] ID__pc;
logic [31:0] ID__ir;
logic ID__we;
logic [4:0] ID__rd;
logic [1:0] ID__sel__rd_data;
logic [3:0] ID__ctrl_flow;
logic [3:0] ID__func;
logic [63:0] ID__imm;
logic ID__sel__data_0;
logic ID__sel__data_1;
logic [4:0] ID__rs1;
logic [63:0] ID__rs1_data;
logic [4:0] ID__rs2;
logic [63:0] ID__rs2_data;

// IF/ID pipe stage.
always_ff @(posedge clk) begin
    if (rst | MEM__branch) begin
        ID__ir <= NOP;
    end
    else (ID__ready) begin
        ID__ir <= IF__ir;
        ID__pc <= IF__pc;      
    end
end

// IF/ID pipe stage.
always_ff @(posedge clk) begin
    if (rst | MEM__branch) {ID__ir} <= {NOP};
    else {ID__pc, ID__ir} <= {IF__pc, IF__ir};
end

//==============================
// decoder
//==============================
decoder decoder__0
(
    .clk(clk),
    .rst(rst),
    .ir(ID__ir),
    .we(ID__we),
    .rd(ID__rd),
    .rs1(ID__rs1),
    .rs2(ID__rs2),
    .imm(ID__imm),
    .func(ID__func),
    .ctrl_flow(ID__ctrl_flow),
    .sel__data_0(ID__sel__data_0),
    .sel__data_1(ID__sel__data_1),
    .sel__rd_data(ID__sel__rd_data)
);

//==============================
// register_file
//==============================
register_file register_file__0
(
    .clk(clk),
    .rst(rst),
    .we(WB__we),
    .rs1(ID__rs1),
    .rs1_data(ID__rs1_data),
    .rs2(ID__rs2),
    .rs2_data(ID__rs2_data),
    .rd(WB__rd),
    .rd_data(WB__rd_data)
);

//==============================================
// Execute (EX)
//==============================================
logic EX__ready;
logic [63:0] EX__pc;
logic [31:0] EX__ir;
logic EX__we;
logic [4:0] EX__rd;
logic [1:0] EX__sel__rd_data;
logic [3:0] EX__ctrl_flow;
logic [3:0] EX__func;
logic [63:0] EX__imm;
logic EX__sel__data_0;
logic EX__sel__data_1;
logic [63:0] EX__rs2_data;
logic [63:0] EX__rs1_data;
logic [63:0] EX__data_0;
logic [63:0] EX__data_1;
logic [63:0] EX__data_2;
logic EX__eq;
logic EX__ne;
logic EX__lt;
logic EX__ltu;
logic EX__ge;
logic EX__geu;

always_ff @(posedge clk) begin
    if (rst | ID__stall | MEM__branch) {EX__ir} <= {NOP};
    else {EX__pc, EX__ir, EX__we, EX__rd, EX__rs1_data, EX__rs2_data, EX__imm, EX__func, EX__ctrl_flow, EX__sel__data_0, EX__sel__data_1, EX__sel__rd_data} <= {ID__pc, ID__ir, ID__we, ID__rd, ID__rs1_data, ID__rs2_data, ID__imm, ID__func, ID__ctrl_flow ID__sel__data_0, ID__sel__data_1, ID__sel__rd_data};
end


// ID/EX pipe stage.
always_ff @(posedge clk) begin
    if (rst | ID__stall | MEM__branch) begin
        EX__we <= 1'b0;
        EX__ctrl_flow <= CTRL_FLOW__PC_PLUS_FOUR;
    end
    else if (EX__ready) begin
        EX__pc <= ID__pc;
        EX__ir <= ID__ir;
        EX__we <= ID__we;
        EX__rd <= ID__rd;
        EX__sel__rd_data <= ID__sel__rd_data;
        EX__imm <= ID__imm;
        EX__ctrl_flow <= ID__ctrl_flow;
        EX__rs2_data <= ID__rs2_data;
        EX__rs1_data <= ID__rs1_data;
        EX__func <= ID__funcc;
        EX__sel__data_0 <= ID__sel__data_0;
        EX__sel__data_1 <= ID__sel__data_1;
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
    .data_0(EX__data_0),
    .data_1(EX__data_1),
    .data_2(EX__data_2),
    .eq(EX__eq),
    .ne(EX__ne),
    .lt(EX__lt),
    .ltu(EX__ltu),
    .ge(EX__ge),
    .geu(EX__geu)
);

//==============================================
// Memory (MEM)
//==============================================
logic MEM__ready;
logic [63:0] MEM__pc;
logic [31:0] MEM__ir;
logic MEM__we;
logic [4:0] MEM__rd;
logic [1:0] MEM__sel__rd_data;
logic [3:0] MEM__ctrl_flow;
logic [63:0] MEM__imm;
logic [63:0] MEM__rs2_data;
logic [63:0] MEM__data_2;
logic [63:0] MEM__mem_data;
logic MEM__eq;
logic MEM__ne;
logic MEM__lt;
logic MEM__ltu;
logic MEM__ge;
logic MEM__geu;
logic MEM__branch;
logic [63:0] MEM__branch_pc;

// EX/MEM pipe stage.
always_ff @(posedge clk) begin
    if (rst | MEM__branch) begin
        MEM__we <= 1'b0;
        MEM__ctrl_flow <= CTRL_FLOW__PC_PLUS_FOUR;
    end
    else if (MEM__ready) begin
        MEM__pc <= EX__pc;
        MEM__ir <= EX__ir;
        MEM__we <= EX__we;
        MEM__rd <= EX__rd;
        MEM__sel__rd_data <= EX__sel__rd_data;
        MEM__imm <= EX__imm;
        MEM__ctrl_flow <= EX__ctrl_flow;
        MEM__rs2_data <= EX__rs2_data;
        MEM__data_2 <= EX__data_2;
        MEM__eq <= EX__eq;
        MEM__ne <= EX__ne;
        MEM__lt <= EX__lt;
        MEM__ltu <= EX__ltu;
        MEM__ge <= EX__ge;
        MEM__geu <= EX__geu;
    end
end


//============================== 
// Write Back (WB)
//============================== 
logic [63:0] WB__pc;
logic [31:0] WB__ir;
logic WB__we;
logic [4:0] WB__rd;
logic [1:0] WB__sel__rd_data;
logic [63:0] WB__data_2;
logic [63:0] WB__mem_data;
logic [63:0] WB__rd_data;
logic WB__ready;

// MEM/WB
always_ff @(posedge clk) begin
    if (rst) begin
        WB__we <= 1'b0;
    end
    else if (WB__ready) begin
        WB__pc <= MEM__pc;
        WB__ir <= MEM__ir;
        WB__we <= MEM__we;
        WB__rd <= MEM__rd;
        WB__sel__rd_data <= MEM__sel__rd_data;
        WB__data_2 <= MEM__data_2;
        WB__mem_data <= MEM__mem_data;
    end
end
















// 

// // EX/MEM stage
// always_ff @(posedge clk) begin
//     if (rst) {MEM__ir} <= {NOP};
//     else {MEM__pc, MEM__ir, MEM__we, MEM__rd, MEM__rs2_data, MEM__data_2, MEM__sel__rd_data} <= {EX__pc, EX__ir, EX__we, EX__rd, EX__rs2_data, EX__data_2, EX__sel__rd_data};
// end

// always_ff @(posedge clk) begin
//     MEM__pc <= EX__pc;
//     MEM__ir <= EX__ir;
// end



// // MEM/WB stage
// always_ff @(posedge clk) begin
//     if (rst) {WB__ir} <= {NOP};
//     else {WB__pc, WB__ir, WB__we, WB__rd, WB__data_2, WB__sel__rd_data} <= {MEM__pc, MEM__ir, MEM__we, MEM__rd, MEM__data_2, MEM__sel__rd_data};
// end

// IF stage
assign IF__ready = ID__ready;

// ID stage
assign ID__ready = ~ID__stall;
assign ID__stall = (EX__we & (EX__rd == ID__rs1) & ~ID__sel__data_0 & (EX__rd != 5'h0)) | (EX__we & (EX__rd == ID__rs2) & ~ID__sel__data_1 & (EX__rd != 5'h0)) |
                   (MEM__we & (MEM__rd == ID__rs1) & ~ID__sel__data_0 & (MEM__rd != 5'h0)) | (MEM__we & (MEM__rd == ID__rs2) & ~ID__sel__data_1 & (MEM__rd != 5'h0)) |
                   (WB__we & (WB__rd == ID__rs1) & ~ID__sel__data_0 & (WB__rd != 5'h0)) | (WB__we & (WB__rd == ID__rs2) & ~ID__sel__data_1 & (WB__rd != 5'h0));

// EX stage
assign EX__ready = 1'b1;
assign EX__data_0 = EX__sel__data_0 ? EX__pc : EX__rs1_data;
assign EX__data_1 = EX__sel__data_1 ? EX__imm : EX__rs2_data;

// MEM stage
assign MEM__ready = 1'b1;
assign MEM__branch_pc = (MEM__ctrl_flow == CTRL_FLOW__JALR) ? MEM__data_2 : MEM__pc + MEM__imm;
always_comb begin
    case (MEM__ctrl_flow)
        CTRL_FLOW__PC_PLUS_FOUR: MEM__branch = 1'b0;
        CTRL_FLOW__JAL: MEM__branch = 1'b1;
        CTRL_FLOW__JALR: MEM__branch = 1'b1;
        CTRL_FLOW__BEQ: MEM__branch = MEM__eq;
        CTRL_FLOW__BNE: MEM__branch = MEM__ne;
        CTRL_FLOW__BLT: MEM__branch = MEM__lt;
        CTRL_FLOW__BLTU: MEM__branch = MEM__ltu;
        CTRL_FLOW__BGE: MEM__branch = MEM__ge;
        CTRL_FLOW__BGEU: MEM__branch = MEM__geu;
    endcase
end

// WB stage
always_comb begin
    case (WB__sel__rd_data)
        SEL__RD_DATA__ALU: WB__rd_data = WB__data_2;
        SEL__RD_DATA__MEM: WB__rd_data = WB__mem_data;
        SEL__RD_DATA__PC_PLUS_FOUR: WB__rd_data = WB__pc + 4;
    endcase
end








endmodule

// logic [63:0] pc;





// //==============================
// // register_file_0
// //==============================
// register_file register_file_0
// (
//     .clk(clk),
//     .rst(rst),
//     .we(WB__we),
//     .rs1(ID__rs1),
//     .rs1_data(rs1_data),
//     .rs2(ID__rs2),
//     .rs2_data(ID__rs2_data),
//     .rd(WB__rd),
//     .rd_data(WB__rd_data)
// );


// always_ff @(posedge clk) begin
//  {EX__ir, EX__rs1_data, EX__rs2_data, EX__imm, ID__rd, ID__we} <= {ID__ir, ID__rs1_data, ID__rs2_data, ID__imm, ID__rd, ID__we};
// end


// endmodule


// //==============================================
// // pipe
// //==============================================
// module pipe
// (
//  input clk,
//     input rst,
//     input in__valid,
//     input in__ready,
//     input in__data,
//     output out__valid,
//     input out__ready,
//     output out__data
// );


// endmodule