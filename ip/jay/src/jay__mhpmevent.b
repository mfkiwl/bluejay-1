//==============================================
// jay__mhpmevent
//==============================================
module jay__mhpmevent
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mhpmevent3;
logic [CSR__MHPMEVENT3__MHPMEVENT3__WIDTH-1:0] mhpmevent3__mhpmevent3;

assign rd_data = mhpmevent;

assign mhpmevent3[CSR__MHPMEVENT3__MHPMEVENT3__FIELD] = mhpmevent3__mhpmevent3;

assign mhpmevent3__mhpmevent3 = CSR__MHPMEVENT3__MHPMEVENT3__VALUE;

endmodule
