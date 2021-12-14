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

    // tb_data is an array which will be loaded with the test's input stimulus 
    logic [80:0] tb_data [3:0];
    // index for the tb_data array
    integer tb_i;
    // file id number
    integer tb_file_id;

    // test block
    initial begin
        $display("unit: register_file");
       
        // initialize clk
        clk = 1'b1;
        // load test stimulus into tb_data 
        $readmemb("C:/Users/seanj/Documents/bluejay/sim/t.txt", tb_data);
        tb_file_id = $fopen("C:/Users/seanj/Documents/bluejay/sim/z.txt", "w");
        for (tb_i = 0; tb_i < 4; tb_i = tb_i + 1) begin
            {rst, we, rd_addr_0, rd_addr_1, wr_addr, wr_data} = tb_data[tb_i];
            $fwrite(tb_file_id, "%b_%b\n", rd_data_0, rd_data_1);
            $display("%h", tb_data[tb_i]);
            #10;
        end
        $fclose(tb_file_id);
        $finish;
    end
    
    
endmodule
