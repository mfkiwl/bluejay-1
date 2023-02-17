//==============================================
// bus__slave
//==============================================
module bus__slave
(
    hclk,
    hrst,
    hsel,
    haddr,
    hwe,
    hdtype,
    hburst,
    hprot,
    htrans,
    hmastlock,
    hwdata,
    hready,
    hresp,
    hreadyout,
    hrdata,
    cs,
    we,
    addr,
    size,
    wr_data,
    rd_data
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

// device interface signals
output cs;
output we;
output [39:0] addr;
output [2:0] size;
output [63:0] wr_data;
input [63:0] rd_data

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

// device interface signals
logic cs;
logic we;
logic [39:0] addr;
logic [2:0] size;
logic [63:0] wr_data;
logic [63:0] rd_data;

logic en;

logic state;
logic state__n;

localparam STATE__READY = 1'b0;
localparam STATE__RESP = 1'b0;

always_comb
begin
    case (state)
        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            cs = 1'b0;
            state__n = en ? STATE__RESP : STATE__READY;
        end

        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            cs = 1'b1;
            state__n = en ? STATE__RESP : STATE__READY; 
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

assign wr_data = hwdata;
assign hreadyout = 1'b1;
assign hresp = 1'b0;
assign hrdata = rd_data;

//==============================
// d_flip_flop__we
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__we
(
    .clk(clk),
    .rst(1'b0),
    .en(en),
    .d(hwrite),
    .q(we)
);

//==============================
// d_flip_flop__addr
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__addr
(
    .clk(clk),
    .rst(1'b0),
    .en(en),
    .d(haddr),
    .q(addr)
);

//==============================
// d_flip_flop__size
//==============================
d_flip_flop #(.WIDTH(3)) d_flip_flop__size
(
    .clk(clk),
    .rst(1'b0),
    .en(en),
    .d(hsize),
    .q(size)
);

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(STATE__READY)) d_flip_flop__state
(
    .clk(clk),
    .rst(~hresetn),
    .en(1'b1),
    .d(state__n),
    .q(state)
);

endmodule

