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
    .ir(ir),
    .IF__ready(IF__ready)
);

// dut I/O
logic clk;
logic rst;
logic [31:0] ir;
logic IF__ready;

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
    file = $fopen("C:/Users/seanj/Documents/bluejay/sim/central_processing_unit/gen/t_beq.txt","r");

    // read the contents of the file as hexadecimal values
    #1;
    while (!$feof(file)) begin
        $fscanf(file, "%b\n", {rst, ir});
        #10;
        while (!IF__ready) begin
            #10;
        end
    end

    // close file
    $fclose(file);
    $finish;
end

endmodule