//==============================================
// timescale
//==============================================
//`timescale 1ns / 1ps

//==============================================
// central_processing_unit__tb 
//==============================================
module central_processing_unit__tb();

//==============================================
// Logic 
//==============================================
logic clk;
logic rst;
logic cpu_to_l1__valid;
logic cpu_to_l1__ready;
logic cpu_to_l1__we;
logic [63:0] cpu_to_l1__addr;
logic [2:0] cpu_to_l1__dtype;
logic [63:0] cpu_to_l1__wr_data;
logic [63:0] cpu_to_l1__rd_data;
logic cpu_to_l1__rd_valid_next;


//==============================
// dut
//==============================
central_processing_unit dut
(
    .clk(clk),
    .rst(rst),
    .cpu_to_l1__valid(cpu_to_l1__valid),
    .cpu_to_l1__ready(cpu_to_l1__ready),
    .cpu_to_l1__we(cpu_to_l1__we),
    .cpu_to_l1__addr(cpu_to_l1__addr),
    .cpu_to_l1__dtype(cpu_to_l1__dtype),
    .cpu_to_l1__wr_data(cpu_to_l1__wr_data),
    .cpu_to_l1__rd_data(cpu_to_l1__rd_data),
    .cpu_to_l1__rd_valid_next(cpu_to_l1__rd_valid_next)
);

//==============================
// l1 
//==============================
l1 #(.DEPTH(64'h10000), .DEPTH__LOG2(16)) l1_cache 
(
    .clk(clk),
    .rst(rst),
    .cpu_to_l1__valid(cpu_to_l1__valid),
    .cpu_to_l1__ready(cpu_to_l1__ready),
    .cpu_to_l1__we(cpu_to_l1__we),
    .cpu_to_l1__addr(cpu_to_l1__addr),
    .cpu_to_l1__dtype(cpu_to_l1__dtype),
    .cpu_to_l1__wr_data(cpu_to_l1__wr_data),
    .cpu_to_l1__rd_data(cpu_to_l1__rd_data),
    .cpu_to_l1__rd_valid_next(cpu_to_l1__rd_valid_next)
);


//==============================================
// Clock (10ns)
//==============================================
always begin
    #5 clk = !clk;
end


string filename__mem;
string filename__sig;
logic [63:0] begin_signature;
logic [63:0] end_signature;
logic [63:0] addr;
logic [15:0] addr_short;

// file descriptor handle
integer fd;

initial begin
    if ($value$plusargs("filename__mem=%s", filename__mem)) begin
        $readmemh(filename__mem, l1.memory);
    end
    //if ($value$plusargs("filename__sig=%s", filename__sig)) begin
    //    $display("filename__sig = %s", filename__sig);
    //end
    //if ($value$plusargs("begin_signature=%0h", begin_signature)) begin
    //    $display("begin_signature = %0h", begin_signature);
    //end
    //if ($value$plusargs("end_signature=%0h", end_signature)) begin
    //    $display("end_signature = %0h", end_signature);
    //end
end

initial begin
    // initialize clk
    clk = 1'b1;
    rst = 1'b1;
    // initialize the ra register
    dut.register_file__0.x__1 = 64'hffffffffffffffff;
    // initialize the sp register (Set to top of mem) EDIT
    dut.register_file__0.x__2 = 64'h10000;
    // initialize the gp register
    dut.register_file__0.x__3 = 64'h11860;
    // initialize instruction memory
    #11;
    // de-assert rst
    rst = 1'b0;
end


initial begin
    forever begin
        @(posedge clk) begin
            //if ((dut.op == 6'h32) && (dut.rs1 == 5'h1) && (dut.register_file__0.x__1 = 64'hffffffffffffffff)) begin
            if (dut.op == 6'h34) begin
                $value$plusargs("filename__sig=%s", filename__sig);
                $display("filename__sig = %s", filename__sig);
                $value$plusargs("begin_signature=%h", begin_signature);
                $display("begin_signature = %0h", begin_signature);
                $value$plusargs("end_signature=%h", end_signature);
                $display("end_signature = %0h", end_signature);
                fd = $fopen(filename__sig);
                for (addr = begin_signature; addr < end_signature; addr += 4) begin
                    addr_short = addr[15:0];
                    $fwrite(fd, "%02h", l1_cache.memory[addr_short + 3]);
                    $fwrite(fd, "%02h", l1_cache.memory[addr_short + 2]);
                    $fwrite(fd, "%02h", l1_cache.memory[addr_short + 1]);
                    $fwrite(fd, "%02h\n", l1_cache.memory[addr_short]);
                end
                ////$fdisplay(fd, "%016h", dut.central_processing_unit__0.register_file__0.x__10);
                $fclose(fd);
                $finish();
            end
        end
    end
end



   
initial begin
    #2000000;
    $value$plusargs("filename__sig=%s", filename__sig);
    $display("filename__sig = %s", filename__sig);
    fd = $fopen(filename__sig);
    $fwrite(fd, "00000000");
    $fclose(fd);
    $finish();
end


endmodule
