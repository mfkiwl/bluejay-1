//==============================================
// top
//==============================================
module top
(
    clk_100mhz,
    sw,
    btnc,
    btnu,
    btnl,
    btnr,
    btnd,
    led,
    led16_b,
    led16_g,
    led16_r,
    led17_b,
    led17_g,
    led17_r,
    an,
    ca, 
    cb, 
    cc, 
    cd, 
    ce, 
    cf, 
    cg
);

input clk_100mhz;
input [15:0] sw;
input btnc;
input btnu;
input btnl;
input btnr;
input btnd;
output [15:0] led;
inout led16_b;
output led16_g;
output led16_r;
output led17_b;
output led17_g;
output led17_r;
output [7:0] an;
output ca; 
output cb; 
output cc; 
output cd; 
output ce; 
output cf; 
output cg;

logic clk_100mhz;
logic [15:0] sw;
logic btnc;
logic btnu;
logic btnl;
logic btnr;
logic btnd;
logic [15:0] led;
//logic led16_b;
logic led16_g;
logic led16_r;
logic led17_b;
logic led17_g;
logic led17_r;
logic [7:0] an;
logic ca; 
logic cb; 
logic cc; 
logic cd; 
logic ce; 
logic cf; 
logic cg;

logic clk;
logic rst;

//logic [7:0] port__0;
//logic [7:0] port__1;
//logic [7:0] port__2;
//logic [7:0] port__3;
wire [7:0] port__0;
wire [7:0] port__1;
wire [7:0] port__2;
wire [7:0] port__3;

logic ena;
logic [7:0] wea;
logic [11:0] addra;
logic [63:0] dina;
logic [63:0] douta;


assign clk = clk_100mhz;
assign rst = btnc;
assign led16_b = port__0[0];

assign led = 0;
//assign led16_b = 0;
assign led16_g = 0;
assign led16_r = 0;
assign led17_b = 0;
assign led17_g = 0;
assign led17_r = 0;
assign an = 8'hff;
assign ca = 0; 
assign cb = 0; 
assign cc = 0; 
assign cd = 0; 
assign ce = 0; 
assign cf = 0; 
assign cg = 0;



//==============================
// jay__0
//==============================
jay jay__0
(
    .clk(clk),
    .rst(rst),
    .port__0(port__0),
    .port__1(port__1),
    .port__2(port__2),
    .port__3(port__3),
    .ena(ena),
    .wea(wea),
    .addra(addra),
    .dina(dina),
    .douta(douta)
);

//==============================
// blk_mem_gen_0 
//==============================
blk_mem_gen_0 blk_mem_gen_0__0 
(
    .clka(clk),
    .addra(addra),
    .dina(dina),
    .douta(douta),
    .ena(ena),
    .wea(wea)
);



endmodule
