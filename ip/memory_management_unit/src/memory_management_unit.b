//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    input clk,
    input rst,
    output logic cpu_to_mmu__ready,
    input cpu_to_mmu__we,
    input [63:0] cpu_to_mmu__addr,
    input [2:0] cpu_to_mmu__dtype,
    input [63:0] cpu_to_mmu__data,
    output logic mmu_to_cpu__valid,
    input mmu_to_cpu__ready,
    output logic mmu_to_cpu__error,
    output logic [63:0] mmu_to_cpu__data

    output logic valid__0,
    output logic addr__0
    output logic valid__0
);


//==============================
// physical_memory_attribute_checker
//==============================
module physical_memory_attribute_checker
(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .dtype(dtype),
    .status(status)
);


//==============================
// tx
//==============================
tx tx__range__0
(
    .clk(clk),
    .rst(rst),
    .valid(),
    .ready(),
    .data(),
    .tx__valid(),
    .tx__data(),
    .tx__credit()
);


mmu_to_mem__0__valid;
mmu_to_mem__0__ready;
mmu_to_mem__0__addr;
mmu_to_mem__0__data;

mem_to_mmu__0__valid;
mem_to_mmu__0__ready;
mem_to_mmu__0__data;



always_ff @(posedge clk) begin
    
end



logic [7:0] state;
logic [7:0] state__n;


localparam STATE__RESET = ;
localparam STATE__READY;
localparam STATE__ACCEPT_REQ;
localparam STATE__PMA_CHECK;
localparam STATE__;


always_comb begin
    cpu_to_mmu__ready = 1'b0;
    mmu_to_cpu__valid = 1'b0;
        
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
            state__n = cpu_to_mmu__valid ? STATE__ACCEPT_REQ : STATE__READY;
        end

        //==============================
        // STATE__ACCEPT_REQ
        //==============================
        STATE__ACCEPT_REQ:
        begin
            cpu_to_mmu__ready = 1'b1;
            we__n = cpu_to_mmu__we;
            addr__n = cpu_to_mmu__addr; 
            data__n = cpu_to_mmu__data
            state__n = STATE__PMA_CHECK;
        end

        //==============================
        // STATE__PMA_CHECK
        //==============================
        STATE__PMA_CHECK:
        begin
            case (addr)
                MMIO__RANGE__0:
                begin
                    state__n = 
                end
            endcase
        end

        //==============================
        // STATE__RANGE__0__REQUEST
        //==============================
        STATE__RANGE__0__REQUEST:
        begin
            range__0__valid = 1'b1;
            range__0__data[] = 
            range__0__data[] = 
            state__n = range__0__ready ? 
        end


             

        //==============================
        // STATE__RANGE__0__0
        //==============================
        STATE__RANGE__0__0:
        begin
            cpu_to_
            cpu_to_mmu__ready = 1'b1;
            addr__n = 
            
            state__n = STATE__PMA_CHECK;
        end


            if (cpu_to_mmu__valid) begin

                state__n = STATE__PMA_CHECK;
            end


        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            mmu_to_cpu__valid = 1'b1;
            mmu_to_cpu__data = ERRORCODE__ACCESS_FAULT;
            state__n = mmu_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            mmu_to_cpu__valid = 1'b1;
            mmu_to_cpu__data = ERRORCODE__MISALIGNED_ADDRESS;
            state__n = mmu_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end




    endcase
end


endmodule

