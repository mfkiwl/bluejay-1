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

logic [CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__WIDTH-1:0] medeleg__synchronous_exceptions;

assign medeleg[CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__FIELD] = medeleg__synchronous_exceptions;

assign medeleg__synchronous_exceptions = CSR__MEDELEG__SYNCHRONOUS_EXCEPTIONS__VALUE;

endmodule
