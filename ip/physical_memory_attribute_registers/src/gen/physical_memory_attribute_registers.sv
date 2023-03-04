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
    pmar__0,
    pmar__1,
    pmar__2,
    pmar__3,
    pmar__4,
    pmar__5,
    pmar__6,
    pmar__7
);


input clk;
input rst;
input cs;
input we;
input [2:0] addr;
input [7:0] wr_data;
output [7:0] rd_data;
output [7:0] pmar__0;
output [7:0] pmar__1;
output [7:0] pmar__2;
output [7:0] pmar__3;
output [7:0] pmar__4;
output [7:0] pmar__5;
output [7:0] pmar__6;
output [7:0] pmar__7;

logic clk;
logic rst;
logic cs;
logic we;
logic [2:0] addr;
logic [7:0] wr_data;
logic [7:0] rd_data;
logic [7:0] pmar__0;
logic [7:0] pmar__1;
logic [7:0] pmar__2;
logic [7:0] pmar__3;
logic [7:0] pmar__4;
logic [7:0] pmar__5;
logic [7:0] pmar__6;
logic [7:0] pmar__7;



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
assign pmar__0[0:0] = 1;
assign pmar__0[1:1] = 1'b1;
assign pmar__0[2:2] = 1'b1;
assign pmar__0[3:3] = 1'b1;
assign pmar__0[4:4] = 1'b1;
assign pmar__0[5:5] = 1'b0;


//==============================================
// Physical Memory Attributes Register 1
//==============================================
assign pmar__1[0:0] = 0;
assign pmar__1[1:1] = 1'b0;
assign pmar__1[2:2] = 1'b0;
assign pmar__1[3:3] = 1'b1;
assign pmar__1[4:4] = 1'b0;
assign pmar__1[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 2
//==============================================
assign pmar__2[0:0] = 0;
assign pmar__2[1:1] = 1'b0;
assign pmar__2[2:2] = 1'b0;
assign pmar__2[3:3] = 1'b0;
assign pmar__2[4:4] = 1'b1;
assign pmar__2[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 3
//==============================================
assign pmar__3[0:0] = 0;
assign pmar__3[1:1] = 1'b1;
assign pmar__3[2:2] = 1'b0;
assign pmar__3[3:3] = 1'b0;
assign pmar__3[4:4] = 1'b0;
assign pmar__3[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 4
//==============================================
assign pmar__4[0:0] = 0;
assign pmar__4[1:1] = 1'b1;
assign pmar__4[2:2] = 1'b0;
assign pmar__4[3:3] = 1'b0;
assign pmar__4[4:4] = 1'b0;
assign pmar__4[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 5
//==============================================
assign pmar__5[0:0] = 0;
assign pmar__5[1:1] = 1'b0;
assign pmar__5[2:2] = 1'b0;
assign pmar__5[3:3] = 1'b0;
assign pmar__5[4:4] = 1'b0;
assign pmar__5[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 6
//==============================================
assign pmar__6[0:0] = 0;
assign pmar__6[1:1] = 1'b0;
assign pmar__6[2:2] = 1'b0;
assign pmar__6[3:3] = 1'b0;
assign pmar__6[4:4] = 1'b0;
assign pmar__6[5:5] = 1'b0;

//==============================================
// Physical Memory Attributes Register 7
//==============================================
assign pmar__7[0:0] = 0;
assign pmar__7[1:1] = 1'b0;
assign pmar__7[2:2] = 1'b0;
assign pmar__7[3:3] = 1'b0;
assign pmar__7[4:4] = 1'b0;
assign pmar__7[5:5] = 1'b0;

endmodule
