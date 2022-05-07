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
jay dut
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
    rst = 1'b1;
    // initialize instruction memory
    $readmemh("C:/Users/seanj/Documents/bluejay/sim/asm/basic/gen_64/ld", jay.mem.memory);

    #11;
    // de-assert rst
    rst = 1'b0;
    
    // @(posedge clk) begin
    //     if (top.cpu.WB__valid && (top.cpu.WB__op == 6'h34)) begin
    //         $finish;
    //     end
    // end

    #15000;
    $finish;
end

endmodule


//==============================================
// intf
//==============================================
interface intf
(
    input clk
);

logic rst;

endinterface

//==============================================
// driver
//==============================================
class driver;

// Virtual interface
virtual intf vif;





endclass