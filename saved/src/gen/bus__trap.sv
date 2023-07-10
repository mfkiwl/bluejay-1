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
        2'h0:
        begin
            cs__y = cs__x;
            resp__x = 1'b0;
            ready__x = ready__y;
            rd_data__x = rd_data__y;
        end
        2'h1:
        begin
            cs__y = 1'b0;
            resp__x = 1'b1;
            ready__x = 1'b1;
            rd_data__x = 64'h0;
        end
        2'h2:
        begin
            cs__y = 1'b0;
            resp__x = 1'b1;
            ready__x = 1'b1;
            rd_data__x = 64'h1;
        end
        default:
        begin
            cs__y = 1'b0;
            resp__x = 1'b1;
            ready__x = 1'b1;
            rd_data__x = 64'h0;
        end
    endcase
end

endmodule
