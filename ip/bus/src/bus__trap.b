//==============================================
// bus__trap
//==============================================
module bus__trap
(
    clk,
    rst,
    status,
    cs__x,
    ready__x,
    resp__x,
    rd_data__x,
    cs__y,
    ready__y,
    rd_data__y
);

input clk;
input rst;

input [1:0] status;

input cs__x;
output ready__x;
output resp__x;
output [63:0] rd_data__x;

output cs__y;
input ready__y;
input [63:0] rd_data__y;

logic cs__x;
logic ready__x;
logic resp__x;
logic [63:0] rd_data__x;

logic cs__y;
//logic ready__y;
//logic [63:0] rd_data__y;

always_comb
begin
    case (status)
        PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK:
        begin
            cs__y = cs__x;
            resp__x = 1'b0;
            ready__x = ready__y;
            rd_data__x = rd_data__y;
        end
        PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT:
        begin
            cs__y = 1'b0;
            resp__x = 1'b1;
            ready__x = 1'b1;
            rd_data__x = ERRORCODE__ACCESS_FAULT;
        end
        PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS:
        begin
            cs__y = 1'b0;
            resp__x = 1'b1;
            ready__x = 1'b1;
            rd_data__x = ERRORCODE__MISALIGNED_ADDRESS;
        end
        default:
        begin
            cs__y = 1'b0;
            resp__x = 1'b1;
            ready__x = 1'b1;
            rd_data__x = ERRORCODE__ACCESS_FAULT;
        end
    endcase
end

endmodule
