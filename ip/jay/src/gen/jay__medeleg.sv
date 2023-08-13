//==============================================
// jay__medeleg
//==============================================
module jay__medeleg
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] medeleg 
);

logic [64-1:0] medeleg__synchronous_exceptions;

assign medeleg[63:0] = medeleg__synchronous_exceptions;

assign medeleg__synchronous_exceptions = 64'h0;

endmodule
