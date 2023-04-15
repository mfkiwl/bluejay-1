//==============================================
// bus__trap
//==============================================
module bus__trap
(
    input clk,
    input rst,
    input [1:0] status,
    input cs__x,
    output logic ready__x,
    output logic resp__x,
    output logic [63:0] rd_data__x,
    output logic cs__y,
    input ready__y,
    input [63:0] rd_data__y
);


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
