//==============================================
// d_flip_flop 
//==============================================
module d_flip_flop 
(
    input clk,
    input rst,
    input en,
    input [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);

parameter WIDTH = 1;
parameter RESET_VALUE = 0;

always_ff @(posedge clk)
begin
    q <= rst ? RESET_VALUE : en ? d : q; 
end

endmodule
