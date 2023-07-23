//==============================================
// jay__mhartid
//==============================================
module jay__mhartid
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mhartid;
logic [CSR__MHARTID__HART_ID__WIDTH-1:0] mhartid__hart_id;

assign rd_data = mhartid;

assign mhartid[CSR__MHARTID__HART_ID__FIELD] = mhartid__hart_id;

assign mhartid__hart_id = CSR__MHARTID__HART_ID__VALUE;

endmodule
