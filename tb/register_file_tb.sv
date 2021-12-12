//==============================================
// timescale
//==============================================
`timescale 1ns / 1ps

//==============================================
// register_file
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
    logic [4:0] rd_addr_0;
    logic [63:0] rd_data_0;
    logic [4:0] rd_addr_1;
    logic [63:0] rd_data_1;
    logic [4:0] wr_addr;
    logic [63:0] wr_data;

    // 10 ns clock
    always begin
        #5 clk = !clk;
    end

    // test block
    initial begin
        $display("unit test: register_file");
    end
    
    
endmodule