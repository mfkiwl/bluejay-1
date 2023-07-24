//==============================================
// jay__marchid
//==============================================
module jay__marchid
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] marchid 
);

logic [CSR__MARCHID__ARCHITECTURE_ID__WIDTH-1:0] marchid__architecture_id;

assign marchid[CSR__MARCHID__ARCHITECTURE_ID__FIELD] = marchid__architecture_id;

assign marchid__architecture_id = CSR__MARCHID__ARCHITECTURE_ID__VALUE;

endmodule
