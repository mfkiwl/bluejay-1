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

// tb file descriptors
integer tb_in, tb_out;

// test block
initial begin
    $display("unit: register_file");
   
    // initialize clk
    clk = 1'b1;

    // open files
    tb_in = $fopen("C:/Users/seanj/Documents/bluejay/tools/gen/tb_in.txt","r");
    tb_out = $fopen("C:/Users/seanj/Documents/bluejay/tools/gen/tb_out.txt","w");

    #1;
    // read the contents of the file tb_in.txt as hexadecimal values
    while (!$feof(tb_in)) begin
        $fscanf(tb_in, "%b\n", {rst, we, rs1, rs2, rd, rd_data});
        #1;
        $fwrite(tb_out, "%b\n", {rs1_data, rs2_data});
        #9;
    end

    // close files
    $fclose(tb_in);
    $fclose(tb_out);
    $finish;
end

endmodule
