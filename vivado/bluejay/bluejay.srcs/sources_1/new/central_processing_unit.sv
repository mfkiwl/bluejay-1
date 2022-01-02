//==============================================
// central_processing_unit
//==============================================
module central_processing_unit
(
    input clk,
    input rst,
    input [31:0] ir
);

// instruction fetch (IF)
logic [63:0] IF__pc;
logic [31:0] IF__ir;

// instruction decode (ID)
logic [63:0] ID__pc;
logic [31:0] ID__ir;

logic ID__we;
logic [4:0] ID__rd;
logic ID__sel__rd_data;
logic [63:0] ID__imm;
logic [3:0] ID__ctrl_flow;
logic [63:0] ID__rs2_data;
logic [63:0] ID__rs1_data;
logic [3:0] ID__func;
logic ID__sel__data_0;
logic ID__sel__data_1;

logic [4:0] ID__rs1;
logic [4:0] ID__rs2;


// execute (EX)
logic [63:0] EX__pc;
logic [31:0] EX__ir;
logic EX__we;
logic [4:0] EX__rd;
logic EX__sel__rd_data;
logic [63:0] EX__imm;
logic [3:0] EX__ctrl_flow;
logic [63:0] EX__rs2_data;
logic [63:0] EX__rs1_data;
logic [3:0] EX__func;
logic EX__sel__data_0;
logic EX__sel__data_1;
logic [63:0] EX__data_0;
logic [63:0] EX__data_1;
logic [63:0] EX__data_2;

// memory (MEM)
logic [63:0] MEM__pc;
logic [31:0] MEM__ir;
logic MEM__we;
logic [4:0] MEM__rd;
logic MEM__sel__rd_data;
logic [63:0] MEM__imm;
logic [3:0] MEM__ctrl_flow;
logic [63:0] MEM__rs2_data;
logic [63:0] MEM__data_2;

// write back (WB)
logic [63:0] WB__pc;
logic [31:0] WB__ir;
logic WB__we;
logic [4:0] WB__rd;
logic WB__sel__rd_data;
logic [63:0] WB__data_2;
logic [63:0] WB__rd_data;
logic WB__sel__rd_data;


// always_ff @(posedge clk) begin
//     if (rst) IF__pc <= 32'h0;
//     else IF__pc <= (MEM__sel__pc == 2'h2) ? MEM__data_2 : (MEM__sel__pc == 2'h1) ? MEM__pc + MEM__imm : IF__pc + 4;
// end

// IF
always_ff @(posedge clk) begin
    IF__pc <= rst ? 32'h0 : IF__pc + 4;
end

// IF/ID stage
always_ff @(posedge clk) begin
    ID__pc <= IF__pc;
    ID__ir <= rst ? 32'h00_00_00_33 : IF__ir;
end

// ID/EX
always_ff @(posedge clk) begin
    EX__pc <= ID__pc;
    EX__ir <= ID__ir;
    EX__we <= rst ? 1'b0 : ID__we;
    EX__rd <= ID__rd;
    EX__sel__rd_data <= ID__sel__rd_data;
    EX__imm <= ID__imm;
    EX__ctrl_flow <= ID__ctrl_flow;
    EX__rs2_data <= ID__rs2_data;
    EX__rs1_data <= ID__rs1_data;
    EX__func <= ID__func;
    EX__sel__data_0 <= ID__sel__data_0;
    EX__sel__data_1 <= ID__sel__data_1;
end

// EX/MEM
always_ff @(posedge clk) begin
    MEM__pc <= EX__pc;
    MEM__ir <= EX__ir;
    MEM__we <= rst ? 1'b0 : EX__we;
    MEM__rd <= EX__rd;
    MEM__sel__rd_data <= EX__sel__rd_data;
    MEM__imm <= EX__imm;
    MEM__ctrl_flow <= EX__ctrl_flow;
    MEM__rs2_data <= EX__rs2_data;
    MEM__data_2 <= EX__data_2;
end

// MEM/WB
always_ff @(posedge clk) begin
    WB__pc <= MEM__pc;
    WB__ir <= MEM__ir;
    WB__we <= rst ? 1'b0 : MEM__we;
    WB__rd <= MEM__rd;
    WB__sel__rd_data <= MEM__sel__rd_data;
end


// // IF/ID stage
// always_ff @(posedge clk) begin
//     if (rst) {ID__ir} <= {32'h00_00_00_33};
//     else {ID__pc, ID__ir} <= {IF__pc, IF__ir};
// end

// 
// always_ff @(posedge clk) begin
//     if (rst) {EX__ir} <= {32'h00_00_00_33};
//     else {EX__pc, EX__ir, EX__we, EX__rd, EX__rs1_data, EX__rs2_data, EX__imm, EX__func, EX__ctrl_flow, EX__sel__data_0, EX__sel__data_1, EX__sel__rd_data} <= {ID__pc, ID__ir, ID__we, ID__rd, ID__rs1_data, ID__rs2_data, ID__imm, ID__func, ID__ctrl_flow ID__sel__data_0, ID__sel__data_1, ID__sel__rd_data};
// end

// // EX/MEM stage
// always_ff @(posedge clk) begin
//     if (rst) {MEM__ir} <= {32'h00_00_00_33};
//     else {MEM__pc, MEM__ir, MEM__we, MEM__rd, MEM__rs2_data, MEM__data_2, MEM__sel__rd_data} <= {EX__pc, EX__ir, EX__we, EX__rd, EX__rs2_data, EX__data_2, EX__sel__rd_data};
// end

// always_ff @(posedge clk) begin
//     MEM__pc <= EX__pc;
//     MEM__ir <= EX__ir;
// end



// // MEM/WB stage
// always_ff @(posedge clk) begin
//     if (rst) {WB__ir} <= {32'h00_00_00_33};
//     else {WB__pc, WB__ir, WB__we, WB__rd, WB__data_2, WB__sel__rd_data} <= {MEM__pc, MEM__ir, MEM__we, MEM__rd, MEM__data_2, MEM__sel__rd_data};
// end

// IF stage
assign IF__ir = ir;


// // EX stage
// assign EX__data_0 = EX__sel__data_0 ? EX__pc : EX__rs1_data;
// assign EX__data_1 = EX__sel__data_1 ? EX__imm : EX__rs2_data;
// assign EX__pc_plus_imm = EX__pc + EX__imm;

// // WB stage
// assign WB__rd_data = WB__sel__rd_data ? WB__mem_data ? WB__data_2;

//==============================
// decoder__0
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
    .sel__data_1(ID__sel__data_1)
);

//==============================
// register_file__0
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

//==============================
// arithmetic_logic_unit__0
//==============================
arithmetic_logic_unit arithmetic_logic_unit__0
(
    .clk(clk),
    .rst(rst),
    .func(EX__func),
    .data_0(EX__data_0),
    .data_1(EX__data_1),
    .data_2(EX__data_2)
);


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
// 	{EX__ir, EX__rs1_data, EX__rs2_data, EX__imm, ID__rd, ID__we} <= {ID__ir, ID__rs1_data, ID__rs2_data, ID__imm, ID__rd, ID__we};
// end


// endmodule


// //==============================================
// // pipe
// //==============================================
// module pipe
// (
// 	input clk,
//     input rst,
//     input in__valid,
//     input in__ready,
//     input in__data,
//     output out__valid,
//     input out__ready,
//     output out__data
// );


// endmodule