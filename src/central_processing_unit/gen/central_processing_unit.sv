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

assign IF__ready = ID__ready;


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
    if (rst | MEM__branch) {ID__ir} <= {32'h00_00_00_33};
    else if (ID__ready) {ID__pc, ID__ir} <= {IF__pc, IF__ir};
end

assign ID__ready = ~ID__stall;
assign ID__stall = (EX__we & (EX__rd == ID__rs1) & ~ID__sel__data_0 & (EX__rd != 5'h0)) | (EX__we & (EX__rd == ID__rs2) & ~ID__sel__data_1 & (EX__rd != 5'h0)) |
                   (MEM__we & (MEM__rd == ID__rs1) & ~ID__sel__data_0 & (MEM__rd != 5'h0)) | (MEM__we & (MEM__rd == ID__rs2) & ~ID__sel__data_1 & (MEM__rd != 5'h0)) |
                   (WB__we & (WB__rd == ID__rs1) & ~ID__sel__data_0 & (WB__rd != 5'h0)) | (WB__we & (WB__rd == ID__rs2) & ~ID__sel__data_1 & (WB__rd != 5'h0));

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

// ID/EX pipe stage.
always_ff @(posedge clk) begin
    if (rst | ID__stall | MEM__branch) {EX__we, EX__ctrl_flow} <= {1'b0, 4'h0};
    else if (EX__ready) {EX__pc, EX__ir, EX__we, EX__rd, EX__rs1_data, EX__rs2_data, EX__imm, EX__func, EX__ctrl_flow, EX__sel__data_0, EX__sel__data_1, EX__sel__rd_data} <= {ID__pc, ID__ir, ID__we, ID__rd, ID__rs1_data, ID__rs2_data, ID__imm, ID__func, ID__ctrl_flow, ID__sel__data_0, ID__sel__data_1, ID__sel__rd_data};
end

assign EX__ready = 1'b1;
assign EX__data_0 = EX__sel__data_0 ? EX__pc : EX__rs1_data;
assign EX__data_1 = EX__sel__data_1 ? EX__imm : EX__rs2_data;

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
    if (rst | MEM__branch) {MEM__we, MEM__ctrl_flow} <= {1'b0, 4'h0};
    else if (MEM__ready) {MEM__pc, MEM__ir, MEM__we, MEM__rd, MEM__rs2_data, MEM__data_2, MEM__sel__rd_data, MEM__eq, MEM__ne, MEM__lt, MEM__ltu, MEM__ge, MEM__geu} <= {EX__pc, EX__ir, EX__we, EX__rd, EX__rs2_data, EX__data_2, EX__sel__rd_data, EX__eq, EX__ne, EX__lt, EX__ltu, EX__ge, EX__geu};
end

assign MEM__ready = 1'b1;
assign MEM__branch_pc = (MEM__ctrl_flow == 4'h2) ? MEM__data_2 : MEM__pc + MEM__imm;
always_comb begin
    case (MEM__ctrl_flow)
        4'h0: MEM__branch = 1'b0;
        4'h1: MEM__branch = 1'b1;
        4'h2: MEM__branch = 1'b1;
        4'h3: MEM__branch = MEM__eq;
        4'h4: MEM__branch = MEM__ne;
        4'h5: MEM__branch = MEM__lt;
        4'h6: MEM__branch = MEM__ltu;
        4'h7: MEM__branch = MEM__ge;
        4'h8: MEM__branch = MEM__geu;
    endcase
end

//==============================================
// Write Back (WB)
//==============================================
logic [63:0] WB__pc;
logic [31:0] WB__ir;
logic WB__we;
logic [4:0] WB__rd;
logic [1:0] WB__sel__rd_data;
logic [63:0] WB__data_2;
logic [63:0] WB__mem_data;
logic [63:0] WB__rd_data;
logic WB__ready;

// MEM/WB pipe stage.
always_ff @(posedge clk) begin
    if (rst) {WB__we} <= {1'b0};
    else if (WB__ready) {WB__pc, WB__ir, WB__we, WB__rd, WB__data_2, WB__sel__rd_data, WB__mem_data} <= {MEM__pc, MEM__ir, MEM__we, MEM__rd, MEM__data_2, MEM__sel__rd_data, MEM__mem_data};
end

always_comb begin
    case (WB__sel__rd_data)
        2'h0: WB__rd_data = WB__data_2;
        2'h1: WB__rd_data = WB__mem_data;
        2'h2: WB__rd_data = WB__pc + 4;
    endcase
end


endmodule
