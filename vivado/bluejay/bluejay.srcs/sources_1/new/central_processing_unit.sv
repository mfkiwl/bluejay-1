//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
);

logic [63:0] pc;

// instruction decode (ID)
logic [31:0] ID__ir;
logic [4:0] ID__rs1;
logic [4:0] ID__rs2;
logic [4:0] ID__rd;
logic [63:0] ID__rs1_data;
logic [63:0] ID__rs2_data;
logic [63:0] ID__imm;
logic [3:0] ID__func;
logic [1:0] ID__sel__pc;
logic ID__sel__data_0;
logic ID__sel__data_1;

// execute (EX)
logic [31:0] EX__ir;
logic [4:0] EX__rd;
logic [63:0] EX__rs1_data;
logic [63:0] EX__rs2_data;
logic [63:0] EX__imm;
logic [3:0] EX__func;
logic [1:0] EX__sel__pc;
logic EX__sel__data_0;
logic EX__sel__data_1;

// write back (WB)
logic WB__we;
logic WB__rd;
logic WB__rd_data;

//==============================
// decoder_0
//==============================
decoder decoder_0
(
    .clk(clk),
    .rst(rst),
    .ir(ID__ir),
    .rs1(ID__rs1),
    .rs2(ID__rs2),
    .rd(ID__rd),
    .imm(ID__imm),
    .func(ID__func),
    .sel__pc(ID__sel__pc),
    .sel__data_0(ID__sel__data_0),
    .sel__data_1(ID__sel__data_1)
);

//==============================
// register_file_0
//==============================
register_file register_file_0
(
    .clk(clk),
    .rst(rst),
    .we(WB__we),
    .rs1(ID__rs1),
    .rs1_data(rs1_data),
    .rs2(ID__rs2),
    .rs2_data(ID__rs2_data),
    .rd(WB__rd),
    .rd_data(WB__rd_data)
);


always_ff @(posedge clk) begin
	{EX__ir, EX__rs1_data, EX__rs2_data, EX__imm, ID__rd, ID__we} <= {ID__ir, ID__rs1_data, ID__rs2_data, ID__imm, ID__rd, ID__we}
end


endmodule


//==============================================
// pipe
//==============================================
module pipe
(
	input clk,
    input rst,
    input in__valid,
    input in__ready,
    input in__data,
    output out__valid,
    input out__ready,
    output out__data
);


endmodule