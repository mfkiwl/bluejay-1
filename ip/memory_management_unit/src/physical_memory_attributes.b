//==============================================
// physical_memory_attributes
//==============================================
module physical_memory_attributes
(
    input clk,
    input rst,
    input [39:0] addr,
    output logic [7:0] rd_data,
);

always_comb
begin
    casez (addr)
        MEMORY_MAP_REGION__0:
        begin
            rd_data = pma__0; 
        end
        MEMORY_MAP_REGION__1:
        begin
            rd_data = pma__1; 
        end
        default:
        begin
            rd_data[PHYSICAL_MEMORY_ATTRIBUTES__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTES__MEMORY_TYPE__IO;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTES__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTES__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTES__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTES__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
        end
    endcase
end

//==============================================
// Physical Memory Attributes Register 0 
//==============================================
logic [7:0] pma__0;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTES__MEMORY_TYPE__MAIN_MEMORY;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__HALF_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__WORD_ACCESS_SUPPORTED_FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b1;

//==============================================
// Physical Memory Attributes Register 1 
//==============================================
logic [7:0] pma__1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTES__TYPE__IO;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__HALF_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__WORD_ACCESS_SUPPORTED_FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTES__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b1;


endmodule
