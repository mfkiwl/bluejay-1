//==============================================
// jay__mepc
//==============================================
module jay__mepc
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mepc;
logic [CSR__MEPC__MEPC__WIDTH-1:0] mepc__mepc;
logic [CSR__MEPC__MEPC__WIDTH-1:0] mepc__mepc__n;

assign rd_data = mepc;

assign mepc[CSR__MEPC__MEPC__FIELD] = mepc__mepc;

assign mepc__mepc__n = wr_data[CSR__MEPC__MEPC__FIELD];

//==============================
// d_flip_flop__mepc__mepc
//==============================
d_flip_flop #(.WIDTH(CSR__MEPC__MEPC__WIDTH), .RESET_VALUE(CSR__MEPC__MEPC__RESET_VALUE)) d_flip_flop__mepc__mepc
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mepc__mepc__n),
    .q(mepc__mepc)
);

endmodule
