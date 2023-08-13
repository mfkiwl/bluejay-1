//==============================================
// jay__mcycle
//==============================================
module jay__mcycle
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mcycle 
);

logic [64-1:0] mcycle__mcycle;
logic [64-1:0] mcycle__mcycle__n;

assign mcycle[63:0] = mcycle__mcycle;

assign mcycle__mcycle__n = en ? wr_data[63:0] : mcycle__mcycle + 1;

//==============================
// d_flip_flop__mcycle__mcycle
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mcycle__mcycle
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(mcycle__mcycle__n),
    .q(mcycle__mcycle)
);

endmodule
