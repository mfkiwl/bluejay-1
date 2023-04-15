//==============================================
// bus__physical_memory_attribute_multiplexer
//==============================================
module bus__physical_memory_attribute_multiplexer
(
    input clk,
    input rst,
    input [2:0] sel,
    input [7:0] pma__0,
    input [7:0] pma__1,
    input [7:0] pma__2,
    input [7:0] pma__3,
    input [7:0] pma__4,
    input [7:0] pma__5,
    input [7:0] pma__6,
    input [7:0] pma__7,
    output logic [7:0] pma
);

always_comb
begin
    case (sel)
        3'h0:
        begin
            pma = pma__0;
        end
        3'h1:
        begin
            pma = pma__1;
        end
        3'h2:
        begin
            pma = pma__2;
        end
        3'h2:
        begin
            pma = pma__3;
        end
        3'h4:
        begin
            pma = pma__4;
        end
        3'h5:
        begin
            pma = pma__5;
        end
        3'h6:
        begin
            pma = pma__6;
        end
        3'h7:
        begin
            pma = pma__7;
        end
    endcase
end


endmodule
