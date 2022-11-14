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
    output logic led16_b,
    output logic led16_g,
    output logic led16_r,
    output logic led17_b,
    output logic led17_g,
    output logic led17_r,
    output logic [7:0] an,
    output logic ca, 
    output logic cb, 
    output logic cc, 
    output logic cd, 
    output logic ce, 
    output logic cf, 
    output logic cg
);

logic btnc__clean;
logic btnu__clean;
logic btnd__clean;
logic btnl__clean;
logic btnr__clean;
logic [15:0] sw__clean;


logic [7:0] port__0;


assign clk = clk_100mhz;
//assign rst = btnc__clean;
assign rst = btnc;
assign led16_b = port__0[0]; 
assign led16_g = 1'b0; 
assign led16_r = 1'b0; 
assign led17_b = 1'b0; 
assign led17_g = 1'b0; 
assign led17_r = 1'b0; 
assign led = 16'h0;
assign an = 8'hff;
assign ca = 1'b0;
assign cb = 1'b0;
assign cc = 1'b0;
assign cc = 1'b0;
assign ce = 1'b0;
assign cf = 1'b0;
assign cg = 1'b0;


//==============================
// jay__0
//==============================
jay jay__0
(
    .clk(clk),
    .rst(rst),
    .port__0(port__0)
);


//==============================
// debouncer__btnc
//==============================
debouncer debouncer__btnc
(
    .clk(clk),
    .rst(rst),
    .in(btnc),
    .out(btnc__clean)
);

//==============================
// debouncer__btnu
//==============================
debouncer debouncer__btnu
(
    .clk(clk),
    .rst(rst),
    .in(btnu),
    .out(btnu__clean)
);

//==============================
// debouncer__btnd
//==============================
debouncer debouncer__btnd
(
    .clk(clk),
    .rst(rst),
    .in(btnd),
    .out(btnd__clean)
);

//==============================
// debouncer__btnl
//==============================
debouncer debouncer__btnl
(
    .clk(clk),
    .rst(rst),
    .in(btnl),
    .out(btnl__clean)
);

//==============================
// debouncer__btnr
//==============================
debouncer debouncer__btnr
(
    .clk(clk),
    .rst(rst),
    .in(btnr),
    .out(btnr__clean)
);

//==============================
// debouncer__sw__0
//==============================
debouncer debouncer__sw__0
(
    .clk(clk),
    .rst(rst),
    .in(sw[0]),
    .out(sw__clean[0])
);

//==============================
// debouncer__sw__1
//==============================
debouncer debouncer__sw__1
(
    .clk(clk),
    .rst(rst),
    .in(sw[1]),
    .out(sw__clean[1])
);

//==============================
// debouncer__sw__2
//==============================
debouncer debouncer__sw__2
(
    .clk(clk),
    .rst(rst),
    .in(sw[2]),
    .out(sw__clean[2])
);

//==============================
// debouncer__sw__3
//==============================
debouncer debouncer__sw__3
(
    .clk(clk),
    .rst(rst),
    .in(sw[3]),
    .out(sw__clean[3])
);

//==============================
// debouncer__sw__4
//==============================
debouncer debouncer__sw__4
(
    .clk(clk),
    .rst(rst),
    .in(sw[4]),
    .out(sw__clean[4])
);

//==============================
// debouncer__sw__5
//==============================
debouncer debouncer__sw__5
(
    .clk(clk),
    .rst(rst),
    .in(sw[5]),
    .out(sw__clean[5])
);

//==============================
// debouncer__sw__6
//==============================
debouncer debouncer__sw__6
(
    .clk(clk),
    .rst(rst),
    .in(sw[6]),
    .out(sw__clean[6])
);

//==============================
// debouncer__sw__7
//==============================
debouncer debouncer__sw__7
(
    .clk(clk),
    .rst(rst),
    .in(sw[7]),
    .out(sw__clean[7])
);

//==============================
// debouncer__sw__8
//==============================
debouncer debouncer__sw__8
(
    .clk(clk),
    .rst(rst),
    .in(sw[8]),
    .out(sw__clean[8])
);

//==============================
// debouncer__sw__9
//==============================
debouncer debouncer__sw__9
(
    .clk(clk),
    .rst(rst),
    .in(sw[9]),
    .out(sw__clean[9])
);

//==============================
// debouncer__sw__10
//==============================
debouncer debouncer__sw__10
(
    .clk(clk),
    .rst(rst),
    .in(sw[10]),
    .out(sw__clean[10])
);

//==============================
// debouncer__sw__11
//==============================
debouncer debouncer__sw__11
(
    .clk(clk),
    .rst(rst),
    .in(sw[11]),
    .out(sw__clean[11])
);

//==============================
// debouncer__sw__12
//==============================
debouncer debouncer__sw__12
(
    .clk(clk),
    .rst(rst),
    .in(sw[12]),
    .out(sw__clean[12])
);

//==============================
// debouncer__sw__13
//==============================
debouncer debouncer__sw__13
(
    .clk(clk),
    .rst(rst),
    .in(sw[13]),
    .out(sw__clean[13])
);

//==============================
// debouncer__sw__14
//==============================
debouncer debouncer__sw__14
(
    .clk(clk),
    .rst(rst),
    .in(sw[14]),
    .out(sw__clean[14])
);

//==============================
// debouncer__sw__15
//==============================
debouncer debouncer__sw__15
(
    .clk(clk),
    .rst(rst),
    .in(sw[15]),
    .out(sw__clean[15])
);

endmodule
