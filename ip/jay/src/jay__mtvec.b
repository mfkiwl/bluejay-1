//==============================================
// jay__mtvec
//==============================================
module jay__mtvec
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mtvec;
logic [CSR__MTVEC__MODE__WIDTH-1:0] mtvec__mode;
logic [CSR__MTVEC__BASE__WIDTH-1:0] mtvec__base;
logic [CSR__MTVEC__BASE__WIDTH-1:0] mtvec__base__n;

assign rd_data = mtvec;

assign mtvec[CSR__MTVEC__MODE__FIELD] = mtvec__mode;
assign mtvec[CSR__MTVEC__BASE__FIELD] = mtvec__base;

assign mtvec__mode = CSR__MTVEC__MODE__DIRECT;
assign mtvec__base__n = wr_data[CSR__MTVEC__BASE__FIELD];

//==============================
// d_flip_flop__mtvec__base
//==============================
d_flip_flop #(.WIDTH(CSR__MTVEC__BASE__WIDTH), .RESET_VALUE(CSR__MTVEC__BASE__VALUE)) d_flip_flop__mtvec__base
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mtvec__base__n),
    .q(mtvec__base)
);

endmodule
