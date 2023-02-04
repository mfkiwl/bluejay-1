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
        3'h0:
        begin
            rd_data = pmar__0; 
        end
        3'h1:
        begin
            rd_data = pmar__1; 
        end
        3'h2:
        begin
            rd_data = pmar__2; 
        end
        3'h3:
        begin
            rd_data = pmar__3; 
        end
        3'h0:
        begin
            rd_data = pmar__4; 
        end
        3'h1:
        begin
            rd_data = pmar__5; 
        end
        3'h2:
        begin
            rd_data = pmar__6; 
        end
        3'h3:
        begin
            rd_data = pmar__7; 
        end
        default:
        begin
            rd_data[0:0] = 0;
            rd_data[1:1] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
            rd_data[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
            rd_data[5:5] = 1'b0;
        end
    endcase
end

//==============================================
// Physical Memory Attributes Register 0
//==============================================
logic [7:0] pmar__0;
assign pmar__0[0:0] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__0[1:1] = 1'b1;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__0[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__0[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 1
//==============================================
logic [7:0] pmar__1;
assign pmar__1[0:0] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__1[1:1] = 1'b0;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b1;
assign pmar__1[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__1[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 2
//==============================================
logic [7:0] pmar__2;
assign pmar__2[0:0] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__2[1:1] = 1'b0;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__2[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__2[5:5] = 1'b1;

//==============================================
// Physical Memory Attributes Register 3
//==============================================
logic [7:0] pmar__3;
assign pmar__3[0:0] = 1;
assign pmar__3[1:1] = 1'b1;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b1;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b1;
assign pmar__3[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b1;
assign pmar__3[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 4
//==============================================
logic [7:0] pmar__4;
assign pmar__4[0:0] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__4[1:1] = 1'b1;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__4[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__4[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 5
//==============================================
logic [7:0] pmar__5;
assign pmar__5[0:0] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__5[1:1] = 1'b0;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__5[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__5[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 6
//==============================================
logic [7:0] pmar__6;
assign pmar__6[0:0] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__6[1:1] = 1'b0;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__6[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__6[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 7
//==============================================
logic [7:0] pmar__7;
assign pmar__7[0:0] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__TYPE__IO;
assign pmar__7[1:1] = 1'b0;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_ACCESS_SUPPORTED__FIELD] = 1'b0;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED_FIELD] = 1'b0;
assign pmar__7[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_ACCESS_SUPORTED_FIELD] = 1'b0;
assign pmar__7[5:5] = 1'b0;

endmodule
