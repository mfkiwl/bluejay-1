//==============================================
// jay__mideleg
//==============================================
module jay__mideleg
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mideleg 
);

logic [64-1:0] mideleg__interrupts;

assign mideleg[63:0] = mideleg__interrupts;

assign mideleg__interrupts = 64'h0;

endmodule
