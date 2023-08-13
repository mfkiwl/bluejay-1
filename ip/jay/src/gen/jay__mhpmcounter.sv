//==============================================
// jay__mhpmcounter
//==============================================
module jay__mhpmcounter
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mhpmcounter 
);

logic [64-1:0] mhpmcounter__mhpmcounter;

assign mhpmcounter[63:0] = mhpmcounter__mhpmcounter;

assign mhpmcounter__mhpmcounter = 64'h0;

endmodule
