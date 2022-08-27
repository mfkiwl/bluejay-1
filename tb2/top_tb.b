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
    .rst(rst),
    .port__0(port__0),
    .port__1(port__1)
);

// dut I/O
logic clk;
logic rst;
logic [63:0] port__0;
logic [63:0] port__1;

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
    // $readmemh("C:/Users/seanj/Documents/bluejay/sim/asm/basic/gen_64/ld", jay.mem.memory);

    #11;
    // de-assert rst
    rst = 1'b0;
    
    // @(posedge clk) begin
    //     if (top.cpu.WB__valid && (top.cpu.WB__op == OP__ECALL)) begin
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

// //==============================================
// // timescale
// //==============================================
// `timescale 1ns / 1ps

// //==============================================
// // jay__tb
// //==============================================
// module top_tb;

// //==============================
// // dut
// //==============================
// jay dut
// (
//     .clk(clk),
//     .rst(rst),
//     .l1_to_mem__addr(l1_to_mem__addr),
//     .l1_to_mem__wr_data(l1_to_mem__wr_data),
//     .l1_to_mem__rd_data(l1_to_mem__rd_data),
//     .l1_to_mem__en(l1_to_mem__en),
//     .l1_to_mem__we(l1_to_mem__we)
// );

// // DUT I/O
// logic clk;
// logic rst;
// logic [60:0] l1_to_mem__addr;
// logic [63:0] l1_to_mem__wr_data;
// logic [63:0] l1_to_mem__rd_data;
// logic l1_to_mem__en;
// logic l1_to_mem__we;

// // Memory I/O
// logic [11:0] addra;
// logic [63:0] dina;
// logic [63:0] douta;
// logic ena;
// logic wea;

// // Memory initialization
// logic [11:0] init__addra;
// logic [63:0] init__dina;
// logic init__ena;
// logic init__wea;

// // File
// int file;


// // 10 ns clock
// always begin
//     #5 clk = !clk;
// end

// // test block
// initial begin
//     // initialize clk
//     clk = 1'b1;
//     rst = 1'b1;
//     file = $fopen("C:/Users/seanj/Documents/bluejay/sim/basic/addi.txt")

//     while (!$foef(file)) begin
//         $fscanf(file, "%h", init__dina)
//     end

//     // initialize instruction memory
//     // $readmemh("C:/Users/seanj/Documents/bluejay/sim/asm/basic/gen_64/ld", jay.mem.memory);

//     #11;
//     // de-assert rst
//     rst = 1'b0;
    
//     // @(posedge clk) begin
//     //     if (top.cpu.WB__valid && (top.cpu.WB__op == OP__ECALL)) begin
//     //         $finish;
//     //     end
//     // end

//     #15000;
//     $finish;
// end

// endmodule


// //==============================================
// // intf
// //==============================================
// interface intf
// (
//     input clk
// );

// logic rst;

// endinterface

// //==============================================
// // driver
// //==============================================
// class driver;

// // Virtual interface
// virtual intf vif;





// endclass