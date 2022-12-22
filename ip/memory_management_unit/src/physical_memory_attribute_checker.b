//==============================================
// physical_memory_attribute_checker 
//==============================================
module physical_memory_attribute_checker
(
    input clk,
    input rst,
    input [2:0] addr, 
    input [2:0] dtype,
    input [7:0] pmar,
    output logic [1:0] status 
);

alway_comb begin
    case (dtype)
        DTYPE__BYTE:
        begin
            status = (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            status = (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        DTYPE__HALF_WORD:
        begin
            status = (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : (addr[0] != 1'b0) && (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            status = (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : (addr[0] != 1'b0) && (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        DTYPE__WORD:
        begin
            status = (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        DTYPE__WORD_UNSIGNED:
        begin
            status = (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        DTYPE__DOUBLE_WORD:
        begin
            status = (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0)? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
    endcase
end


endmodule
