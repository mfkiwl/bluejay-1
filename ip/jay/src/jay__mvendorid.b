//==============================================
// jay__mvendorid
//==============================================
module jay__mvendorid
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mvendorid 
);

logic [CSR__MVENDORID__VENDOR__WIDTH-1:0] mvendorid__vendor;

assign mvendorid[CSR__MVENDORID__VENDOR__FIELD] = mvendorid__vendor;

assign mvendorid__vendor = CSR__MVENDORID__VENDOR__VALUE;

endmodule
