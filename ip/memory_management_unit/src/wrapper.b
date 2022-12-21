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
    output logic mmu__we,
    output logic [39:0] mmu__addr,
    output logic [2:0] mmu__dtype,
    output logic [63:0] mmu__wr_data,
    output logic mmu__ce__0,
    input [63:0] mmu__rd_data__0,
    output logic mmu__ce__1,
    input [63:0] mmu__rd_data__1,
);

logic [63:0] rd_data;

logic [3:0] state;
logic [3:0] state__n;


//==============================
// physical_memory_attribute_checker
//==============================
physical_memory_attribute_checker physical_memory_attribute_checker__0
(
    .clk(clk),
    .rst(rst),
    .pma(rd_data[7:0])
    .addr(addr[2:0]), 
    .dtype(dtype),
    .status(status)
)



always_comb 
begin
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
            state__n = cpu_to_mem__valid ? STATE__DECODE : STATE__READY;
        end

        //==============================
        // STATE__DECODE
        //==============================
        STATE__DECODE:
        begin
            casez (addr)
                MEMORY_MAP_REGION__0:
                begin
                    mmu__addr = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__0;
                    rd_data = mmu__rd_data__3; 
                    state__n = (status == PMA_CHECK_STATUS__ACCESS_FAULT) ? STATE__ACCESS_FAULT : (status == PMA_CHECK_STATUS__MISALIGNED_ADDRESS) ? STATE__MISALIGNED_ADDRESS : STATE__MAIN_MEMORY__0;
                end
                MEMORY_MAP_REGION__1:
                begin
                    mmu__addr = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__1;
                    rd_data = mmu__rd_data__3; 
                    state__n = (status == PMA_CHECK_STATUS__ACCESS_FAULT) ? STATE__ACCESS_FAULT : (status == PMA_CHECK_STATUS__MISALIGNED_ADDRESS) ? STATE__MISALIGNED_ADDRESS : STATE__MEMORY_MAP_REGION__1__ACCESS__0;
                end
                default:
                begin
                    state__n = STATE__ACCESS_FAULT;
                end
            endcase
        end

        //==============================
        // STATE__MAIN_MEMORY__0
        //==============================
        STATE__MAIN_MEMORY__0:
        begin
            mmu__ce__0 = 1'b1;
            mmu__we = we;
            mmu__addr = addr;
            mmu__dtype = dtype;
            mmu__wr_data = wr_data;
            state__n = STATE__MAIN_MEMORY__1;
        end

        //==============================
        // STATE__MAIN_MEMORY__1
        //==============================
        STATE__MAIN_MEMORY__1:
        begin
            ce__0 = 1'b1;
        end

        //==============================
        // STATE__MEMORY_MAP_REGION__0__ACCESS__2
        //==============================
        STATE__MEMORY_MAP_REGION__0__ACCESS__2:
        begin
            ce__0 = 1'b1;
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = rd_data__0; 
        end

        //==============================
        // STATE__MEMORY_MAP_REGION__1__ACCESS__0
        //==============================
        STATE__ACCESS__0:
        begin
            ce__0 = 1'b1;
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = rd_data__0; 
        end

        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = ERRORCODE__ACCESS_FAULT;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = ERRORCODE__MISALIGNED_ADDRESS;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end

    endcase
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state__n;
    end
end


always__ff @(posedge clk)
begin
    if (cpu_to_mem__valid)
    begin
        we <= cpu_to_mem__we;
    end
end

always__ff @(posedge clk)
begin
    if (cpu_to_mem__valid)
    begin
        addr <= cpu_to_mem__addr;
    end
end

always__ff @(posedge clk)
begin
    if (cpu_to_mem__valid)
    begin
        dtype <= cpu_to_mem__dtype;
    end
end

always__ff @(posedge clk)
begin
    if (cpu_to_mem__valid)
    begin
        wr_data <= cpu_to_mem__data;
    end
end

endmodule

