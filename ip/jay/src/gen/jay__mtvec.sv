//==============================================
// jay__mtvec
//==============================================
module jay__mtvec
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mtvec 
);

logic [2-1:0] mtvec__mode;
logic [62-1:0] mtvec__base;
logic [62-1:0] mtvec__base__n;

assign mtvec[1:0] = mtvec__mode;
assign mtvec[63:2] = mtvec__base;

assign mtvec__mode = 2'h0;
assign mtvec__base__n = wr_data[63:2];

//==============================
// d_flip_flop__mtvec__base
//==============================
d_flip_flop #(.WIDTH(62), .RESET_VALUE(62'h0)) d_flip_flop__mtvec__base
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mtvec__base__n),
    .q(mtvec__base)
);

endmodule
