//==============================================
// sr_flip_flop 
//==============================================
module sr_flip_flop 
(
    input clk,
    input s,
    input r,
    output logic q
);

always_ff @(posedge clk)
begin
    q <= r ? 1'b0 : s ? 1'b1 : q;
end

endmodule
