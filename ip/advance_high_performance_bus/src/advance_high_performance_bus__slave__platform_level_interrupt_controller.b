//==============================================
// advance_high_performance_bus__slave__platform_level_interrupt_controller
//==============================================
module advance_high_performance_bus__slave__platform_level_interrupt_controller
(
    input hclk,
    input hresetn,
    input hsel,
    input [39:0] haddr,
    input hwrite,
    input [2:0] hsize,
    input [2:0] hburst,
    input [3:0] hprot,
    input [1:0] htrans,
    input hmastlock,
    input [63:0] hwdata,
    input hready,
    output logic hresp,
    output logic hreadyout,
    output logic [63:0] hrdata
);

logic ce;
logic we;
logic [25:0] addr;
logic [31:0] wr_data;
logic [31:0] rd_data;

logic [3:0] state;
logic [3:0] state__n;

//==============================================
// platform_level_interrupt_controller 
//==============================================
platform_level_interrupt_controller plic
(
    .clk(clk),
    .rst(rst),
    .ce(ce),
    .we(we),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .is__0(is__0),
    .is__1(is__0),
    .context__0__eip(context__0__eip)
);

assign hrdata = {32'h0, rd_data[31:0]};

always_comb 
begin
    hreadyout = 1'b0;
    ce = 1'b0;
    state__n = state;
        
    case (state)

        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__READY;
        end

        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            hreadyout = 1'b1;
            state__n = (hready & hsel & (htrans == NONSEQ)) ? STATE__READ_WRITE : STATE__READY;
        end

        //==============================
        // STATE__
        //==============================
        STATE__READ_WRITE:
        begin
            hreadyout = 1'b1;
            ce = 1'b1;
            state__n =  
            state__n = hready ? (hsel ? STATE__READ_WRITE : STATE__READY) : STATE__READ_WRITE;
        end

    endcase
end


always_ff @(posedge clk) begin
    we <= (hready & hsel) ? hwrite : we;
end

always_ff @(posedge clk) begin
    addr <= (hready & hsel) ? haddr[25:0] : addr;
end

always_ff @(posedge clk) begin
    state <= ~hresetn ? STATE__RESET : state__n;
end


endmodule
