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

logic [64-1:0] mhpmevent__mhpmevent;

assign mhpmevent[63:0] = mhpmevent__mhpmevent;

assign mhpmevent__mhpmevent = 64'h0;

endmodule
