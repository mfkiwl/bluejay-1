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
        3'h5:
        begin
            misaligned = 1'b0;
        end
        3'h6:
        begin
            misaligned = 1'b0;
        end
        3'h3:
        begin
            misaligned = (addr[0] != 1'b0);
        end
        3'h4:
        begin
            misaligned = (addr[0] != 1'b0);
        end
        3'h1:
        begin
            misaligned = (addr[1:0] != 2'h0);
        end
        3'h2:
        begin
            misaligned = (addr[1:0] != 2'h0);
        end
        3'h0:
        begin
            misaligned = (addr[2:0] != 3'h0);
        end
    endcase
end

always_comb begin
    case ()
end


endmodule
