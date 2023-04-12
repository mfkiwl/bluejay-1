//==============================================
// bus__physical_memory_attribute_checker 
//==============================================
module bus__physical_memory_attribute_checker
(
    clk,
    rst,
    addr, 
    size,
    pma,
    status 
);

input clk;
input rst;
input [2:0] addr; 
input [1:0] size;
input [7:0] pma;
output [1:0] status;

logic clk;
logic rst;
logic [2:0] addr; 
logic [1:0] size;
logic [7:0] pma;
logic [1:0] status;

always_comb 
begin
    case (size)
        SIZE__BYTE:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        SIZE__HALF_WORD:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : (addr[0] != 1'b0) && (pma[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        SIZE__WORD:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : (addr[1:0] != 2'h0) && (pma[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
        SIZE__DOUBLE_WORD:
        begin
            status = (pma[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] == 1'b0) ? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT : (addr[2:0] != 3'h0) && (pma[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] == 1'b0)? PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS : PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__OK;
        end
    endcase
end


endmodule
