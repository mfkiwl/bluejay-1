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

logic [1-1:0] mie__usie;
logic [1-1:0] mie__ssie;
logic [1-1:0] mie__hsie;
logic [1-1:0] mie__msie;
logic [1-1:0] mie__msie__n;
logic [1-1:0] mie__utie;
logic [1-1:0] mie__stie;
logic [1-1:0] mie__htie;
logic [1-1:0] mie__mtie__n;
logic [1-1:0] mie__ueie;
logic [1-1:0] mie__seie;
logic [1-1:0] mie__heie;
logic [1-1:0] mie__meie;
logic [1-1:0] mie__meie__n;
logic [52-1:0] mie__wpri__0;

assign mie[0] = mie__usie;
assign mie[1] = mie__ssie;
assign mie[2] = mie__hsie;
assign mie[3] = mie__msie;
assign mie[4] = mie__utie;
assign mie[5] = mie__stie;
assign mie[6] = mie__htie;
assign mie[7] = mie__mtie;
assign mie[8] = mie__ueie;
assign mie[9] = mie__seie;
assign mie[10] = mie__heie;
assign mie[11] = mie__meie;
assign mie[63:12] = mie__wpri__0;

assign mie__usie = 1'b0;
assign mie__ssie = 1'b0;
assign mie__hsie = 1'b0;
assign mie__msie__n = wr_data[3];
assign mie__utie = 1'b0;
assign mie__stie = 1'b0;
assign mie__htie = 1'b0;
assign mie__mtie__n = wr_data[7];
assign mie__ueie = 1'b0;
assign mie__seie = 1'b0;
assign mie__heie = 1'b0;
assign mie__meie__n = wr_data[11];
assign mie__wpri__0 = 52'h0;

//==============================
// d_flip_flop__mie__msie
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__msie
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
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__mtie
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
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__mie__meie
(
    .clk(clk),
    .rst(rst),
    .en(en),
    .d(mie__meie__n),
    .q(mie__meie)
);


endmodule
