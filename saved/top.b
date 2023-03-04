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

PYTHON
(
for i in range(16):
    print(f"//==============================")
    print(f"// debouncer__sw__{i}")
    print(f"//==============================")
    print(f"debouncer debouncer__sw__{i}")
    print(f"(")
    print(f"    .clk(clk),")
    print(f"    .rst(rst),")
    print(f"    .in(sw[{i}]),")
    print(f"    .out(sw__clean[{i}])")
    print(f");")

    if i != 15:
        print("")
)

endmodule
