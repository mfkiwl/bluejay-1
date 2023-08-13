//==============================================
// jay__mvendorid
//==============================================
module jay__mvendorid
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mvendorid 
);

logic [64-1:0] mvendorid__vendor;

assign mvendorid[63:0] = mvendorid__vendor;

assign mvendorid__vendor = 64'h0;

endmodule
