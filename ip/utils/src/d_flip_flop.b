//==============================================
// d_flip_flop 
//==============================================
module d_flip_flop 
(
    clk,
    rst,
    en,
    d,
    q
);

parameter WIDTH = 1;
parameter RESET_VALUE = 0;

input clk;
input rst;
input en;
input [WDITH-1:0] d;
output [WDITH-1:0] q;

logic clk;
logic rst;
logic en;
logic [WIDTH-1:0] d;
logic [WIDTH-1:0] q;

begin
    if (rst)
    begin
        q <= RESET_VALUE;
    end
    else
    begin
        if (en)
        begin
            q <= d;
        end
    end
end

endmodule
