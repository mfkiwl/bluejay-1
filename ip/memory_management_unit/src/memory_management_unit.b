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
    output logic device_to_ahb_master__valid,
    output logic device_to_ahb_master__we,
    output logic [39:0] device_to_ahb_master__addr,
    output logic [2:0] device_to_ahb_master__size,
    output logic [63:0] device_to_ahb_master__data,
    input ahb_master_to_device__valid,
    input ahb_master_to_device__error,
    input [63:0] ahb_master_to_device__data,
    input pmar__0,
    input pmar__1,
    input pmar__2,
    input pmar__3,
    input pmar__4,
    input pmar__5,
    input pmar__6,
    input pmar__7
);

logic we;
logic [39:0] addr;
logic [2:0] dtype;
logic [63:0] wr_data;
logic [63:0] rd_data;
logic [63:0] rd_data__n;

logic [7:0] pmar;
logic [1:0] status;

logic [3:0] state;
logic [3:0] state__n;

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

// Advanced High-Performance Bus Master Interface
assign device_to_ahb_master__we = we;
assign device_to_ahb_master__addr = addr;
assign device_to_ahb_master__data = wr_data;

always_comb begin
    case (dtype)
        DTYPE__DOUBLE_WORD:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__DOUBLE_WORD; 
        end
        DTYPE__WORD:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__WORD; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__WORD; 
        end
        DTYPE__HALF_WORD:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__HALF_WORD; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__HALF_WORD; 
        end
        DTYPE__BYTE:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__BYTE; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            device_to_ahb_master__size = ADVANCED_HIGH_PERFORMANCE_BUS__HSIZE__BYTE; 
        end
    endcase
end

always_comb begin
    case (dtype)
        DTYPE__DOUBLE_WORD:
        begin
            rd_data__n = device_to_ahb_master__data; 
        end
        DTYPE__WORD:
        begin
            rd_data__n = {{32{device_to_ahb_master__data[31]}}, device_to_ahb_master__data[31:0]}; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            rd_data__n = {32'h0, device_to_ahb_master__data[31:0]}; 
        end
        DTYPE__HALF_WORD:
        begin
            rd_data__n = {{48{device_to_ahb_master__data[15]}}, device_to_ahb_master__data[15:0]}; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            rd_data__n = {48'h0, device_to_ahb_master__data[15:0]}; 
        end
        DTYPE__BYTE:
        begin
            rd_data__n = {{56{device_to_ahb_master__data[7]}}, device_to_ahb_master__data[7:0]}; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            rd_data__n = {56'h0, device_to_ahb_master__data[7:0]}; 
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
    mem_to_cpu__error = 1'b0; 
    mem_to_cpu__data = rd_data;
        
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
            state__n = (status = PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT) ? STATE__ACCESS_FAULT : (status = PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS) ? STATE__MISALIGNED_ADDRESS : STATE__REQ;
        end

        //==============================
        // STATE__REQ
        //==============================
        STATE__REQ
        begin
            device_to_ahb_master__valid = 1'b1;
            state__n = STATE__WAIT; 
        end

        //==============================
        // STATE__WAIT
        //==============================
        STATE__WAIT:
        begin
            state__n = (ahb_master_to_device__valid & ahb_master_to_device__error) ? STATE__ACCESS_FAULT : (ahb_master_to_device__valid & ~ahb_master_to_device__error) ? STATE__RESP : STATE__WAIT; 
        end
            
        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__error = 1'b0;
            mem_to_cpu__data = rd_data;
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
    if (ahb_master_to_device__valid)
    begin
        rd_data <= rd_data__n;
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

