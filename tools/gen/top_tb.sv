//==============================================
// timescale
//==============================================
`timescale 1ns / 1ps

//==============================================
// top_tb
//==============================================
module top_tb;

//==============================
// dut
//==============================
top dut
(
    .clk(clk),
    .rst(rst)
);

// dut I/O
logic clk;
logic rst;

// 10 ns clock
always begin
    #5 clk = !clk;
end

// test block
initial begin
    // initialize clk
    clk = 1'b1;
    // initialize instruction memory
    //$readmemh("C:/Users/seanj/Documents/bluejay/code/jalr.txt", instr_memory);

    #1;
    // assert rst
    rst = 1'b1;
    #10;
    rst = 1'b0;
    
    #300;
    $finish;
end

endmodule