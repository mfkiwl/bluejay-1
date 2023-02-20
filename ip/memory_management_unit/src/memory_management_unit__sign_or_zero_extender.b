//==============================================
// memory_management_unit__sign_or_zero_extender
//==============================================
module memory_management_unit__sign_or_zero_extender
(
    input clk,
    input rst,
    input [2:0] dtype,
    input [63:0] data__in,
    input [63:0] data__out,
);

always_comb
begin
    case (dtype)
        DTYPE__DOUBLE_WORD:
        begin
            data__out = data__in; 
        end
        DTYPE__WORD:
        begin
            data__out = {{32{data__in[31]}}, data__in[31:0]}; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            data__out = {32'h0, data__in[31:0]}; 
        end
        DTYPE__HALF_WORD:
        begin
            data__out = {{48{data__in[15]}}, data__in[15:0]}; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            data__out = {48'h0, data__in[15:0]}; 
        end
        DTYPE__BYTE:
        begin
            data__out = {{56{data__in[7]}}, data__in[7:0]}; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            data__out = {56'h0, data__in[7:0]}; 
        end
    endcase
end

endmodule
