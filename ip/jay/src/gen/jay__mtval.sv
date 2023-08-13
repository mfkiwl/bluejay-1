//==============================================
// jay__mtval
//==============================================
module jay__mtval
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mtval 
);

logic [64-1:0] mtval__mtval;
logic [64-1:0] mtval__mtval__n;

assign mtval[63:0] = mtval__mtval;

assign mtval__mtval__n = wr_data[63:0];

//==============================
// d_flip_flop__mtval__mtval
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mtval__mtval
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mtval__mtval__n),
    .q(mtval__mtval)
);

endmodule
