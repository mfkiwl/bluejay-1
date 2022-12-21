//==============================================
// physical_memory_attribute_checker 
//==============================================
module physical_memory_attribute_checker
(
    input clk,
    input rst,
    input [7:0] pma
    input [2:0] addr, 
    input [2:0] dtype,
    output logic [1:0] status 
);

alway_comb begin
    case (dtype)
        DTYPE__B:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTES__BYTE_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__ACCESS_FAULT : PMA_STATUS__OK;
        end
        DTYPE__BU:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTES__BYTE_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__ACCESS_FAULT : PMA_STATUS__OK;
        end
        DTYPE__H:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTES__HALF_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__ACCESS_FAULT : (addr[0] != 1'b0) && (pma[PHYSICAL_MEMORY_ATTRIBUTES__MISALIGNED_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__MISALIGNED_ADDRESS : PMA_STATUS__OK;
        end
        DTYPE__HU:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTES__HALF_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__ACCESS_FAULT : (addr[0] != 1'b0) && (pma[PHYSICAL_MEMORY_ATTRIBUTES__MISALIGNED_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__MISALIGNED_ADDRESS : PMA_STATUS__OK;
        end
        DTYPE__W:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTES__WORD_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma[PHYSICAL_MEMORY_ATTRIBUTES__MISALIGNED_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__MISALIGNED_ADDRESS : PMA_STATUS__OK;
        end
        DTYPE__WU:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTES__WORD_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma[PHYSICAL_MEMORY_ATTRIBUTES__MISALIGNED_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__MISALIGNED_ADDRESS : PMA_STATUS__OK;
        end
        DTYPE__D:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTES__DOUBLE_ACCESS_SUPPORTED__FIELD] != 1'b1) ? PMA_STATUS__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma[PHYSICAL_MEMORY_ATTRIBUTES__MISALIGNED_ACCESS_SUPPORTED__FIELD] != 1'b1)? PMA_STATUS__MISALIGNED_ADDRESS : PMA_STATUS__OK;
        end
    endcase
end


endmodule
