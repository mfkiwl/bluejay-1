//==============================================
// comparator
//==============================================
module comparator
(
    input clk,
    input rst,
    input [63:0] a,
    input [63:0] b,
    output logic eq,
    output logic ne,
    output logic lt,
    output logic ltu,
    output logic ge,
    output geu
);

// Comparison operations.
assign eq = (a == b);
assign ne = ~eq;
assign lt = (a[63] == b[63]) ? a < b : a[63];
assign ltu = a < b;
assign ge = (a[63] == b[63]) ? a >= b : b[63];
assign geu = a >= b;

endmodule
