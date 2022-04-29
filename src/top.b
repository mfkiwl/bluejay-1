//==============================================
// top
//==============================================
module top
(
    input clk,
    input rst
);

logic [39:0] mem__addr;
logic [63:0] mem__rd_data;
logic [63:0] mem__wr_data;
logic tx__il1_to_mem__valid;
logic [63:0] tx__il1_to_mem__data;
logic tx__il1_to_mem__credit;
logic tx__mem_to_il1__valid;
logic [63:0] tx__mem_to_il1__data;
logic tx__mem_to_il1__credit;

logic [2:0] state;
logic [2:0] state_n;
logic set__mem__addr;
logic inc__mem__addr;


//==============================
// cpu
//==============================
central_processing_unit cpu
(
    .clk(clk),
    .rst(rst),
    .tx__il1_to_mem__valid(tx__il1_to_mem__valid),
    .tx__il1_to_mem__data(tx__il1_to_mem__data),
    .tx__il1_to_mem__credit(tx__il1_to_mem__credit),
    .tx__mem_to_il1__valid(tx__mem_to_il1__valid),
    .tx__mem_to_il1__data(tx__mem_to_il1__data),
    .tx__mem_to_il1__credit(tx__mem_to_il1__credit)
);

//==============================================
// mem
//==============================================
memory #(.WIDTH(64), .DEPTH(4096), .DEPTH__LOG2(12)) mem
(
    .clk(clk),
    .rst(rst),
    .addr(mem__addr[11:0]),
    .rw(1'b0),
    .wr_data(mem__wr_data),
    .rd_data(mem__rd_data)
);


// logic [7:0] memory [1023:0];
parameter STATE__IDLE = 3'h0;
parameter STATE__ACCEPT = 3'h1;
parameter STATE__READ_BACK = 3'h2;

always_comb begin
    state_n = state;
    il1_to_mem__ready = 1'b0;
    set__mem__addr = 1'b0;
    inc__mem__addr = 1'b0;
    mem_to_il1__valid = 1'b0;
    mem_to_il1__data = mem__rd_data;

    case (state)
        STATE__IDLE:
        begin
            if (il1_to_mem__valid) begin
                state_n = STATE__ACCEPT;
            end
        end
        STATE__ACCEPT: 
        begin
            il1_to_mem__ready = 1'b1;
            set__mem__addr = 1'b1;

            if (il1_to_mem__data[40]) begin
            end
            else begin
                state_n = STATE__READ_BACK;
            end
        end
        STATE__READ_BACK:
        begin
            mem_to_il1__valid = 1'b1;

            if (mem_to_il1__ready) begin
                inc__mem__addr = 1'b1;

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
    if (set__mem__addr) begin
        mem__addr <= {il1_to_mem__data[39:6], 6'h0};
    end
    else if (inc__mem__addr) begin
        mem__addr <= mem__addr + 8;
    end
end


//==============================
// rx__il1_to_mem
//==============================
rx #(.WIDTH(64), .MAX_CREDITS(1), .MAX_CREDITS__LOG2(0)) rx__il1_to_mem
(
    .clk(clk),
    .rst(rst),
    .valid(il1_to_mem__valid),
    .ready(il1_to_mem__ready),
    .data(il1_to_mem__data),
    .rx__valid(tx__il1_to_mem__valid),
    .rx__data(tx__il1_to_mem__data),
    .rx__credit(tx__il1_to_mem__credit)
);

logic il1_to_mem__valid;
logic il1_to_mem__ready;
logic [63:0] il1_to_mem__data;


//==============================
// tx__mem_to_il1
//==============================
tx #(.WIDTH(64), .MAX_CREDITS(1), .MAX_CREDITS__LOG2(0)) tx__mem_to_il1
(
    .clk(clk),
    .rst(rst),
    .valid(mem_to_il1__valid),
    .ready(mem_to_il1__ready),
    .data(mem_to_il1__data),
    .tx__valid(tx__mem_to_il1__valid),
    .tx__data(tx__mem_to_il1__data),
    .tx__credit(tx__mem_to_il1__credit)
);

logic mem_to_il1__valid;
logic mem_to_il1__ready;
logic [63:0] mem_to_il1__data;



endmodule
