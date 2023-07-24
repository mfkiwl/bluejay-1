//==============================================
// jay__mie
//==============================================
module jay__mie
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mie 
);

logic [CSR__MIE__USIE__WIDTH-1:0] mie__usie;
logic [CSR__MIE__SSIE__WIDTH-1:0] mie__ssie;
logic [CSR__MIE__HSIE__WIDTH-1:0] mie__hsie;
logic [CSR__MIE__MSIE__WIDTH-1:0] mie__msie,
logic [CSR__MIE__MSIE__WIDTH-1:0] mie__msie__n,
logic [CSR__MIE__UTIE__WIDTH-1:0] mie__utie;
logic [CSR__MIE__STIE__WIDTH-1:0] mie__stie;
logic [CSR__MIE__HTIE__WIDTH-1:0] mie__htie;
logic [CSR__MIE__MTIE__WIDTH-1:0] mie__mtie__n,
logic [CSR__MIE__UEIE__WIDTH-1:0] mie__ueie;
logic [CSR__MIE__SEIE__WIDTH-1:0] mie__seie;
logic [CSR__MIE__HEIE__WIDTH-1:0] mie__heie;
logic [CSR__MIE__MEIE__WIDTH-1:0] mie__meie,
logic [CSR__MIE__MEIE__WIDTH-1:0] mie__meie__n,
logic [CSR__MIE__WPRI__0__WIDTH-1:0] mie__wpri__0;

assign mie[CSR__MIE__USIE__FIELD] = mie__usie;
assign mie[CSR__MIE__SSIE__FIELD] = mie__ssie;
assign mie[CSR__MIE__HSIE__FIELD] = mie__hsie;
assign mie[CSR__MIE__MSIE__FIELD] = mie__msie;
assign mie[CSR__MIE__UTIE__FIELD] = mie__utie;
assign mie[CSR__MIE__STIE__FIELD] = mie__stie;
assign mie[CSR__MIE__HTIE__FIELD] = mie__htie;
assign mie[CSR__MIE__MTIE__FIELD] = mie__mtie;
assign mie[CSR__MIE__UEIE__FIELD] = mie__ueie;
assign mie[CSR__MIE__SEIE__FIELD] = mie__seie;
assign mie[CSR__MIE__HEIE__FIELD] = mie__heie;
assign mie[CSR__MIE__MEIE__FIELD] = mie__meie;
assign mie[CSR__MIE__WPRI__0__FIELD] = mie__wpri__0;

assign mie__usie = CSR__MIE__USIE__DISABLED;
assign mie__ssie = CSR__MIE__SSIE__DISABLED;
assign mie__hsie = CSR__MIE__HSIE__DISABLED;
assign mie__msie__n = wr_data[CSR__MIE__MSIE__FIELD];
assign mie__utie = CSR__MIE__UTIE__DISABLED;
assign mie__stie = CSR__MIE__STIE__DISABLED;
assign mie__htie = CSR__MIE__HTIE__DISABLED;
assign mie__mtie__n = wr_data[CSR__MIE__MTIE__FIELD];
assign mie__ueie = CSR__MIE__UEIE__DISABLED;
assign mie__seie = CSR__MIE__SEIE__DISABLED;
assign mie__heie = CSR__MIE__HEIE__DISABLED;
assign mie__meie__n = wr_data[CSR__MIE__MEIE__FIELD];
assign mie__wpri__0 = CSR__MIE__WPRI__0__VALUE;

//==============================
// d_flip_flop__mie__msie
//==============================
d_flip_flop #(.WIDTH(CSR__MIE__MSIE__WIDTH), .RESET_VALUE(CSR__MIE__MSIE__DISABLED)) d_flip_flop__mie__msie
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mie__msie__n),
    .q(mie__msie)
);

//==============================
// d_flip_flop__mie__mtie
//==============================
d_flip_flop #(.WIDTH(CSR__MIE__MTIE__WIDTH), .RESET_VALUE(CSR__MIE__MTIE__DISABLED)) d_flip_flop__mie__mtie
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mie__mtie__n),
    .q(mie__mtie)
);

//==============================
// d_flip_flop__mie__meie
//==============================
d_flip_flop #(.WIDTH(CSR__MIE__MEIE__WIDTH), .RESET_VALUE(CSR__MIE__MEIE__DISABLED)) d_flip_flop__mie__meie
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mie__meie__n),
    .q(mie__meie)
);


endmodule
