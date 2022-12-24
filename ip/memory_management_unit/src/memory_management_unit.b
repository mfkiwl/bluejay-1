//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    input clk,
    input rst,
    input cpu_to_mem__valid,
    input cpu_to_mem__we,
    input [63:0] cpu_to_mem__addr,
    input [2:0] cpu_to_mem__dtype,
    input [63:0] cpu_to_mem__data,
    output logic mem_to_cpu__valid,
    output logic mem_to_cpu__error,
    output logic [63:0] mem_to_cpu__data,
    output [39:0] haddr,
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
    input pmar__0,
    input pmar__1,
    input pmar__2,
    input pmar__3,
    input pmar__4,
    input pmar__5,
    input pmar__6,
    input pmar__7
);


//==============================
// physical_memory_attribute_checker 
//==============================
physical_memory_attribute_checker pma_checker
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]), 
    .dtype(dtype),
    .pmar(pmar),
    .status(status)
);

always_comb
begin
    case (addr)
        MEMORY_MAP__0:
        begin
            pmar = pmar__0;
        end
        MEMORY_MAP__1:
        begin
            pmar = pmar__1;
        end
        MEMORY_MAP__2:
        begin
            pmar = pmar__2;
        end
        MEMORY_MAP__3:
        begin
            pmar = pmar__3;
        end
        MEMORY_MAP__4:
        begin
            pmar = pmar__4;
        end
        MEMORY_MAP__5:
        begin
            pmar = pmar__5;
        end
        MEMORY_MAP__6:
        begin
            pmar = pmar__6;
        end
        MEMORY_MAP__7:
        begin
            pmar = pmar__7;
        end
    endcase
end

logic we;
logic [39:0] addr;
logic [2:0] dtype;
logic [63:0] wr_data;
logic [63:0] rd_data;


logic request__we;
logic [39:0] request__addr;
logic [2:0] request__dtype;
logic [63:0] request__data;

logic [63:0] response__error;
logic [63:0] response__data;
logic [63:0] response__data__extended;


logic [7:0] pmar;
logic [1:0] status;
logic [3:0] state;
logic [3:0] state__n;




assign device_to_ahb_master__we = request__we;
assign device_to_ahb_master__addr = request__addr;
assign device_to_ahb_master__data = request__data;

always_comb begin
    case (dtype)
        DTYPE__DOUBLE_WORD:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__DOUBLE_WORD; 
        end
        DTYPE__WORD:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__WORD; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__WORD; 
        end
        DTYPE__HALF_WORD:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__HALF_WORD; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__HALF_WORD; 
        end
        DTYPE__BYTE:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__BYTE; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__BYTE; 
        end
    endcase
end






always_comb begin
    case (request__dtype)
        DTYPE__DOUBLE_WORD:
        begin
            response__data__extended = response__data; 
        end
        DTYPE__WORD:
        begin
            response__data__extended = {{32{response__data[31]}}, response__data[31:0]}; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            response__data__extended = {32'h0, response__data[31:0]}; 
        end
        DTYPE__HALF_WORD:
        begin
            response__data__extended = {{48{response__data[15]}}, response__data[15:0]}; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            response__data__extended = {48'h0, response__data[15:0]}; 
        end
        DTYPE__BYTE:
        begin
            response__data__extended = {{56{response__data[7]}}, response__data[7:0]}; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            response__data__extended = {56'h0, response__data[7:0]}; 
        end
    endcase
end

parameter STATE__RESET = 4'h0;
parameter STATE__IDLE = 4'h1;
parameter STATE__PMA_CHECK = 4'h2;
parameter STATE__REQ = 4'h3;
parameter STATE__WAIT = 4'h4; 
parameter STATE__RESP = 4'h5;
parameter STATE__ACCESS_FAULT = 4'h6; 
parameter STATE__MISALIGNED_ADDRESS = 4'h7; 

always_comb
begin
    device_to_ahb_master__valid = 1'b0;
    mem_to_cpu__valid = 1'b0;
    mem_to_cpu__error = response__error; // FIXME: Figure out how to handle the case when the AHB response with an error
    mem_to_cpu__data = response__data__extended;


    htrans = ADVANCED_HIGH_PERFORMANCE_BUS__HTRANS__IDLE; 

        
    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            state__n = STATE__IDLE;
        end

        //==============================
        // STATE__IDLE
        //==============================
        STATE__IDLE:
        begin
            state__n = cpu_to_mem__valid ? STATE__PMA_CHECK : STATE__IDLE;
        end

        //==============================
        // STATE__PMA_CHECK
        //==============================
        STATE__PMA_CHECK:
        begin
            state__n = (status = PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT) ? STATE__ACCESS_FAULT : (status = PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS) ? STATE__MISALIGNED_ADDRESS : STATE__ADDRESS_PHASE;
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

        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__error = 1'b1;
            mem_to_cpu__data = ERRORCODE__ACCESS_FAULT;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__error = 1'b1;
            mem_to_cpu__data = ERRORCODE__MISALIGNED_ADDRESS;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end
    endcase
end


assign haddr = addr;
assign hwrite = we; 
assign hwdata = wr_data;
assign hburst = ADVANCED_HIGH_PERFORMANCE_BUS__HBURST__SINGLE; 
assign hprot = 4'b0011; 
assign hmastlock = 1'b0;

always_comb
begin
    case (dtype)
        DTYPE__DOUBLE_WORD:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__DOUBLE_WORD; 
        end
        DTYPE__WORD:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__WORD; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__WORD; 
        end
        DTYPE__HALF_WORD:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__HALF_WORD; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__HALF_WORD; 
        end
        DTYPE__BYTE:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__BYTE; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            hsize = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__BYTE; 
        end
    endcase
end

always_ff @(posedge clk)
begin
    if (cpu_to_mem__valid)
    begin
        we <= cpu_to_mem__we;
        addr <= cpu_to_mem__addr[39:0];
        dtype <= cpu_to_mem__dtype;
        wr_data <= cpu_to_mem__data;
    end
end

always_ff @(posedge clk)
begin
    if ()
    begin
        rd_data <= hrdata;
    end
end

always_ff @(posedge clk) 
begin
    if (rst)
    begin
        state <= STATE__RESET;
    end
    else 
    begin
        state <= state__n;
    end
end


endmodule

