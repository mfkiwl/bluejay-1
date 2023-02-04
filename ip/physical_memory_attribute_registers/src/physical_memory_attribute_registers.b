//==============================================
// physical_memory_attribute_registers
//==============================================
module physical_memory_attribute_registers
(
    input clk,
    input rst,
    input cs,
    input we,
    input [2:0] addr,
    input [7:0] wr_data,
    output logic [7:0] rd_data,
    output logic [7:0] pmar__0,
    output logic [7:0] pmar__1,
    output logic [7:0] pmar__2,
    output logic [7:0] pmar__3,
    output logic [7:0] pmar__4,
    output logic [7:0] pmar__5,
    output logic [7:0] pmar__6,
    output logic [7:0] pmar__7
);

always_comb
begin
    case (addr)
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__0:
        begin
            rd_data = pmar__0; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__1:
        begin
            rd_data = pmar__1; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__2:
        begin
            rd_data = pmar__2; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__3:
        begin
            rd_data = pmar__3; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__4:
        begin
            rd_data = pmar__4; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__5:
        begin
            rd_data = pmar__5; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__6:
        begin
            rd_data = pmar__6; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__7:
        begin
            rd_data = pmar__7; 
        end
        default:
        begin
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__IO;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;
        end
    endcase
end

//==============================================
// Physical Memory Attributes Register 0
//==============================================
logic [7:0] pmar__0;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 1
//==============================================
logic [7:0] pmar__1;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b1;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 2
//==============================================
logic [7:0] pmar__2;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b1;

//==============================================
// Physical Memory Attributes Register 3
//==============================================
logic [7:0] pmar__3;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__MAIN_MEMORY;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b1;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b1;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 4
//==============================================
logic [7:0] pmar__4;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 5
//==============================================
logic [7:0] pmar__5;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 6
//==============================================
logic [7:0] pmar__6;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 7
//==============================================
logic [7:0] pmar__7;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

endmodule
