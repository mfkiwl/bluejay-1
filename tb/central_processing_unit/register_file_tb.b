//==============================================
// timescale
//==============================================
`timescale 1ns / 1ps

//==============================================
// register_file_tb
//==============================================
module register_file_tb;

// dut
register_file dut
(
    .clk(clk),
    .rst(rst),
    .we(we),
    .rd_addr_0(rd_addr_0),
    .rd_data_0(rd_data_0),
    .rd_addr_1(rd_addr_1),
    .rd_data_1(rd_data_1),
    .wr_addr(wr_addr),
    .wr_data(wr_data)
);

// dut I/O
logic clk;
logic rst;
logic we;
logic [LOG2(NUM_GPR)-1:0] rd_addr_0;
logic [WIDTH-1:0] rd_data_0;
logic [LOG2(NUM_GPR)-1:0] rd_addr_1;
logic [WIDTH-1:0] rd_data_1;
logic [LOG2(NUM_GPR)-1:0] wr_addr;
logic [WIDTH-1:0] wr_data;

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
    tb_in = $fopen("C:/Users/seanj/Documents/bluejay/sim/t.txt","r");
    tb_out = $fopen("C:/Users/seanj/Documents/bluejay/sim/abc.txt","w");

    // read the contents of the file tb_in.txt as hexadecimal values
    while (!$feof(tb_in)) begin
        $fscanf(tb_in, "%b\n", {rst, we, rd_addr_0, rd_addr_1, wr_addr, wr_data});
        $fwrite(tb_out, "%b\n", {rd_data_0, rd_data_1});
        #10;
    end

    // close files
    $fclose(tb_in);
    $fclose(tb_out);
    $finish;
end

endmodule
