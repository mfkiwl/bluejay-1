//==============================================
// timescale
//==============================================
`timescale 1ns / 1ps

//==============================================
// register_file_tb
//==============================================
module practice;

logic clk;
logic rst;
logic [63:0] a, b, c;
logic [31:0] d, e, f;
logic [63:0] z;

// 10 ns clock
always begin
    #5 clk = !clk;
end

// test block
initial begin
    $display("unit: register_file");
   
    // initialize clk
    clk = 1'b1;
    rst = 1'b0;
    a = -256;
    b = 5;
    c = a >>> 8;
    z = (a[63] == b[63]) ? a < b : a[63];
    
    d = 32'haa_a0_00_00;
    e = 8;
    f = $signed(a) < $signed(b);

    #100;
    $finish;
end

endmodule