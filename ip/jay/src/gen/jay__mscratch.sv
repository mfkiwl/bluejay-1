//==============================================
// jay__mscratch
//==============================================
module jay__mscratch
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mscratch 
);

logic [64-1:0] mscratch__mscratch;
logic [64-1:0] mscratch__mscratch__n;

assign mscratch[63:0] = mscratch__mscratch;

assign mscratch__mscratch__n = wr_data[63:0];

//==============================
// d_flip_flop__mscratch__mscratch
//==============================
d_flip_flop #(.WIDTH(64), .RESET_VALUE(64'h0)) d_flip_flop__mscratch__mscratch
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mscratch__mscratch__n),
    .q(mscratch__mscratch)
);

endmodule
