//==============================================
// physical_memory_attribute_checker 
//==============================================
module physical_memory_attribute_checker
(
    clk,
    rst,
    addr, 
    dtype,
    pmar,
    status 
);

input clk;
input rst;
input [2:0] addr; 
input [2:0] dtype;
input [7:0] pmar;
output [1:0] status;

logic clk;
logic rst;
logic [2:0] addr; 
logic [2:0] dtype;
logic [7:0] pmar;
logic [1:0] status;

always_comb 
begin
    case (dtype)
        3'h5:
        begin
            status = (pmar[1:1] == 1'b0) ? 2'h1 : 2'h0;
        end
        3'h6:
        begin
            status = (pmar[1:1] == 1'b0) ? 2'h1 : 2'h0;
        end
        3'h3:
        begin
            status = (pmar[2:2] == 1'b0) ? 2'h1 : (addr[0] != 1'b0) && (pmar[5:5] == 1'b0) ? 2'h2 : 2'h0;
        end
        3'h4:
        begin
            status = (pmar[2:2] == 1'b0) ? 2'h1 : (addr[0] != 1'b0) && (pmar[5:5] == 1'b0) ? 2'h2 : 2'h0;
        end
        3'h1:
        begin
            status = (pmar[3:3] == 1'b0) ? 2'h1 : (addr[1:0] != 2'h0) && (pmar[5:5] == 1'b0) ? 2'h2 : 2'h0;
        end
        3'h2:
        begin
            status = (pmar[3:3] == 1'b0) ? 2'h1 : (addr[1:0] != 2'h0) && (pmar[5:5] == 1'b0) ? 2'h2 : 2'h0;
        end
        3'h0:
        begin
            status = (pmar[4:4] == 1'b0) ? 2'h1 : (addr[2:0] != 3'h0) && (pmar[5:5] == 1'b0)? 2'h2 : 2'h0;
        end
    endcase
end


endmodule
