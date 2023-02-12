//==============================================
// timescale
//==============================================
//`timescale 1ns / 1ps

//==============================================
// tb 
//==============================================
module tb;

//==============================================
// Logic 
//==============================================
logic clk;
logic rst;
logic cpu_to_mem__valid;
logic cpu_to_mem__we;
logic [63:0] cpu_to_mem__addr;
logic [2:0] cpu_to_mem__dtype;
logic [63:0] cpu_to_mem__data;
logic mem_to_cpu__valid;
logic mem_to_cpu__error;
logic [63:0] mem_to_cpu__data;
logic eip;
logic tip;


central_processing_unit dut
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mem__valid(cpu_to_mem__valid),
    .cpu_to_mem__we(cpu_to_mem__we),
    .cpu_to_mem__addr(cpu_to_mem__addr),
    .cpu_to_mem__dtype(cpu_to_mem__dtype),
    .cpu_to_mem__data(cpu_to_mem__data),
    .mem_to_cpu__valid(mem_to_cpu__valid),
    .mem_to_cpu__error(mem_to_cpu__error),
    .mem_to_cpu__data(mem_to_cpu__data),
    .eip(eip),
    .tip(tip)
);

//==============================
// mem 
//==============================
tb_mem #(.DEPTH(64'h10000), .DEPTH__LOG2(16)) mem 
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mem__valid(cpu_to_mem__valid),
    .cpu_to_mem__we(cpu_to_mem__we),
    .cpu_to_mem__addr(cpu_to_mem__addr),
    .cpu_to_mem__dtype(cpu_to_mem__dtype),
    .cpu_to_mem__data(cpu_to_mem__data),
    .mem_to_cpu__valid(mem_to_cpu__valid),
    .mem_to_cpu__error(mem_to_cpu__error),
    .mem_to_cpu__data(mem_to_cpu__data)
);


//==============================================
// Clock (10ns)
//==============================================
always begin
    #5 clk = !clk;
end


string filename__mem;
string filename__sig;
string filename__begin_signature;
string filename__end_signature;
string filename__tohost;
logic [63:0] begin_signature;
logic [63:0] end_signature;
logic [63:0] tohost;
logic [63:0] addr;
logic [15:0] addr_short;

// file descriptor handle
integer fd;

initial begin
    if ($value$plusargs("filename__mem=%s", filename__mem)) begin
        $readmemh(filename__mem, mem.memory);
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
    $value$plusargs("tohost=%h", tohost);
    $display("tohost = %0h", tohost);
    forever begin
        @(posedge clk) begin
            //if ((dut.op == OP__JALR) && (dut.rs1 == 5'h1) && (dut.register_file__0.x__1 = 64'hffffffffffffffff)) begin
            if (cpu_to_mem__valid && (cpu_to_mem__addr == tohost)) begin
                $value$plusargs("filename__sig=%s", filename__sig);
                $display("filename__sig = %s", filename__sig);
                $value$plusargs("begin_signature=%h", begin_signature);
                $display("begin_signature = %0h", begin_signature);
                $value$plusargs("end_signature=%h", end_signature);
                $display("end_signature = %0h", end_signature);
                fd = $fopen(filename__sig);
                for (addr = begin_signature; addr < end_signature; addr += 4) begin
                    addr_short = addr[15:0];
                    $fwrite(fd, "%02h", mem.memory[addr_short + 3]);
                    $fwrite(fd, "%02h", mem.memory[addr_short + 2]);
                    $fwrite(fd, "%02h", mem.memory[addr_short + 1]);
                    $fwrite(fd, "%02h\n", mem.memory[addr_short]);
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
