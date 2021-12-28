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
    .ir(ir)
);

// dut I/O
logic clk;
logic rst;
logic [31:0] ir;

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
    file = $fopen("C:/Users/seanj/Documents/bluejay/sim/central_processing_unit/gen/t_0.txt","r");

    // read the contents of the file as hexadecimal values
    #1;
    while (!$feof(file)) begin
        $fscanf(file, "%b\n", {rst, ir});
        #10;
    end

    // close file
    $fclose(file);
    $finish;
end

endmodule