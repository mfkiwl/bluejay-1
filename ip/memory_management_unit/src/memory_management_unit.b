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

logic request__we;
logic [39:0] request__addr;
logic [2:0] request__dtype;
logic [63:0] request__data;

logic [7:0] pmar;
logic [1:0] status;
logic [3:0] state;
logic [3:0] state__n;

//==============================
// physical_memory_attribute_checker 
//==============================
physical_memory_attribute_checker pmac
(
    .clk(clk),
    .rst(rst),
    .addr(request__addr[2:0]), 
    .dtype(request__dtype),
    .pmar(pmar),
    .status(status)
);


always_comb
begin
    case ()
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

always_ff @(posedge clk)
begin
    if (cpu_to_mem__valid)
    begin
        request__we <= cpu_to_mem__we;
        request__addr <= cpu_to_mem__addr;
        request__dtype <= cpu_to_mem__dtype;
        request__data <= cpu_to_mem__data;
    end
end

always_ff @(posedge clk)
begin
    if (ahb_master_to_device__valid)
    begin
        response__data <= ahb_master_to_device__data;
        response__error <= ahb_master_to_device__error;
    end
end



assign device_to_ahb_master__we = request__we;
assign device_to_ahb_master__addr = request__addr;
assign device_to_ahb_master__data = request__data;

always_comb begin
    case (request__dtype)
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

parameter STATE__RESET =  
parameter STATE__IDLE =
parameter STATE__PMA_CHECK =

always_comb
begin
    device_to_ahb_master__valid = 1'b0;
    mem_to_cpu__valid = 1'b0;
    mem_to_cpu__error = response__error; // FIXME: Figure out how to handle the case when the AHB response with an error
    mem_to_cpu__data = response__data;

        
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
            state__n = ahb_master_to_device__valid ? STATE__RESP : STATE__WAIT; 
        end
            
        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__error = response__error;
            mem_to_cpu__data = response__data;
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

