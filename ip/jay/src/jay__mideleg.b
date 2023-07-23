//==============================================
// jay__mideleg
//==============================================
module jay__mideleg
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] rd_data
);

logic [63:0] mideleg;
logic [CSR__MIDELEG__INTERRUPTS__WIDTH-1:0] mideleg__interrupts;

assign rd_data = mideleg;

assign mideleg[CSR__MIDELEG__INTERRUPTS__FIELD] = mideleg__interrupts;

assign mideleg__interrupts = CSR__MIDELEG__INTERRUPTS__VALUE;

endmodule
