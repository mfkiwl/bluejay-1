//==============================================
// advance_high_performance_bus__slave
//==============================================
module advance_high_performance_bus__slave
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
    output logic [63:0] hrdata,
    output logic ahb_slave_to_device__valid,
    input ahb_slave_to_device__ready,
    output logic ahb_slave_to_device__we,
    output logic [39:0] ahb_slave_to_device__addr,
    output logic [2:0] ahb_slave_to_device__size,
    output logic [63:0] ahb_slave_to_device__wr_data,
    input ahb_slave_to_device__error,
    input ahb_slave_to_device__rd_data
);


logic en;
logic [2:0] hdtype;
logic [1:0] state;
logic [1:0] state__n;

assign ahb_slave_to_device__wr_data = hwdata;
assign hrdata = ahb_slave_to_device__rd_data;

alway_comb
begin
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

parameter STATE__IDLE = 2'h0;
parameter STATE__RESP = 2'h1;
parameter STATE__ERROR = 2'h2;

always_comb
begin
    case (state)
        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            hreadyout = 1'b1;
            hresp = 1'b0;
            state__n = en ? STATE__RESP : STATE__IDLE;
        end

        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            ahb_slave_to_device__valid = 1'b1;
            hreadyout = (ahb_slave_to_device__ready & ~ahb_slave_to_device__error); 
            hresp = (ahb_slave_to_device__ready & ahb_slave_to_device__error); 
            state__n = (ahb_slave_to_device__ready & ahb_slave_to_device__error) ? STATE__ERROR : en ? STATE__RESP : STATE__IDLE; 
        end

        //==============================
        // STATE__ERROR
        //==============================
        STATE__ERROR:
        begin
            hreadyout = 1'b1;
            hresp = 1'b1;
            state__n = en ? STATE__RESP : STATE__IDLE;
        end
    endcase
end


always_ff @(posedge hclk)
begin
    ahb_slave_to_device__we <= en ? hwrite : ahb_slave_to_device__we;
end

always_ff @(posedge hclk)
begin
    ahb_slave_to_device__addr <= en ? haddr : ahb_slave_to_device__addr;
end

always_ff @(posedge hclk)
begin
    ahb_slave_to_device__size <= en ? hsize : ahb_slave_to_device__size;
end

always_ff @(posedge hclk)
begin
    if (~hresetn)
    begin
        state <= STATE__IDLE;
    end
    else
    begin
        state <= state__n;
    end
end


endmodule
