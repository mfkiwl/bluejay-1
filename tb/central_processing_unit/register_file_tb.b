//==============================================
// timescale
//==============================================
`timescale 1ns / 1ps

//==============================================
// register_file_tb
//==============================================
module register_file_tb;

//==============================
// dut
//==============================
register_file dut
(
    .clk(clk),
    .rst(rst),
    .we(we),
    .rs1(rs1),
    .rs1_data(rs1_data),
    .rs2(rs2),
    .rs2_data(rs2_data),
    .rd(rd),
    .rd_data(rd_data)
);

// dut I/O
logic clk;
logic rst;
logic we;
logic [4:0] rs1;
logic [63:0] rs1_data;
logic [4:0] rs2;
logic [63:0] rs2_data;
logic [4:0] rd;
logic [63:0] rd_data;

// 10 ns clock
always begin
    #5 clk = !clk;
end

// file descriptors
integer file;

// test block
initial begin
    // initialize clk
    clk = 1'b1;

    // open file
    file = $fopen("C:/Users/seanj/Documents/bluejay/sim/central_processing_unit/register_file/gen/t_0.txt","r");

    // read the contents of the file as hexadecimal values
    #1;
    while (!$feof(file)) begin
        $fscanf(file, "%b\n", {rst, we, rs1, rs2, rd, rd_data});
        #10;
    end

    // close file
    $fclose(file);
    $finish;
end

endmodule
