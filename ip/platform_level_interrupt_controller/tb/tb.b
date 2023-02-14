//==============================================
// tb
//==============================================
module tb;

logic clk;
logic rst;

logic cs;
logic we;
logic [25:0] addr;
logic [31:0] wr_data;
logic [31:0] rd_data;
logic irq__0;
logic irq__1;
logic context__0__eip;


//==============================================
// dut 
//==============================================
platform_level_interrupt_controller dut 
(
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .irq__0(irq__0),
    .irq__1(irq__1),
    .context__0__eip(context__0__eip)
);


// clock
always
begin
    clk = 1'b0;
    forever #5 clk = !clk;
end


initial begin
    rst = 1'b1;
    cs = 1'b0;
    irq__0 = 1'b0;
    irq__1 = 1'b0;
    #10;
    rst = 1'b0;
    #10;
    // enable interrupt
    cs = 1'b1;
    we = 1'b1;
    addr = PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_ENABLE_BITS__0_TO_31__CONTEXT__0;
    wr_data = 32'h2;
    #10;
    cs = 1'b0;
    #10;
    irq__1 = 1'b1;
    #10;
    irq__1 = 1'b0;
    #10;
    #10;
    cs = 1'b1;
    we = 1'b0;
    addr = PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_CLAIM_COMPLETE__CONTEXT__0;
    #10;
    #10;
    #10;
    #10;
    cs = 1'b1;
    we = 1'b1;
    addr = PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_CLAIM_COMPLETE__CONTEXT__0;
    wr_data = 10'h1;
    #50;
    $finish();
end


endmodule

