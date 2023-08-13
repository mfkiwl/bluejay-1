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

logic [64-1:0] mimpid__implementation;

assign mimpid[63:0] = mimpid__implementation;

assign mimpid__implementation = 64'h0;

endmodule
