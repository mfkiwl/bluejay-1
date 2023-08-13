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

logic [63-1:0] mcause__exception_code;
logic [63-1:0] mcause__exception_code__n;
logic [1-1:0] mcause__interrupt;
logic [1-1:0] mcause__interrupt__n;

assign mcause[62:0] = mcause__exception_code;
assign mcause[63] = mcause__interrupt;

assign mcause__exception_code__n = wr_data[62:0];
assign mcause__interrupt__n = wr_data[63];

//==============================
// d_flip_flop__mcause__exception_code
//==============================
d_flip_flop #(.WIDTH(63), .RESET_VALUE(63'h0)) d_flip_flop__mcause__exception_code
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
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mcause__interrupt
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mcause__interrupt__n),
    .q(mcause__interrupt)
);

endmodule
