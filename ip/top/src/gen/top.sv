//==============================================
// top
//==============================================
module top
(
    input clk_100mhz,
    input [15:0] sw,
    input btnc,
    input btnu,
    input btnl,
    input btnr,
    input btnd,
    output logic [15:0] led,
    inout led16_b,
    output logic led16_g,
    output logic led16_r,
    output logic led17_b,
    output logic led17_g,
    output logic led17_r,
    output logic aud_pwm,
    output logic aud_sd,
    output logic [7:0] an,
    output logic ca, 
    output logic cb, 
    output logic cc, 
    output logic cd, 
    output logic ce, 
    output logic cf, 
    output logic cg
);



logic clk;
logic rst;

wire [7:0] port__0;
wire [7:0] port__1;
wire [7:0] port__2;
wire [7:0] port__3;

logic ena;
logic [7:0] wea;
logic [11:0] addra;
logic [63:0] dina;
logic [63:0] douta;


logic btnd__clean;
logic btnd__clean__edge;

logic int__1;
logic pwm;

assign clk = clk_100mhz;
assign rst = btnc;
assign led16_b = port__0[0];
assign int__1 = btnd__clean__edge;
assign aud_pwm = pwm ? 1'bz : 1'b0;
assign aud_sd = 1'b1;

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
    .int__1(int__1),
    .pwm(pwm),
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


//==============================
// debouncer__btnd
//==============================
//debouncer #(.DEBOUNCE_COUNT(0)) debouncer__btnd
debouncer #(.DEBOUNCE_COUNT(1000000)) debouncer__btnd
(
    .clk(clk),
    .rst(rst),
    .x(btnd),
    .x__clean(btnd__clean)
);

//==============================
// edge_detector__btnd__clean
//==============================
edge_detector edge_detector__btnd__clean
(
    .clk(clk),
    .rst(rst),
    .x(btnd__clean),
    .x__edge(btnd__clean__edge)
);



endmodule
