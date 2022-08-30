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
logic [63:0] cpu_to_l1__data;
logic l1_to_cpu__valid;
logic l1_to_cpu__ready;
logic [63:0] l1_to_cpu__data;


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
    .cpu_to_l1__data(cpu_to_l1__data),
    .l1_to_cpu__valid(l1_to_cpu__valid),
    .l1_to_cpu__ready(l1_to_cpu__ready),
    .l1_to_cpu__data(l1_to_cpu__data)
);

//==============================
// l1 
//==============================
l1 #(.DEPTH(16384), .DEPTH__LOG2(14)) l1_cache 
(
    .clk(clk),
    .rst(rst),
    .cpu_to_l1__valid(cpu_to_l1__valid),
    .cpu_to_l1__ready(cpu_to_l1__ready),
    .cpu_to_l1__we(cpu_to_l1__we),
    .cpu_to_l1__addr(cpu_to_l1__addr),
    .cpu_to_l1__dtype(cpu_to_l1__dtype),
    .cpu_to_l1__data(cpu_to_l1__data),
    .l1_to_cpu__valid(l1_to_cpu__valid),
    .l1_to_cpu__ready(l1_to_cpu__ready),
    .l1_to_cpu__data(l1_to_cpu__data)
);


//==============================================
// Clock (10ns)
//==============================================
always begin
    #5 clk = !clk;
end


string filename;
initial begin
    if ($value$plusargs("filename=%s", filename)) begin
        $readmemh(filename, l1.memory);
    end
end

initial begin
    // initialize clk
    clk = 1'b1;
    rst = 1'b1;
    // initialize the ra register
    dut.register_file__0.x__1 = 64'hffffffffffffffff;
    // initialize the sp register (Set to top of mem) EDIT
    dut.register_file__0.x__2 = 64'h4000;
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
            if ((dut.op == 6'h32) && (dut.rs1 == 5'h1) && (dut.register_file__0.x__1 = 64'hffffffffffffffff)) begin
                //fd = $fopen("/home/seankent/bluejay/sim/t.vout");
                //for (addr_long = 64'h11060; addr_long < (64'h11060 + 48); addr_long += 16) begin
                //    addr_short = addr_long[15:3];
                //    $fwrite(fd, "%016h", mem__0.memory[addr_short]);
                //    $fwrite(fd, "%016h\n", mem__0.memory[addr_short + 1]);
                //end
                ////$fdisplay(fd, "%016h", dut.central_processing_unit__0.register_file__0.x__10);
                //$fclose(fd);
                $finish();
            end
        end
    end
end



   
initial begin
    #2000000;
    $finish();
end


endmodule
