//==============================================
// mux__2_to_1__64b
//==============================================
module mux__2_to_1__64b
(
    input clk,
    input rst,
    input sel,
    input [63:0] in_0,
    input [63:0] in_1,
    output logic [63:0] out
);
// 2 to 1 mux
assign out = sel ? in_1 : in_0;

endmodule

