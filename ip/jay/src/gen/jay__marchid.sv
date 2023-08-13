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

logic [64-1:0] marchid__architecture_id;

assign marchid[63:0] = marchid__architecture_id;

assign marchid__architecture_id = 64'h0;

endmodule
