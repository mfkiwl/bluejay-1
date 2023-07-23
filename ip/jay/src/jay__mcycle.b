//==============================================
// jay__mcycle
//==============================================
module jay__mcycle
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mcycle;
logic [CSR__MCYCLE__MCYCLE__WIDTH-1:0] mcycle__mcycle;
logic [CSR__MCYCLE__MCYCLE__WIDTH-1:0] mcycle__mcycle__n;

assign rd_data = mcycle;

assign mcycle[CSR__MCYCLE__MCYCLE__FIELD] = mcycle__mcycle;

assign mcycle__mcycle__n = en ? wr_data[CSR__MCYCLE__MCYCLE__FIELD] : mcycle__mcycle + 1;

//==============================
// d_flip_flop__mcycle__mcycle
//==============================
d_flip_flop #(.WIDTH(CSR__MCYCLE__MCYCLE__WIDTH), .RESET_VALUE(CSR__MCYCLE__MCYCLE__RESET_VALUE)) d_flip_flop__mcycle__mcycle
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(mcycle__mcycle__n),
    .q(mcycle__mcycle)
);

endmodule
