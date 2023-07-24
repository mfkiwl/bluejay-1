//==============================================
// jay__mhpmevent
//==============================================
module jay__mhpmevent
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mhpmevent 
);

logic [63:0] mhpmevent;
logic [CSR__MHPMEVENT__MHPMEVENT__WIDTH-1:0] mhpmevent__mhpmevent;

assign mhpmevent[CSR__MHPMEVENT__MHPMEVENT__FIELD] = mhpmevent__mhpmevent;

assign mhpmevent__mhpmevent = CSR__MHPMEVENT__MHPMEVENT__VALUE;

endmodule
