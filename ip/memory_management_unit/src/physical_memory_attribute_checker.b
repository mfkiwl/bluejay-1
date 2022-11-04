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

logic misaligned;


always_comb begin
    casez (addr)
        40'b0000_0000_0000_0000_0000_????_????_????_????_????:
        begin
            
        end
        40'b0000_0000_0000_0000_0001_????_????_????_????_????:
        begin
        end
    endcase
end

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
