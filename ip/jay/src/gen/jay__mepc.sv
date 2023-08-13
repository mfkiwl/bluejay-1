//==============================================
// jay__mepc
//==============================================
module jay__mepc
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mepc 
);

logic [64-1:0] mepc__mepc;
logic [64-1:0] mepc__mepc__n;

assign mepc[63:0] = mepc__mepc;

assign mepc__mepc__n = wr_data[63:0];

//==============================
// d_flip_flop__mepc__mepc
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mepc__mepc
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mepc__mepc__n),
    .q(mepc__mepc)
);

endmodule
