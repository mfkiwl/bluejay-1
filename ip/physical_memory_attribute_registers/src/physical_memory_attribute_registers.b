//==============================================
// physical_memory_attribute_registers
//==============================================
module physical_memory_attribute_registers
(
    clk,
    rst,
    cs,
    we,
    addr,
    wr_data,
    rd_data,
    pma__0,
    pma__1,
    pma__2,
    pma__3,
    pma__4,
    pma__5,
    pma__6,
    pma__7
);


input clk;
input rst;
input cs;
input we;
input [2:0] addr;
input [7:0] wr_data;
output [7:0] rd_data;
output [7:0] pma__0;
output [7:0] pma__1;
output [7:0] pma__2;
output [7:0] pma__3;
output [7:0] pma__4;
output [7:0] pma__5;
output [7:0] pma__6;
output [7:0] pma__7;

logic clk;
logic rst;
logic cs;
logic we;
logic [2:0] addr;
logic [7:0] wr_data;
logic [7:0] rd_data;
logic [7:0] pma__0;
logic [7:0] pma__1;
logic [7:0] pma__2;
logic [7:0] pma__3;
logic [7:0] pma__4;
logic [7:0] pma__5;
logic [7:0] pma__6;
logic [7:0] pma__7;



always_comb
begin
    case (addr)
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__0:
        begin
            rd_data = pma__0; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__1:
        begin
            rd_data = pma__1; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__2:
        begin
            rd_data = pma__2; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__3:
        begin
            rd_data = pma__3; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__4:
        begin
            rd_data = pma__4; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__5:
        begin
            rd_data = pma__5; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__6:
        begin
            rd_data = pma__6; 
        end
        PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__7:
        begin
            rd_data = pma__7; 
        end
        default:
        begin
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;
        end
    endcase
end

//==============================================
// Physical Memory Attributes Register 0
//==============================================
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__MAIN_MEMORY;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;


//==============================================
// Physical Memory Attributes Register 1
//==============================================
assign pma__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO;
assign pma__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 2
//==============================================
assign pma__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO;
assign pma__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 3
//==============================================
assign pma__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO;
assign pma__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 4
//==============================================
assign pma__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO;
assign pma__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pma__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 5
//==============================================
assign pma__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO;
assign pma__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 6
//==============================================
assign pma__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO;
assign pma__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

//==============================================
// Physical Memory Attributes Register 7
//==============================================
assign pma__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MEMORY_TYPE__IO;
assign pma__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pma__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTERS__PMA__X__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;

endmodule
