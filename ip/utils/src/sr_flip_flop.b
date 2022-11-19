//==============================================
// sr_flip_flop 
//==============================================
module sr_flip_flop 
(
    clk,
    s,
    r,
    q
);

input clk;
input s;
input r;
output q;

logic clk;
logic s;
logic r;
logic q;

begin
    if (r)
    begin
        q <= 1'b0;
    end
    else if (s)
    begin
        q <= 1'b1;
    end
end

endmodule
