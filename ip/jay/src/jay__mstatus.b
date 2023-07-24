//==============================================
// jay__mstatus
//==============================================
module jay__mstatus
(
    input clk,
    input rst,
    input en,
    input [63:0] wr_data,
    output logic [63:0] mstatus 
);

logic [CSR__MSTATUS__UIE__WIDTH-1:0] mstatus__uie;
logic [CSR__MSTATUS__SIE__WIDTH-1:0] mstatus__sie;
logic [CSR__MSTATUS__HIE__WIDTH-1:0] mstatus__hie;
logic [CSR__MSTATUS__MIE__WIDTH-1:0] mstatus__mie,
logic [CSR__MSTATUS__MIE__WIDTH-1:0] mstatus__mie__n,
logic [CSR__MSTATUS__UPIE__WIDTH-1:0] mstatus__upie;
logic [CSR__MSTATUS__SPIE__WIDTH-1:0] mstatus__spie;
logic [CSR__MSTATUS__HPIE__WIDTH-1:0] mstatus__hpie;
logic [CSR__MSTATUS__MPIE__WIDTH-1:0] mstatus__mpie;
logic [CSR__MSTATUS__SPP__WIDTH-1:0] mstatus__spp;
logic [CSR__MSTATUS__HPP__WIDTH-1:0] mstatus__hpp;
logic [CSR__MSTATUS__MPP__WIDTH-1:0] mstatus__mpp;
logic [CSR__MSTATUS__FS__WIDTH-1:0] mstatus__fs;
logic [CSR__MSTATUS__XS__WIDTH-1:0] mstatus__xs;
logic [CSR__MSTATUS__MPRV__WIDTH-1:0] mstatus__mprv;
logic [CSR__MSTATUS__PUM__WIDTH-1:0] mstatus__pum;
logic [CSR__MSTATUS__MXR__WIDTH-1:0] mstatus__mxr;
logic [CSR__MSTATUS__VM__WIDTH-1:0] mstatus__vm;
logic [CSR__MSTATUS__SD__WIDTH-1:0] mstatus__sd;

assign mstatus[CSR__MSTATUS__UIE__FIELD] = mstatus__uie;
assign mstatus[CSR__MSTATUS__SIE__FIELD] = mstatus__sie;
assign mstatus[CSR__MSTATUS__HIE__FIELD] = mstatus__hie;
assign mstatus[CSR__MSTATUS__MIE__FIELD] = mstatus__mie;
assign mstatus[CSR__MSTATUS__UPIE__FIELD] = mstatus__upie;
assign mstatus[CSR__MSTATUS__SPIE__FIELD] = mstatus__spie;
assign mstatus[CSR__MSTATUS__HPIE__FIELD] = mstatus__hpie;
assign mstatus[CSR__MSTATUS__MPIE__FIELD] = mstatus__mpie;
assign mstatus[CSR__MSTATUS__SPP__FIELD] = mstatus__spp;
assign mstatus[CSR__MSTATUS__HPP__FIELD] = mstatus__hpp;
assign mstatus[CSR__MSTATUS__MPP__FIELD] = mstatus__mpp;
assign mstatus[CSR__MSTATUS__FS__FIELD] = mstatus__fs;
assign mstatus[CSR__MSTATUS__XS__FIELD] = mstatus__xs;
assign mstatus[CSR__MSTATUS__MPRV__FIELD] = mstatus__mprv;
assign mstatus[CSR__MSTATUS__PUM__FIELD] = mstatus__pum;
assign mstatus[CSR__MSTATUS__MXR__FIELD] = mstatus__mxr;
assign mstatus[CSR__MSTATUS__VM__FIELD] = mstatus__vm;
assign mstatus[CSR__MSTATUS__SD__FIELD] = mstatus__sd;

assign mstatus__uie = CSR__MSTATUS__UIE__DISABLED;
assign mstatus__sie = CSR__MSTATUS__SIE__DISABLED;
assign mstatus__hie = CSR__MSTATUS__HIE__DISABLED;
assign mstatus__mie__n = wr_data[CSR__MSTATUS__MIE__FIELD];
assign mstatus__upie = CSR__MSTATUS__UPIE__DISABLED;
assign mstatus___spie = CSR__MSTATUS__SPIE__DISABLED;
assign mstatus__hpie = CSR__MSTATUS__HPIE__DISABLED;
assign mstatus__mpie__n = wr_data[CSR__MSTATUS__MPIE__FIELD];
assign mstatus__spp = CSR__MSTATUS__SPP__USER;
assign mstatus__hpp = CSR__MSTATUS__HPP__USER;
assign mstatus__mpp = CSR__MSTATUS__MPP__MACHINE;
assign mstatus__fs = CSR__MSTATUS__FS__OFF;
assign mstatus__xs = CSR__MSTATUS__XS__OFF;
assign mstatus__mprv = CSR__MSTATUS__MPRV__DISABLED;
assign mstatus__pum = CSR__MSTATUS__PUM__DISABLED;
assign mstatus__mxr = CSR__MSTATUS__MXR__DISABLED;
assign mstatus__vm = CSR__MSTATUS__VM__MBARE;
assign mstatus__sd = CSR__MSTATUS__SD__NOT_DIRTY;

//==============================
// d_flip_flop__mstatus__mie
//==============================
d_flip_flop #(.WIDTH(CSR__MSTATUS__MIE__WIDTH), .RESET_VALUE(CSR__MSTATUS__MIE__DISABLED)) d_flip_flop__mstatus__mie
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mstatus__mie__n),
    .q(mstatus__mie)
);

//==============================
// d_flip_flop__mstatus__mpie
//==============================
d_flip_flop #(.WIDTH(CSR__MSTATUS__MPIE__WIDTH), .RESET_VALUE(CSR__MSTATUS__MPIE__ENABLED)) d_flip_flop__mstatus__mpie
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mstatus__mpie__n),
    .q(mstatus__mpie)
);


endmodule
