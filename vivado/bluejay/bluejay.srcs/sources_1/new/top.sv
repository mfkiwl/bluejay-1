//==============================================
// top
//==============================================
module top
(
    input clk,
    input rst
);

logic [63:0] pc;
logic [31:0] ir;
logic [9:0] addr;

//==============================
// cpu
//==============================
central_processing_unit cpu
(
    .clk(clk),
    .rst(rst),
    .pc(pc),
    .ir(ir)
);

//==============================================
// Memory
//==============================================
memory #(.WIDTH(32), .DEPTH(1024), .DEPTH__LOG2(10)) memory__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .rw(1'b0),
    .wr_data(0),
    .rd_data(ir)
);
// logic [7:0] memory [1023:0];

assign addr = pc[9:0];
// assign ir[7:0] = memory[addr];
// assign ir[15:8] = memory[addr + 1];
// assign ir[23:16] = memory[addr + 2];
// assign ir[31:24] = memory[addr + 3];


endmodule
