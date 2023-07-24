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

logic [CSR__MIP__USIP__WIDTH-1:0] mip__usip;
logic [CSR__MIP__SSIP__WIDTH-1:0] mip__ssip;
logic [CSR__MIP__HSIP__WIDTH-1:0] mip__hsip;
logic [CSR__MIP__MSIP__WIDTH-1:0] mip__msip,
logic [CSR__MIP__MSIP__WIDTH-1:0] mip__msip__n,
logic [CSR__MIP__UTIP__WIDTH-1:0] mip__utip;
logic [CSR__MIP__STIP__WIDTH-1:0] mip__stip;
logic [CSR__MIP__HTIP__WIDTH-1:0] mip__htip;
logic [CSR__MIP__MTIP__WIDTH-1:0] mip__mtip;
logic [CSR__MIP__MTIP__WIDTH-1:0] mip__mtip__n;
logic [CSR__MIP__UEIP__WIDTH-1:0] mip__ueip;
logic [CSR__MIP__SEIP__WIDTH-1:0] mip__seip;
logic [CSR__MIP__HEIP__WIDTH-1:0] mip__heip;
logic [CSR__MIP__MEIP__WIDTH-1:0] mip__meip,
logic [CSR__MIP__MEIP__WIDTH-1:0] mip__meip__n,
logic [CSR__MIP__WIRI__0__WIDTH-1:0] mip__wiri__0;

assign mip[CSR__MIP__USIP__FIELD] = mip__usip;
assign mip[CSR__MIP__SSIP__FIELD] = mip__ssip;
assign mip[CSR__MIP__HSIP__FIELD] = mip__hsip;
assign mip[CSR__MIP__MSIP__FIELD] = mip__msip;
assign mip[CSR__MIP__UTIP__FIELD] = mip__utip;
assign mip[CSR__MIP__STIP__FIELD] = mip__stip;
assign mip[CSR__MIP__HTIP__FIELD] = mip__htip;
assign mip[CSR__MIP__MTIP__FIELD] = mip__mtip;
assign mip[CSR__MIP__UEIP__FIELD] = mip__ueip;
assign mip[CSR__MIP__SEIP__FIELD] = mip__seip;
assign mip[CSR__MIP__HEIP__FIELD] = mip__heip;
assign mip[CSR__MIP__MEIP__FIELD] = mip__meip;
assign mip[CSR__MIP__WIRI__0__FIELD] = mip__wiri__0;

assign mip__usip = CSR__MIP__USIP__NOT_PENDING;
assign mip__ssip = CSR__MIP__SSIP__NOT_PENDING;
assign mip__hsip = CSR__MIP__HSIP__NOT_PENDING;
assign mip__msip__n = sip;
assign mip__utip = CSR__MIP__UTIP__NOT_PENDING;
assign mip__stip = CSR__MIP__STIP__NOT_PENDING;
assign mip__htip = CSR__MIP__HTIP__NOT_PENDING;
assign mip__mtip__n = tip;
assign mip__ueip = CSR__MIP__UEIP__NOT_PENDING;
assign mip__seip = CSR__MIP__SEIP__NOT_PENDING;
assign mip__heip = CSR__MIP__HEIP__NOT_PENDING;
assign mip__meip__n = eip;
assign mip__wiri__0 = CSR__MIP__WIRI__0__VALUE;

//==============================
// d_flip_flop__mip__msip
//==============================
d_flip_flop #(.WIDTH(CSR__MIP__MSIP__WIDTH), .RESET_VALUE()) d_flip_flop__mip__msip
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
d_flip_flop #(.WIDTH(CSR__MIP__MTIP__WIDTH), .RESET_VALUE()) d_flip_flop__mip__mtip
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
d_flip_flop #(.WIDTH(CSR__MIP__MEIP__WIDTH), .RESET_VALUE()) d_flip_flop__mip__meip
(
    .clk(clk),
    .rst(1'b0),
    .en(1'b1),
    .d(mip__meip__n),
    .q(mip__meip)
);

endmodule

