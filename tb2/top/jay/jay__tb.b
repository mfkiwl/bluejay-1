//==============================================
// timescale
//==============================================
//`timescale 1ns / 1ps

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
mem #(.WIDTH(64), .DEPTH(8192), .DEPTH__LOG2(13)) mem__0
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
logic [12:0] addr;
logic [63:0] wr_data;
logic [63:0] rd_data;
logic en;
logic we;

assign addr = l1_to_mem__addr[12:0];
assign wr_data = l1_to_mem__wr_data;
assign l1_to_mem__rd_data = rd_data;
assign en = l1_to_mem__en;
assign we = l1_to_mem__we;


// 10 ns clock
always begin
    #5 clk = !clk;
end


 // file descriptor handle
integer fd;
logic [63:0] addr_long;
logic [12:0] addr_short;


initial begin
    forever begin
        @(posedge clk) begin
            if ((dut.central_processing_unit__0.op == OP__JALR) && (dut.central_processing_unit__0.rs1 == 5'h1) && (dut.central_processing_unit__0.register_file__0.x__1 = 64'hffffffffffffffff)) begin
                fd = $fopen("/home/seankent/bluejay/sim/t.vout");
                for (addr_long = 64'h11060; addr_long < (64'h11060 + 48); addr_long += 16) begin
                    addr_short = addr_long[15:3];
                    $fwrite(fd, "%016h", mem__0.memory[addr_short]);
                    $fwrite(fd, "%016h\n", mem__0.memory[addr_short + 1]);
                end
                //$fdisplay(fd, "%016h", dut.central_processing_unit__0.register_file__0.x__10);
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
    // initialize the ra register
    dut.central_processing_unit__0.register_file__0.x__1 = 64'hffffffffffffffff;
    // initialize the sp register
    dut.central_processing_unit__0.register_file__0.x__2 = 64'h20000;
    // initialize the gp register
    dut.central_processing_unit__0.register_file__0.x__3 = 64'h11860;
    // initialize instruction memory
    $readmemh("/home/seankent/bluejay/sim/t.txt", mem__0.memory);

    #11;
    // de-assert rst
    rst = 1'b0;
    
    #2000000;
    $finish;
end


//fd = $fopen("C:/Users/seanj/Documents/bluejay/sim/basic/results/shlti.vout");
//$readmemh("C:/Users/seanj/Documents/bluejay/sim/basic/slti.txt", mem__0.memory);

endmodule
