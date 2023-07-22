//==============================================
// bus__physical_memory_attribute_checker 
//==============================================
module bus__physical_memory_attribute_checker
(
    input clk,
    input rst,
    input [2:0] addr, 
    input [1:0] size,
    input [7:0] pma,
    output logic [1:0] status
);

always_comb 
begin
    case (size)
        2'h0:
        begin
            status = (pma[1:1] == 1'b0) ? 2'h1 : 2'h0;
        end
        2'h1:
        begin
            status = (pma[2:2] == 1'b0) ? 2'h1 : (addr[0] != 1'b0) && (pma[5:5] == 1'b0) ? 2'h2 : 2'h0;
        end
        2'h2:
        begin
            status = (pma[3:3] == 1'b0) ? 2'h1 : (addr[1:0] != 2'h0) && (pma[5:5] == 1'b0) ? 2'h2 : 2'h0;
        end
        2'h3:
        begin
            status = (pma[4:4] == 1'b0) ? 2'h1 : (addr[2:0] != 3'h0) && (pma[5:5] == 1'b0)? 2'h2 : 2'h0;
        end
    endcase
end


endmodule
