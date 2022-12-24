//==============================================
// advance_high_performance_bus__master
//==============================================
module advance_high_performance_bus__master
(
    input hclk,
    input hresetn,
    output logic [39:0] haddr,
    output logic hwrite,
    output logic [2:0] hsize,
    output logic [2:0] hburst,
    output logic [3:0] hprot,
    output logic [1:0] htrans,
    output logic hmastlock,
    output logic [63:0] hwdata,
    input hready,
    input hresp,
    input [63:0] hrdata,
    input device_to_ahb_master__valid,
    input device_to_ahb_master__we,
    input [39:0] device_to_ahb_master__addr,
    input [2:0] device_to_ahb_master__size,
    input [63:0] device_to_ahb_master__data,
    output logic ahb_master_to_device__valid,
    output logic ahb_master_to_device__error,
    output logic [63:0] ahb_master_to_device__data
);

logic en__a;
logic en__b;
logic [3:0] state;
logic [3:0] state__n;


always_comb 
begin
    ahb_master_to_device__valid = 1'b0;
    htrans = ADVANCED_HIGH_PERFORMANCE_BUS__HTRANS__IDLE; 
    en__a = 1'b0;
    en__b = 1'b0;

    case (state)

        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            en__a = device_to_ahb_master__valid;
            state__n = device_to_ahb_master__valid ? STATE__ADDRESS_PHASE : STATE__IDLE;
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
            en__b = hready;
            state__n = hready ? STATE__RETURN : STATE__DATA_PHASE;
        end

        //==============================
        // STATE__RETURN
        //==============================
        STATE__RETURN:
        begin
            ahb_master_to_device__valid = 1'b1;
            state__n = STATE__IDLE;
        end

    endcase
end


assign hburst = ADVANCED_HIGH_PERFORMANCE_BUS__HBURST__SINGLE; 
assign hprot = 4'b0011; 
assign hmastlock = 1'b0;


always_ff @(posedge clk) begin
    if (en__a)
    begin
        haddr <= device_to_ahb_master__addr;
        hwrite <= device_to_ahb_master__we;
        hsize <= device_to_ahb_master__size;
        hwdata <= device_to_ahb_master__data;
    end
    else
end

always_ff @(posedge clk) begin
    if (en__b)
    begin
        ahb_master_to_device__error <= hresp;
        ahb_master_to_device__data <= hrdata;
    end
    else
end


always_ff @(posedge clk) begin
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
