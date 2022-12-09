//==============================================
// physical_memory_attribute_checker 
//==============================================
module physical_memory_attribute_checker
(
    input clk,
    input rst,
    input [39:0] addr,
    input [2:0] dtype,
    output logic [] status
);

always_comb
begin
    case (addr)
        4'h0:
        begin
        end
    endcase
end


//==============================================
// Physical Memory Attribute Register 
//==============================================
logic [7:0] pma__0;
assign pma__0 = 

B
H
W
D
BU
HU
WU

alway_comb begin
    case (dtype)
        DTYPE__B:
        begin
            misaligned = 1'b0;
        end
        DTYPE__BU:
        begin
            misaligned = 1'b0;
        end
        DTYPE__H:
        begin
            misaligned = (addr[0] != 1'b0);
        end
        DTYPE__HU:
        begin
            misaligned = (addr[0] != 1'b0);
        end
        DTYPE__W:
        begin
            misaligned = (addr[1:0] != 2'h0);
        end
        DTYPE__WU:
        begin
            misaligned = (addr[1:0] != 2'h0);
        end
        DTYPE__D:
        begin
            misaligned = (addr[2:0] != 3'h0);
        end
    endcase
end

always_comb begin
    case ()
end


endmodule
