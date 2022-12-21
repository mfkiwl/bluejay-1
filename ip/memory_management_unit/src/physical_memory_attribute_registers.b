//==============================================
// physical_memory_attribute_registers
//==============================================
module physical_memory_attribute_registers
(
    input clk,
    input rst,
    input [2:0] addr,
    output logic [7:0] rd_data,
);

always_comb
begin
    case (addr)
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__0:
        begin
            rd_data = pma__0; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__1:
        begin
            rd_data = pma__1; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__2:
        begin
            rd_data = pma__2; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__3:
        begin
            rd_data = pma__3; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__4:
        begin
            rd_data = pma__4; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__5:
        begin
            rd_data = pma__5; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__6:
        begin
            rd_data = pma__6; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__7:
        begin
            rd_data = pma__7; 
        end
        default:
        begin
            rd_data[PMA__MEMORY_TYPE__FIELD] = PMA__MEMORY_TYPE__IO;
            rd_data[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
            rd_data[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
        end
    endcase
end

//==============================================
// Physical Memory Attributes Register 0
//==============================================
logic [7:0] pma__0;
assign pma__0[PMA__MEMORY_TYPE__FIELD] = PMA__MEMORY_TYPE__MAIN_MEMORY;
assign pma__0[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b1;
assign pma__0[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b1;
assign pma__0[PMA__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 1
//==============================================
logic [7:0] pma__1;
assign pma__1[PMA__MEMORY_TYPE__FIELD] = PMA__TYPE__IO;
assign pma__1[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__1[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__1[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b1;
assign pma__1[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pma__1[PMA__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 2
//==============================================
logic [7:0] pma__2;
assign pma__2[PMA__MEMORY_TYPE__FIELD] = PMA__TYPE__IO;
assign pma__2[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__2[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__2[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pma__2[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pma__2[PMA__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b1;

//==============================================
// Physical Memory Attributes Register 3
//==============================================
logic [7:0] pma__3;
assign pma__3[PMA__MEMORY_TYPE__FIELD] = PMA__TYPE__IO;
assign pma__3[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__3[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__3[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pma__3[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pma__3[PMA__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 4
//==============================================
logic [7:0] pma__4;
assign pma__4[PMA__MEMORY_TYPE__FIELD] = PMA__TYPE__IO;
assign pma__4[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__4[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__4[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pma__4[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pma__4[PMA__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 5
//==============================================
logic [7:0] pma__5;
assign pma__5[PMA__MEMORY_TYPE__FIELD] = PMA__TYPE__IO;
assign pma__5[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__5[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__5[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pma__5[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pma__5[PMA__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 6
//==============================================
logic [7:0] pma__6;
assign pma__6[PMA__MEMORY_TYPE__FIELD] = PMA__TYPE__IO;
assign pma__6[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__6[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__6[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pma__6[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pma__6[PMA__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 7
//==============================================
logic [7:0] pma__7;
assign pma__7[PMA__MEMORY_TYPE__FIELD] = PMA__TYPE__IO;
assign pma__7[PMA__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__7[PMA__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__7[PMA__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pma__7[PMA__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pma__7[PMA__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

endmodule
