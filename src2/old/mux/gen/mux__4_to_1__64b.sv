//==============================================
// mux__4_to_1__64b
//==============================================
module mux__4_to_1__64b
(
    input clk,
    input rst,
    input [1:0] sel,
    input [63:0] in_0,
    input [63:0] in_1,
    input [63:0] in_2,
    input [63:0] in_3,
    output logic [63:0] out
);

// outputs of the first level muxes
logic [63:0] out_0, out_1;

//==============================
// mux__2_to_1__64b_0
//==============================
mux__2_to_1__64b mux__2_to_1__64b_0
(
	.clk(clk)
	.rst(rst)
	.sel(sel[0])
	.in_0(in_0),
	.in_1(in_1),
	.out(out_0)
);

//==============================
// mux__2_to_1__64b_0
//==============================
mux__2_to_1__64b mux__2_to_1__64b_1
(
    .clk(clk)
    .rst(rst)
    .sel(sel[0])
    .in_0(in_2),
    .in_1(in_3),
    .out(out_1)
);

//==============================
// mux__2_to_1__64b_0
//==============================
mux__2_to_1__64b mux__2_to_1__64b_2
(
    .clk(clk)
    .rst(rst)
    .sel(sel[1])
    .in_0(out_0),
    .in_1(out_1),
    .out(out)
);

endmodule