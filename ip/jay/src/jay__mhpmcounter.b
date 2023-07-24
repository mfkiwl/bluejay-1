//==============================================
// jay__mhpmcounter
//==============================================
module jay__mhpmcounter
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mhpmcounter 
);

logic [CSR__MHPMCOUNTER__MHPMCOUNTER__WIDTH-1:0] mhpmcounter__mhpmcounter;

assign mhpmcounter[CSR__MHPMCOUNTER__MHPMCOUNTER__FIELD] = mhpmcounter__mhpmcounter;

assign mhpmcounter__mhpmcounter = CSR__MHPMCOUNTER__MHPMCOUNTER__VALUE;

endmodule
