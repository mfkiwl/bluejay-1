//==============================================
// timescale
//==============================================
`timescale 1ns / 1ps

//==============================================
// central_processing_unit_tb
//==============================================
module central_processing_unit_tb;

//==============================
// dut
//==============================
central_processing_unit dut
(
    .clk(clk),
    .rst(rst),
    .IF__pc(IF__pc),
    .IF__ir(IF__ir)
);

// dut I/O
logic clk;
logic rst;
logic [63:0] IF__pc;
logic [31:0] IF__ir;

// 10 ns clock
always begin
    #5 clk = !clk;
end

// instruction memory
logic [31:0] instr_memory [15:0];
assign IF__ir = instr_memory[IF__pc[5:2]];

// test block
initial begin
    // initialize clk
    clk = 1'b1;
    // initialize instruction memory
    $readmemh("C:/Users/seanj/Documents/bluejay/code/jalr.txt", instr_memory);

    #1;
    // assert rst
    rst = 1'b1;
    #10;
    rst = 1'b0;
    
    #300;
    $finish;
end

endmodule