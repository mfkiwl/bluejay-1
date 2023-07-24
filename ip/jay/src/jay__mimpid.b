//==============================================
// jay__mimpid
//==============================================
module jay__mimpid
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mimpid 
);

logic [CSR__MIMPID__IMPLEMENTATION__WIDTH-1:0] mimpid__implementation;

assign mimpid[CSR__MIMPID__IMPLEMENTATION__FIELD] = mimpid__implementation;

assign mimpid__implementation = CSR__MIMPID__IMPLEMENTATION__VALUE;

endmodule
