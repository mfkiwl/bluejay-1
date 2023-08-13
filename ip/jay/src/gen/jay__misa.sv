//==============================================
// jay__misa
//==============================================
module jay__misa
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] misa 
);

logic [26-1:0] misa__extensions;
logic [36-1:0] misa__wiri__0;
logic [2-1:0] misa__base;

assign misa[25:0] = misa__extensions;
assign misa[61:26] = misa__wiri__0;
assign misa[63:62] = misa__base;

assign misa__extensions = 26'h100;
assign misa__wiri__0 = 36'h0;
assign misa__base = 2'h2;

endmodule
