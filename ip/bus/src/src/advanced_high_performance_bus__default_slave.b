//==============================================
// advanced_high_performance_bus__default_slave
//==============================================
module advanced_high_performance_bus__default_slave
(
    hclk,
    hresetn,
    hsel,
    haddr,
    hwrite,
    hsize,
    hburst,
    hprot,
    htrans,
    hmastlock,
    hwdata,
    hready,
    hresp,
    hreadyout,
    hrdata
);

// advanced high performace bus (AHB) signals
input hclk;
input hresetn;
input hsel;
input [39:0] haddr;
input hwrite;
input [2:0] hsize;
input [2:0] hburst;
input [3:0] hprot;
input [1:0] htrans;
input hmastlock;
input [63:0] hwdata;
input hready;
output logic hresp;
output logic hreadyout;
output logic [63:0] hrdata;

// advanced high performace bus (AHB) signals
logic hclk;
logic hresetn;
logic hsel;
logic [39:0] haddr;
logic hwrite;
logic [2:0] hsize;
logic [2:0] hburst;
logic [3:0] hprot;
logic [1:0] htrans;
logic hmastlock;
logic [63:0] hwdata;
logic hready;
logic hresp;
logic hreadyout;
logic [63:0] hrdata;

logic en;

logic [1:0] state;
logic [1:0] state__n;

parameter STATE__READY = 2'h0;
parameter STATE__ERROR_CYCLE_1 = 2'h1;
parameter STATE__ERROR_CYCLE_2 = 2'h2;

always_comb
begin
    case (state)
        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            hreadyout = 1'b1;
            hresp = 1'b0;
            state__n = en ? STATE__ERROR_CYCLE_1 : STATE__READY;
        end

        //==============================
        // STATE__ERROR_CYCLE_1
        //==============================
        STATE__ERROR_CYCLE_1:
        begin
            hreadyout = 1'b0; 
            hresp = 1'b1; 
            state__n = STATE__ERROR_CYCLE_2; 
        end

        //==============================
        // STATE__ERROR_CYCLE_2
        //==============================
        STATE__ERROR_CYCLE_2:
        begin
            hreadyout = 1'b1;
            hresp = 1'b1;
            state__n = en ? STATE__ERROR_CYCLE_1 : STATE__READY;
        end
    endcase
end


alway_comb
begin
    en = 1'b0;

    case (htrans)
        ADVANCED_HIGH_PERFORMANCE_BUS__HTRANS__IDLE:
        begin
            en = 1'b0;
        end
        ADVANCED_HIGH_PERFORMANCE_BUS__HTRANS__BUSY:
        begin
            en = 1'b0;
        end
        ADVANCED_HIGH_PERFORMANCE_BUS__HTRANS__NONSEQ:
        begin
            en = hready & hsel;
        end
        ADVANCED_HIGH_PERFORMANCE_BUS__HTRANS__SEQ:
        begin
            en = hready & hsel;
        end
    endcase
end

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(2), .RESET_VALUE(STATE__READY)) d_flip_flop__state
(
    .clk(clk),
    .rst(~hresetn),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

endmodule


