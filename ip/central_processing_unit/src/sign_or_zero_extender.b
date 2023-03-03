//==============================================
// sign_or_zero_extender
//==============================================
module sign_or_zero_extender
(
    clk,
    rst,
    dtype,
    din,
    dout
);

input clk;
input rst;
input [2:0] dtype;
input [63:0] din;
output [63:0] dout;

logic clk;
logic rst;
logic [2:0] dtype;
logic [63:0] din;
logic [63:0] dout;

always_comb
begin
    case (dtype)
        DTYPE__DOUBLE_WORD:
        begin
            dout = din; 
        end
        DTYPE__WORD:
        begin
            dout = {{32{din[31]}}, din[31:0]}; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            dout = {32'h0, din[31:0]}; 
        end
        DTYPE__HALF_WORD:
        begin
            dout = {{48{din[15]}}, din[15:0]}; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            dout = {48'h0, din[15:0]}; 
        end
        DTYPE__BYTE:
        begin
            dout = {{56{din[7]}}, din[7:0]}; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            dout = {56'h0, din[7:0]}; 
        end
    endcase
end

endmodule
