//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    input clk,
    input rst,
    input cpu_to_mem__valid,
    output logic cpu_to_mem__ready,
    input cpu_to_mem__we,
    input [63:0] cpu_to_mem__addr,
    input [2:0] cpu_to_mem__dtype,
    input [63:0] cpu_to_mem__data,
    output logic mem_to_cpu__valid,
    input mem_to_cpu__ready,
    output logic mem_to_cpu__error,
    output logic [63:0] mem_to_cpu__data,
    output logic [7:0] port__0
);


logic we;
logic we__n;
logic [63:0] addr;
logic [63:0] addr__n;
logic [2:0] dtype;
logic [2:0] dtype__n;
logic [63:0] wr_data;
logic [63:0] wr_data__n;

logic ena;
logic wea;
logic [11:0] addra;
logic [63:0] dina;
logic [63:0] douta;
logic [63:0] douta__aligned;

logic [7:0] port__0__n;

logic [3:0] state;
logic [3:0] state__n;

//==============================
// store_dtype 
//==============================
store_dtype store_dtype__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]),
    .dtype(dtype),
    .wr_data(wr_data),
    .din(douta),
    .dout(dina)
);

//==============================
// read_dtype 
//==============================
read_dtype read_dtype__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]),
    .dtype(dtype),
    .din(douta),
    .dout(douta__aligned)
);


//==============================
// mem 
//==============================
memory mem 
(
    .clka(clk),
    .addra(addra),
    .dina(dina),
    .douta(douta),
    .ena(ena),
    .wea(wea)
);


assign addra = addr[8:3];

localparam STATE__RESET = 4'h0;
localparam STATE__READY = 4'h1;
localparam STATE__ACCEPT_REQ = 4'h2;
localparam STATE__PMA_CHECK = 4'h3;
localparam STATE__R0__WRITE__0 = 4'h4;
localparam STATE__R0__WRITE__1 = 4'h5;
localparam STATE__R0__WRITE__2 = 4'h6;
localparam STATE__R0__READ__0 = 4'h7;
localparam STATE__R0__READ__1 = 4'h8;
localparam STATE__R0__READ__2 = 4'h9;
localparam STATE__R1__WRITE__0 = 4'ha;
localparam STATE__R1__READ__0 = 4'hb;
localparam STATE__ACCESS_FAULT = 4'hc;
localparam STATE__MISALIGNED_ADDRESS = 4'hd;

always_comb begin
    state__n = state;
    cpu_to_mem__ready = 1'b0;
    mem_to_cpu__valid = 1'b0;
    mem_to_cpu__error = 1'b0;
    we__n = we;
    addr__n = addr;
    wr_data__n = wr_data;
    ena = 1'b0;
    wea = 1'b0;
        
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
            state__n = cpu_to_mem__valid ? STATE__ACCEPT_REQ : STATE__READY;
        end

        //==============================
        // STATE__ACCEPT_REQ
        //==============================
        STATE__ACCEPT_REQ:
        begin
            cpu_to_mem__ready = 1'b1;
            we__n = cpu_to_mem__we;
            addr__n = cpu_to_mem__addr; 
            dtype__n = cpu_to_mem__dtype;
            wr_data__n = cpu_to_mem__data;
            state__n = STATE__PMA_CHECK;
        end

        //==============================
        // STATE__PMA_CHECK
        //==============================
        STATE__PMA_CHECK:
        begin
            casez (addr)
                64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0???_????_????_????:
                begin
                    state__n = we ? STATE__R0__WRITE__0 : STATE__R0__READ__0;
                end
                64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_1???_????_????_????:
                begin
                    state__n = we ? STATE__R1__WRITE__0 : STATE__R1__READ__0;
                end
            endcase
        end

        //==============================
        // STATE__R0__WRITE__0
        //==============================
        STATE__R0__WRITE__0:
        begin
            ena = 1'b1;
            wea = 1'b0;
            state__n = STATE__R0__WRITE__1; 
        end

        //==============================
        // STATE__R0__WRITE__1
        //==============================
        STATE__R0__WRITE__1:
        begin
            ena = 1'b1;
            state__n = STATE__R0__WRITE__2; 
        end

        //==============================
        // STATE__R0__WRITE__2
        //==============================
        STATE__R0__WRITE__2:
        begin
            mem_to_cpu__valid = 1'b1;
            ena = 1'b1;
            wea = 1'b1;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__R0__WRITE__2; 
        end

        //==============================
        // STATE__R0__READ__0
        //==============================
        STATE__R0__READ__0:
        begin
            ena = 1'b1;
            wea = 1'b0;
            state__n = STATE__R0__READ__1; 
        end

        //==============================
        // STATE__R0__READ__1
        //==============================
        STATE__R0__READ__1:
        begin
            ena = 1'b1;
            state__n = STATE__R0__READ__2; 
        end

        //==============================
        // STATE__R0__READ__2
        //==============================
        STATE__R0__READ__2:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = douta__aligned;
            ena = 1'b1;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__R0__READ__2; 
        end


        //==============================
        // STATE__R1__WRITE__0
        //==============================
        STATE__R1__WRITE__0:
        begin
            mem_to_cpu__valid = 1'b1;
            port__0__n = wr_data[7:0];
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__R1__WRITE__0; 
        end

        //==============================
        // STATE__R1__READ__0
        //==============================
        STATE__R1__READ__0:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = {56'b0, port__0};
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__R1__READ__0; 
        end

        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = 64'h0;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__data = 64'h1;
            state__n = mem_to_cpu__ready ? STATE__READY : STATE__ACCESS_FAULT;
        end

    endcase
end

always_ff @(posedge clk) begin
    we <= we__n;
end

always_ff @(posedge clk) begin
    addr <= addr__n;
end

always_ff @(posedge clk) begin
    dtype <= dtype__n;
end

always_ff @(posedge clk) begin
    wr_data <= wr_data__n;
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state__n;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        port__0 <= 8'h0;
    end
    else begin
        port__0 <= port__0__n;
    end
end


endmodule

