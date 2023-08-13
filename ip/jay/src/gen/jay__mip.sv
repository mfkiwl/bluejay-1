//==============================================
// jay__mip
//==============================================
module jay__mip
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mip,
    input sip,
    input tip,
    input eip
);

logic [1-1:0] mip__usip;
logic [1-1:0] mip__ssip;
logic [1-1:0] mip__hsip;
logic [1-1:0] mip__msip;
logic [1-1:0] mip__msip__n;
logic [1-1:0] mip__utip;
logic [1-1:0] mip__stip;
logic [1-1:0] mip__htip;
logic [1-1:0] mip__mtip;
logic [1-1:0] mip__mtip__n;
logic [1-1:0] mip__ueip;
logic [1-1:0] mip__seip;
logic [1-1:0] mip__heip;
logic [1-1:0] mip__meip;
logic [1-1:0] mip__meip__n;
logic [52-1:0] mip__wiri__0;

assign mip[0] = mip__usip;
assign mip[1] = mip__ssip;
assign mip[2] = mip__hsip;
assign mip[3] = mip__msip;
assign mip[4] = mip__utip;
assign mip[5] = mip__stip;
assign mip[6] = mip__htip;
assign mip[7] = mip__mtip;
assign mip[8] = mip__ueip;
assign mip[9] = mip__seip;
assign mip[10] = mip__heip;
assign mip[11] = mip__meip;
assign mip[63:12] = mip__wiri__0;

assign mip__usip = 1'b0;
assign mip__ssip = 1'b0;
assign mip__hsip = 1'b0;
assign mip__msip__n = sip;
assign mip__utip = 1'b0;
assign mip__stip = 1'b0;
assign mip__htip = 1'b0;
assign mip__mtip__n = tip;
assign mip__ueip = 1'b0;
assign mip__seip = 1'b0;
assign mip__heip = 1'b0;
assign mip__meip__n = eip;
assign mip__wiri__0 = 52'h0;

//==============================
// d_flip_flop__mip__msip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE()) d_flip_flop__mip__msip
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(mip__msip__n),
    .q(mip__msip)
);

// FIXME: The tip/eip bit will (likely) be retimed from the PLIC. Make sure the is no issues with X propagation upon reset. 
//==============================
// d_flip_flop__mip__mtip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE()) d_flip_flop__mip__mtip
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(mip__mtip__n),
    .q(mip__mtip)
);

//==============================
// d_flip_flop__mip__meip
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE()) d_flip_flop__mip__meip
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(mip__meip__n),
    .q(mip__meip)
);

endmodule

