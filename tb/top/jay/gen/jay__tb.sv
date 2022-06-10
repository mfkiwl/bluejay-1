//==============================================
// timescale
//==============================================
`timescale 1ns / 1ps

//==============================================
// jay__tb
//==============================================
module jay__tb;

//==============================
// dut
//==============================
jay dut
(
    .clk(clk),
    .rst(rst),
    .l1_to_mem__addr(l1_to_mem__addr),
    .l1_to_mem__wr_data(l1_to_mem__wr_data),
    .l1_to_mem__rd_data(l1_to_mem__rd_data),
    .l1_to_mem__en(l1_to_mem__en),
    .l1_to_mem__we(l1_to_mem__we)
);

//==============================
// mem__0
//==============================
mem #(.WIDTH(64), .DEPTH(4096), .DEPTH__LOG2(12)) mem__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .en(en),
    .we(we)
);

// dut I/O
logic clk;
logic rst;
logic [60:0] l1_to_mem__addr;
logic [63:0] l1_to_mem__wr_data;
logic [63:0] l1_to_mem__rd_data;
logic l1_to_mem__en;
logic l1_to_mem__we;

// Memory I/O
logic [11:0] addr;
logic [63:0] wr_data;
logic [63:0] rd_data;
logic en;
logic we;

assign addr = l1_to_mem__addr[11:0];
assign wr_data = l1_to_mem__wr_data;
assign l1_to_mem__rd_data = rd_data;
assign en = l1_to_mem__en;
assign we = l1_to_mem__we;


// 10 ns clock
always begin
    #5 clk = !clk;
end


 // file descriptor handle
int fd;


initial begin
    forever begin
        @(posedge clk) begin
            if (dut.central_processing_unit__0.op == 6'h34) begin
                fd = $fopen("C:/Users/seanj/Documents/bluejay/sim/basic/results/loop.vout");
                $fdisplay(fd, "%016h", dut.central_processing_unit__0.register_file__0.x__10);
                $fclose(fd);
                $finish;
            end
        end
    end
end



// test block
initial begin
    // initialize clk
    clk = 1'b1;
    rst = 1'b1;
    // initialize instruction memory
    $readmemh("C:/Users/seanj/Documents/bluejay/sim/basic/loop.txt", mem__0.memory);

    #11;
    // de-assert rst
    rst = 1'b0;
    
    #15000;
    $finish;
end

endmodule
