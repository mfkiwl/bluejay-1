//==============================================
// jay__mhartid
//==============================================
module jay__mhartid
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mhartid 
);

logic [64-1:0] mhartid__hart_id;

assign mhartid[63:0] = mhartid__hart_id;

assign mhartid__hart_id = 64'h0;

endmodule
