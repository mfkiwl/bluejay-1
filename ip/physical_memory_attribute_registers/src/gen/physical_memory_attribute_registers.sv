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
    output logic [7:0] pma__0,
    output logic [7:0] pma__1,
    output logic [7:0] pma__2,
    output logic [7:0] pma__3,
    output logic [7:0] pma__4,
    output logic [7:0] pma__5,
    output logic [7:0] pma__6,
    output logic [7:0] pma__7
);


always_comb
begin
    case (addr)
        3'h0:
        begin
            rd_data = pma__0; 
        end
        3'h1:
        begin
            rd_data = pma__1; 
        end
        3'h2:
        begin
            rd_data = pma__2; 
        end
        3'h3:
        begin
            rd_data = pma__3; 
        end
        3'h4:
        begin
            rd_data = pma__4; 
        end
        3'h5:
        begin
            rd_data = pma__5; 
        end
        3'h6:
        begin
            rd_data = pma__6; 
        end
        3'h7:
        begin
            rd_data = pma__7; 
        end
        default:
        begin
            rd_data[0:0] = 1'b0;
            rd_data[1:1] = 1'b0;
            rd_data[2:2] = 1'b0;
            rd_data[3:3] = 1'b0;
            rd_data[4:4] = 1'b0;
            rd_data[5:5] = 1'b0;
        end
    endcase
end

//==============================================
// Physical Memory Attributes Register 0
//==============================================
assign pma__0[0:0] = 1'b0;
assign pma__0[1:1] = 1'b1;
assign pma__0[2:2] = 1'b1;
assign pma__0[3:3] = 1'b1;
assign pma__0[4:4] = 1'b1;
assign pma__0[5:5] = 1'b0;


//==============================================
// Physical Memory Attributes Register 1
//==============================================
assign pma__1[0:0] = 1'b0;
assign pma__1[1:1] = 1'b0;
assign pma__1[2:2] = 1'b0;
assign pma__1[3:3] = 1'b1;
assign pma__1[4:4] = 1'b0;
assign pma__1[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 2
//==============================================
assign pma__2[0:0] = 1'b0;
assign pma__2[1:1] = 1'b0;
assign pma__2[2:2] = 1'b0;
assign pma__2[3:3] = 1'b0;
assign pma__2[4:4] = 1'b1;
assign pma__2[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 3
//==============================================
assign pma__3[0:0] = 1'b0;
assign pma__3[1:1] = 1'b1;
assign pma__3[2:2] = 1'b0;
assign pma__3[3:3] = 1'b0;
assign pma__3[4:4] = 1'b0;
assign pma__3[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 4
//==============================================
assign pma__4[0:0] = 1'b0;
assign pma__4[1:1] = 1'b1;
assign pma__4[2:2] = 1'b0;
assign pma__4[3:3] = 1'b0;
assign pma__4[4:4] = 1'b0;
assign pma__4[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 5
//==============================================
assign pma__5[0:0] = 1'b0;
assign pma__5[1:1] = 1'b0;
assign pma__5[2:2] = 1'b0;
assign pma__5[3:3] = 1'b0;
assign pma__5[4:4] = 1'b0;
assign pma__5[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 6
//==============================================
assign pma__6[0:0] = 1'b0;
assign pma__6[1:1] = 1'b0;
assign pma__6[2:2] = 1'b0;
assign pma__6[3:3] = 1'b0;
assign pma__6[4:4] = 1'b0;
assign pma__6[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 7
//==============================================
assign pma__7[0:0] = 1'b0;
assign pma__7[1:1] = 1'b0;
assign pma__7[2:2] = 1'b0;
assign pma__7[3:3] = 1'b0;
assign pma__7[4:4] = 1'b0;
assign pma__7[5:5] = 1'b0;

endmodule
