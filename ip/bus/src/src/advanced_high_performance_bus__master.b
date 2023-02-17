//==============================================
// advance_high_performance_bus__master
//==============================================
module advance_high_performance_bus__master
(
    hclk,
    hresetn,
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
    hrdata,
    device_to_master__valid,
    device_to_master__we,
    device_to_master__addr,
    device_to_master__size,
    device_to_master__data,
    master_to_device__valid,
    master_to_device__error,
    master_to_device__data
);

input hclk;
input hresetn;
output [39:0] haddr;
output hwrite;
output [2:0] hsize;
output [2:0] hburst;
output [3:0] hprot;
output [1:0] htrans;
output hmastlock;
output [63:0] hwdata;
input hready;
input hresp;
input [63:0] hrdata;

input device_to_master__valid;
input device_to_master__we;
input [39:0] device_to_master__addr;
input [2:0] device_to_master__size;
input [63:0] device_to_master__data;

output master_to_device__valid;
output master_to_device__error;
output [63:0] master_to_device__data;

logic hclk;
logic hresetn;
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
logic [63:0] hrdata;

logic device_to_master__valid;
logic device_to_master__we;
logic [39:0] device_to_master__addr;
logic [2:0] device_to_master__size;
logic [63:0] device_to_master__data;

logic master_to_device__valid;
logic master_to_device__error;
logic [63:0] master_to_device__data;

logic [1:0] state;
logic [1:0] state__n;

localparam STATE__READY = 2'h0;
localparam STATE__ADDRESS_PHASE = 2'h1;
localparam STATE__DATA_PHASE = 2'h2;

always_comb 
begin
    htrans = ADVANCED_HIGH_PERFORMANCE_BUS__HTRANS__IDLE; 
    hburst = ADVANCED_HIGH_PERFORMANCE_BUS__HBURST__SINGLE; 
    hprot = ADVANCED_HIGH_PERFORMANCE_BUS__HPROT__NON_CACHEABLE__NON_BUFFERABLE__PRIVILEGED_ACCESS__DATA_ACCESS; 
    hmastlock = ADVANCED_HIGH_PERFORMANCE_BUS__HMASTLOCK__UNLOCKED;
    master_to_device__valid = 1'b0;
    master_to_device__error = hresp;
    master_to_device__data = hrdata;

    case (state)

        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            state__n = device_to_ahb_master__valid ? STATE__ADDRESS_PHASE : STATE__READY;
        end

        //==============================
        // STATE__ADDRESS_PHASE
        //==============================
        STATE__ADDRESS_PHASE:
        begin
            htrans = ADVANCED_HIGH_PERFORMANCE_BUS__HTRANS__NONSEQ; 
            state__n = STATE__DATA_PHASE;
        end

        //==============================
        // STATE__DATA_PHASE
        //==============================
        STATE__DATA_PHASE:
        begin
            master_to_device__valid = hready;
            state__n = hready ? STATE__READY : STATE__DATA_PHASE;
        end
    endcase
end

//==============================
// d_flip_flop__haddr
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__haddr
(
    .clk(clk),
    .rst(~hresetn),
    .en(device_to_master__valid),
    .d(device_to_master__addr),
    .q(haddr)
);

//==============================
// d_flip_flop__hwrite
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__hwrite
(
    .clk(clk),
    .rst(~hresetn),
    .en(device_to_master__valid),
    .d(device_to_master__we),
    .q(hwrite)
);

//==============================
// d_flip_flop__hsize
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__hsize
(
    .clk(clk),
    .rst(~hresetn),
    .en(device_to_master__valid),
    .d(device_to_master__size),
    .q(hsize)
);

//==============================
// d_flip_flop__hwdata
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__hwdata
(
    .clk(clk),
    .rst(~hresetn),
    .en(device_to_master__valid),
    .d(device_to_master__data),
    .q(hwdata)
);

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
