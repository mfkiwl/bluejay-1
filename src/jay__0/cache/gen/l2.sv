//==============================================
// l2
//==============================================
module l2
(
    input clk,
    input rst,

    input il1_to_mem__valid,
    input [63:0] il1_to_mem__data,
    output logic il1_to_mem__credit,
    output logic mem_to_il1__valid,
    output logic [63:0] mem_to_il1__data,
    input mem_to_il1__credit,

    input dl1_to_mem__valid,
    input [63:0] dl1_to_mem__data,
    output logic dl1_to_mem__credit,
    output logic mem_to_dl1__valid,
    output logic [63:0] mem_to_dl1__data,
    input mem_to_dl1__credit,

    output logic [39:0] mem__addr,
    output logic mem__rw,
    output logic [63:0] mem__wr_data,
    input [63:0] mem__rd_data
);


logic [39:0] mem__addr_n;

//==============================================
// Control FSM
//==============================================
parameter STATE__IDLE = 4'h0;
parameter STATE__IL1__ACCEPT = 4'h1;
parameter STATE__IL1__WRITE = 4'h2;
parameter STATE__IL1__READ = 4'h3;
parameter STATE__IL1__READ_DELAY_0 = 4'h4;
parameter STATE__IL1__READ_DELAY_1 = 4'h5;
parameter STATE__DL1__ACCEPT = 4'h6;
parameter STATE__DL1__WRITE = 4'h7;
parameter STATE__DL1__READ = 4'h8;
parameter STATE__DL1__READ_DELAY_0 = 4'h9;
parameter STATE__DL1__READ_DELAY_1 = 4'ha;

logic [3:0] state;
logic [3:0] state_n;


always_comb begin
    state_n = state;
    mem__addr_n = mem__addr; 
    ireq__ready = 1'b0;
    irtn__valid = 1'b0;
    irtn__data = mem__rd_data;
    dreq__ready = 1'b0;
    drtn__valid = 1'b0;
    drtn__data = mem__rd_data;

    case (state)
        STATE__IDLE:
        begin
            if (ireq__valid) begin
                state_n = STATE__IL1__ACCEPT;
            end
            if (dreq__valid) begin
                state_n = STATE__DL1__ACCEPT;
            end
        end
        STATE__IL1__ACCEPT: 
        begin
            ireq__ready = 1'b1;
            mem__addr_n = {ireq__data[39:6], 6'h0};

            if (ireq__data[40]) begin
                state_n = STATE__IL1__WRITE;
            end
            else begin
                state_n = STATE__IL1__READ_DELAY_0;
            end
        end
        STATE__IL1__READ_DELAY_0:
        begin
            state_n = STATE__IL1__READ_DELAY_1;
        end
        STATE__IL1__READ_DELAY_1:
        begin
            state_n = STATE__IL1__READ;
        end
        STATE__IL1__READ:
        begin
            irtn__valid = 1'b1;

            if (irtn__ready) begin
                mem__addr_n = mem__addr + 8;

                if (&mem__addr[5:3]) begin
                    state_n = STATE__IDLE;
                end
                else begin
                    state_n = STATE__IL1__READ_DELAY_0;
                end
            end
        end
        STATE__IL1__WRITE:
        begin
            ireq__ready = 1'b1;

            if (ireq__valid) begin
                mem__rw = 1'b1;
                mem__wr_data = ireq__data;
                mem__addr_n = mem__addr + 8;

                if (&mem__addr[5:3]) begin
                    state_n = STATE__IDLE;
                end
            end
        end
        STATE__DL1__ACCEPT: 
        begin
            dreq__ready = 1'b1;
            mem__addr_n = {dreq__data[39:6], 6'h0};

            if (dreq__data[40]) begin
                state_n = STATE__DL1__WRITE;
            end
            else begin
                state_n = STATE__DL1__READ_DELAY_0;
            end
        end
        STATE__DL1__READ_DELAY_0:
        begin
            state_n = STATE__DL1__READ_DELAY_1;
        end
        STATE__DL1__READ_DELAY_1:
        begin
            state_n = STATE__DL1__READ;
        end
        STATE__DL1__READ:
        begin
            drtn__valid = 1'b1;

            if (drtn__ready) begin
                mem__addr_n = mem__addr + 8;

                if (&mem__addr[5:3]) begin
                    state_n = STATE__IDLE;
                end
                else begin
                    state_n = STATE__DL1__READ_DELAY_0;
                end
            end
        end
        STATE__DL1__WRITE:
        begin
            dreq__ready = 1'b1;

            if (dreq__valid) begin
                mem__rw = 1'b1;
                mem__wr_data = dreq__data;
                mem__addr_n = mem__addr + 8;

                if (&mem__addr[5:3]) begin
                    state_n = STATE__IDLE;
                end
            end
        end

    endcase
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__IDLE;
    end
    else begin
        state <= state_n;
    end
end

always_ff @(posedge clk) begin
    mem__addr <= mem__addr_n;
end

//==============================================
// il1 interface
//==============================================
//==============================
// il1_to_mem__rx
//==============================
rx #(.WIDTH(64), .MAX_CREDITS(1), .MAX_CREDITS__LOG2(0)) il1_to_mem__rx
(
    .clk(clk),
    .rst(rst),
    .valid(ireq__valid),
    .ready(ireq__ready),
    .data(ireq__data),
    .rx__valid(il1_to_mem__valid),
    .rx__data(il1_to_mem__data),
    .rx__credit(il1_to_mem__credit)
);

logic ireq__valid;
logic ireq__ready;
logic [63:0] ireq__data;


//==============================
// mem_to_il1__tx
//==============================
tx #(.WIDTH(64), .MAX_CREDITS(1), .MAX_CREDITS__LOG2(0)) mem_to_il1__tx
(
    .clk(clk),
    .rst(rst),
    .valid(irtn__valid),
    .ready(irtn__ready),
    .data(irtn__data),
    .tx__valid(mem_to_il1__valid),
    .tx__data(mem_to_il1__data),
    .tx__credit(mem_to_il1__credit)
);

logic irtn__valid;
logic irtn__ready;
logic [63:0] irtn__data;

//==============================================
// dl1 interface
//==============================================
//==============================
// dl1_to_mem__rx
//==============================
rx #(.WIDTH(64), .MAX_CREDITS(1), .MAX_CREDITS__LOG2(0)) dl1_to_mem__rx
(
    .clk(clk),
    .rst(rst),
    .valid(dreq__valid),
    .ready(dreq__ready),
    .data(dreq__data),
    .rx__valid(dl1_to_mem__valid),
    .rx__data(dl1_to_mem__data),
    .rx__credit(dl1_to_mem__credit)
);

logic dreq__valid;
logic dreq__ready;
logic [63:0] dreq__data;


//==============================
// mem_to_dl1__tx
//==============================
tx #(.WIDTH(64), .MAX_CREDITS(1), .MAX_CREDITS__LOG2(0)) mem_to_dl1__tx
(
    .clk(clk),
    .rst(rst),
    .valid(drtn__valid),
    .ready(drtn__ready),
    .data(drtn__data),
    .tx__valid(mem_to_dl1__valid),
    .tx__data(mem_to_dl1__data),
    .tx__credit(mem_to_dl1__credit)
);

logic drtn__valid;
logic drtn__ready;
logic [63:0] drtn__data;


endmodule