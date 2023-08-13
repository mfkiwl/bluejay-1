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

logic [1-1:0] mstatus__uie;
logic [1-1:0] mstatus__sie;
logic [1-1:0] mstatus__hie;
logic [1-1:0] mstatus__mie;
logic [1-1:0] mstatus__mie__n;
logic [1-1:0] mstatus__upie;
logic [1-1:0] mstatus__spie;
logic [1-1:0] mstatus__hpie;
logic [1-1:0] mstatus__mpie;
logic [1-1:0] mstatus__spp;
logic [2-1:0] mstatus__hpp;
logic [2-1:0] mstatus__mpp;
logic [2-1:0] mstatus__fs;
logic [2-1:0] mstatus__xs;
logic [1-1:0] mstatus__mprv;
logic [1-1:0] mstatus__pum;
logic [1-1:0] mstatus__mxr;
logic [5-1:0] mstatus__vm;
logic [1-1:0] mstatus__sd;

assign mstatus[0] = mstatus__uie;
assign mstatus[1] = mstatus__sie;
assign mstatus[2] = mstatus__hie;
assign mstatus[3] = mstatus__mie;
assign mstatus[4] = mstatus__upie;
assign mstatus[5] = mstatus__spie;
assign mstatus[6] = mstatus__hpie;
assign mstatus[7] = mstatus__mpie;
assign mstatus[8] = mstatus__spp;
assign mstatus[10:9] = mstatus__hpp;
assign mstatus[12:11] = mstatus__mpp;
assign mstatus[14:13] = mstatus__fs;
assign mstatus[16:15] = mstatus__xs;
assign mstatus[17] = mstatus__mprv;
assign mstatus[18] = mstatus__pum;
assign mstatus[19] = mstatus__mxr;
assign mstatus[28:24] = mstatus__vm;
assign mstatus[63] = mstatus__sd;

assign mstatus__uie = 1'b0;
assign mstatus__sie = 1'b0;
assign mstatus__hie = 1'b0;
assign mstatus__mie__n = wr_data[3];
assign mstatus__upie = 1'b0;
assign mstatus___spie = 1'b0;
assign mstatus__hpie = 1'b0;
assign mstatus__mpie__n = wr_data[7];
assign mstatus__spp = 1'b0;
assign mstatus__hpp = 2'h0;
assign mstatus__mpp = 2'h3;
assign mstatus__fs = 2'h0;
assign mstatus__xs = 2'h0;
assign mstatus__mprv = 1'b0;
assign mstatus__pum = 1'b0;
assign mstatus__mxr = 1'b0;
assign mstatus__vm = 5'h0;
assign mstatus__sd = 1'b0;

//==============================
// d_flip_flop__mstatus__mie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mstatus__mie
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
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b1)) d_flip_flop__mstatus__mpie
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mstatus__mpie__n),
    .q(mstatus__mpie)
);


endmodule
