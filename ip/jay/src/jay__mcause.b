//==============================================
// jay__mcause
//==============================================
module jay__mcause
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mcause 
);

logic [CSR__MCAUSE__EXCEPTION_CODE__WIDTH-1:0] mcause__exception_code;
logic [CSR__MCAUSE__EXCEPTION_CODE__WIDTH-1:0] mcause__exception_code__n;
logic [CSR__MCAUSE__INTERRUPT__WIDTH-1:0] mcause__interrupt;
logic [CSR__MCAUSE__INTERRUPT__WIDTH-1:0] mcause__interrupt__n;

assign mcause[CSR__MCAUSE__EXCEPTION_CODE__FIELD] = mcause__exception_code;
assign mcause[CSR__MCAUSE__INTERRUPT__FIELD] = mcause__interrupt;

assign mcause__exception_code__n = wr_data[CSR__MCAUSE__EXCEPTION_CODE__FIELD];
assign mcause__interrupt__n = wr_data[CSR__MCAUSE__INTERRUPT__FIELD];

//==============================
// d_flip_flop__mcause__exception_code
//==============================
d_flip_flop #(.WIDTH(CSR__MCAUSE__EXCEPTION_CODE__WIDTH), .RESET_VALUE(CSR__MCAUSE__EXCEPTION_CODE__HARD_RESET)) d_flip_flop__mcause__exception_code
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mcause__exception_code__n),
    .q(mcause__exception_code)
);

//==============================
// d_flip_flop__mcause__interrupt
//==============================
d_flip_flop #(.WIDTH(CSR__MCAUSE__INTERRUPT__WIDTH), .RESET_VALUE(CSR__MCAUSE__INTERRUPT__NOT_INTERRUPT)) d_flip_flop__mcause__interrupt
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mcause__interrupt__n),
    .q(mcause__interrupt)
);

endmodule
