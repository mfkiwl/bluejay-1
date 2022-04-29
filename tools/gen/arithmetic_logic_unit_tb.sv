//==============================================
// timescale
//==============================================
`timescale 1ns / 1ps

//==============================================
// arithmetic_logic_unit_tb
//==============================================
module arithmetic_logic_unit_tb;

//==============================
// dut
//==============================
arithmetic_logic_unit dut
(
    .clk(clk),
    .rst(rst),
    .func(func),
    .data_0(data_0),
    .data_1(data_1),
    .data_2(data_2)
);

// dut I/O
logic clk;
logic rst;
logic [3:0] func;
logic [63:0] data_0;
logic [63:0] data_1;
logic [63:0] data_2;

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
    file = $fopen("C:/Users/seanj/Documents/bluejay/sim/central_processing_unit/arithmetic_logic_unit/gen/t_0.txt","r");

    // read the contents of the file as hexadecimal values
    #1;
    while (!$feof(file)) begin
        $fscanf(file, "%b\n", {rst, func, data_0, data_1});
        #10;
    end

    // close file
    $fclose(file);
    $finish;
end

endmodule
