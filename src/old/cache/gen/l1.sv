//==============================================
// l1
//==============================================
module l1
(
    input clk,
    input rst,

    input valid,
    output logic ready,
    input [39:0] addr,
    input rw,
    input [63:0] wr_data,
    input [2:0] dtype,
    output logic hit,
    output logic [63:0] rd_data,

    // input cpu_to_l1__valid,
    // output logic cpu_to_l1__ready,
    // input [39:0] cpu_to_l1__addr,
    // input cpu_to_l1__rw,
    // input [63:0] cpu_to_l1__data,
    // input [2:0] cpu_to_l1__dtype,

    // output logic l1_to_cpu__valid,
    // input l1_to_cpu__ready,
    // output logic [63:0] l1_to_cpu__data,

    output logic l1_to_mem__valid,
    output logic [63:0] l1_to_mem__data,
    input l1_to_mem__credit,
    
    input mem_to_l1__valid,
    input [63:0] mem_to_l1__data,
    output logic mem_to_l1__credit   
);


logic [2:0] state;
logic [2:0] state_n;

logic [2:0] offset;
logic [5:0] index;
logic inc_offset;
logic inc_index;

logic [8:0] data_mem__addr;
logic data_mem__rw;
logic [63:0] data_mem__wr_data;
logic [63:0] data_mem__rd_data;

logic [5:0] tag_mem__addr;
logic tag_mem__rw;
logic [29:0] tag_mem__wr_data;
logic [29:0] tag_mem__rd_data;


logic req__valid;
logic req__ready;
logic [63:0] req__data;

logic rtn__valid;
logic rtn__ready;
logic [63:0] rtn__data;


// Format rd_data.
always_comb begin
    case (dtype)
        3'h0:
        begin
            rd_data = data_mem__rd_data;
        end
        3'h1:
            case (addr[2:0])
                3'h0:
                begin
                    rd_data = {{32{data_mem__rd_data[31]}}, data_mem__rd_data[31:0]};
                end
                3'h4:
                begin
                    rd_data = {{32{data_mem__rd_data[63]}}, data_mem__rd_data[63:32]};
                end
            endcase
        3'h2:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    rd_data = {{32{1'b0}}, data_mem__rd_data[31:0]};
                end
                3'h4:
                begin
                    rd_data = {{32{1'b0}}, data_mem__rd_data[63:32]};
                end
            endcase
        end
        3'h3:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    rd_data = {{16{data_mem__rd_data[15]}}, data_mem__rd_data[15:0]};
                end
                3'h2:
                begin
                    rd_data = {{16{data_mem__rd_data[31]}}, data_mem__rd_data[31:16]};
                end
                3'h4:
                begin
                    rd_data = {{16{data_mem__rd_data[47]}}, data_mem__rd_data[47:32]};
                end
                3'h6:
                begin
                    rd_data = {{16{data_mem__rd_data[63]}}, data_mem__rd_data[63:48]};
                end
            endcase
        end
        3'h4:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    rd_data = {{16{1'b0}}, data_mem__rd_data[15:0]};
                end
                3'h2:
                begin
                    rd_data = {{16{1'b0}}, data_mem__rd_data[31:16]};
                end
                3'h4:
                begin
                    rd_data = {{16{1'b0}}, data_mem__rd_data[47:32]};
                end
                3'h6:
                begin
                    rd_data = {{16{1'b0}}, data_mem__rd_data[63:48]};
                end
            endcase            
        end
        3'h5:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    rd_data = {{8{data_mem__rd_data[7]}}, data_mem__rd_data[7:0]};
                end
                3'h1:
                begin
                    rd_data = {{8{data_mem__rd_data[15]}}, data_mem__rd_data[15:8]};
                end
                3'h2:
                begin
                    rd_data = {{8{data_mem__rd_data[23]}}, data_mem__rd_data[23:16]};
                end
                3'h3:
                begin
                    rd_data = {{8{data_mem__rd_data[31]}}, data_mem__rd_data[31:24]};
                end
                3'h4:
                begin
                    rd_data = {{8{data_mem__rd_data[39]}}, data_mem__rd_data[39:32]};
                end
                3'h5:
                begin
                    rd_data = {{8{data_mem__rd_data[47]}}, data_mem__rd_data[47:40]};
                end
                3'h6:
                begin
                    rd_data = {{8{data_mem__rd_data[55]}}, data_mem__rd_data[55:48]};
                end
                3'h7:
                begin
                    rd_data = {{8{data_mem__rd_data[63]}}, data_mem__rd_data[63:56]};
                end  
            endcase        
        end
        3'h6:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    rd_data = {{8{1'b0}}, data_mem__rd_data[7:0]};
                end
                3'h1:
                begin
                    rd_data = {{8{1'b0}}, data_mem__rd_data[15:8]};
                end
                3'h2:
                begin
                    rd_data = {{8{1'b0}}, data_mem__rd_data[23:16]};
                end
                3'h3:
                begin
                    rd_data = {{8{1'b0}}, data_mem__rd_data[31:24]};
                end
                3'h4:
                begin
                    rd_data = {{8{1'b0}}, data_mem__rd_data[39:32]};
                end
                3'h5:
                begin
                    rd_data = {{8{1'b0}}, data_mem__rd_data[47:40]};
                end
                3'h6:
                begin
                    rd_data = {{8{1'b0}}, data_mem__rd_data[55:48]};
                end
                3'h7:
                begin
                    rd_data = {{8{1'b0}}, data_mem__rd_data[63:56]};
                end
            endcase              
        end
    endcase
end



//==============================================
// Control FSM
//==============================================
parameter STATE__RESET = 3'h0;
parameter STATE__INIT = 3'h1;
parameter STATE__READ_WRITE = 3'h2;
parameter STATE__ALLOCATE__SEND_REQUEST= 3'h3;
parameter STATE__ALLOCATE__WRITE_L1 = 3'h4;
parameter STATE__WRITE_BACK__SEND_HEADER = 3'h5;
parameter STATE__WRITE_BACK__SEND_DATA = 3'h6;


logic [39:0] rw_addr;
logic [39:0] rw_addr_n;

always_comb begin
    state_n = state;
    hit = 1'b0;

    ready = 1'b0;

    rw_addr_n = rw_addr;

    data_mem__rw = 1'b0;
    data_mem__addr = {addr[11:6], addr[5:3]};

    tag_mem__rw = 1'b0;
    tag_mem__wr_data = tag_mem__wr_data;
    tag_mem__addr = addr[11:6];

    rtn__ready = 1'b0;
    req__valid = 1'b0;
    inc_offset = 1'b0;
    inc_index = 1'b0;

    case (state)
        STATE__RESET:
        begin
            rw_addr_n = 0;
            state_n = STATE__INIT;
        end
        STATE__INIT:
        begin
            rw_addr_n = rw_addr + 64;
            tag_mem__rw = 1'b1;
            tag_mem__wr_data = 0;
            tag_mem__addr = rw_addr[11:6];

            if (&rw_addr[11:6]) begin
                state_n = STATE__READ_WRITE;
            end
        end
        STATE__READ_WRITE:
        begin
            if (valid) begin
                hit = (addr[39:12] == tag_mem__rd_data[27:0]) & tag_mem__rd_data[28];

                if (hit) begin
                    ready = 1'b1;

                    if (rw) begin
                        data_mem__rw = 1'b1;
                        // EDIT: need to modify write based on dtype
                        data_mem__wr_data = wr_data;
                        tag_mem__rw = 1'b1;
                        tag_mem__wr_data = tag_mem__rd_data;
                        tag_mem__wr_data[29] = 1'b1;
                        state_n = STATE__READ_WRITE;
                    end
                end
                else begin
                    if (tag_mem__rd_data[29]) begin
                        rw_addr_n = {tag_mem__rd_data[27:0], addr[11:6], 6'h0};
                        state_n = STATE__WRITE_BACK__SEND_HEADER;
                    end
                    else begin
                        rw_addr_n = {addr[39:12], addr[11:6], 6'h0};
                        state_n = STATE__ALLOCATE__SEND_REQUEST;
                    end
                end
            end
            else begin
                ready = 1'b1;
            end
        end
        STATE__ALLOCATE__SEND_REQUEST:
        begin
            req__valid = 1'b1;
            req__data = {1'b0, rw_addr};

            if (req__ready) begin
                state_n = STATE__ALLOCATE__WRITE_L1;
            end       
        end
        STATE__ALLOCATE__WRITE_L1:
        begin
            rtn__ready = 1'b1;
            data_mem__addr = {rw_addr[11:6], rw_addr[5:3]};

            if (rtn__valid) begin
                data_mem__rw = 1'b1;
                data_mem__wr_data = rtn__data;
                tag_mem__rw = 1'b1;
                tag_mem__wr_data[27:0] = addr[39:12];
                tag_mem__wr_data[28] = 1'b1;
                tag_mem__wr_data[29] = 1'b0;
                rw_addr_n = rw_addr + 8;

                if (&rw_addr[5:3]) begin
                    state_n = STATE__READ_WRITE;
                end
            end
        end
        STATE__WRITE_BACK__SEND_HEADER:
        begin
            req__valid = 1'b1;
            req__data = {1'b1, rw_addr};

            if (req__ready) begin
                state_n = STATE__WRITE_BACK__SEND_DATA;
            end 
        end
        STATE__WRITE_BACK__SEND_DATA:
        begin
            data_mem__addr = {rw_addr[11:6], rw_addr[5:3]};
            req__valid = 1'b1;
            req__data = data_mem__rd_data;

            if (req__ready) begin
                rw_addr_n = rw_addr + 8;

                if (&rw_addr[5:3]) begin
                    rw_addr_n = {addr[39:12], addr[11:6], 6'h0};
                    state_n = STATE__ALLOCATE__SEND_REQUEST;
                end
            end
        end
    endcase
end

always_ff @(posedge clk) begin
    if (rst) begin
        state <= STATE__RESET;
    end
    else begin
        state <= state_n;
    end
end

always_ff @(posedge clk) begin
    rw_addr <= rw_addr_n;
end



//==============================
// data_mem
//==============================
memory #(.WIDTH(64), .DEPTH(512), .DEPTH__LOG2(9)) data_mem
(
    .clk(clk),
    .rst(rst),
    .addr(data_mem__addr),
    .rw(data_mem__rw),
    .wr_data(data_mem__wr_data),
    .rd_data(data_mem__rd_data)
);

//==============================
// tag_mem
//==============================
memory #(.WIDTH(30), .DEPTH(64), .DEPTH__LOG2(6)) tag_mem
(
    .clk(clk),
    .rst(rst),
    .addr(tag_mem__addr),
    .rw(tag_mem__rw),
    .wr_data(tag_mem__wr_data),
    .rd_data(tag_mem__rd_data)
);



//==============================
// il1_to_mem__tx
//==============================
tx #(.WIDTH(64), .MAX_CREDITS(1), .MAX_CREDITS__LOG2(0)) il1_to_mem__tx
(
    .clk(clk),
    .rst(rst),
    .valid(req__valid),
    .ready(req__ready),
    .data(req__data),
    .tx__valid(l1_to_mem__valid),
    .tx__data(l1_to_mem__data),
    .tx__credit(l1_to_mem__credit)
);



//==============================
// mem_to_il1__rx
//==============================
rx #(.WIDTH(64), .MAX_CREDITS(1), .MAX_CREDITS__LOG2(0)) mem_to_il1__rx
(
    .clk(clk),
    .rst(rst),
    .valid(rtn__valid),
    .ready(rtn__ready),
    .data(rtn__data),
    .rx__valid(mem_to_l1__valid),
    .rx__data(mem_to_l1__data),
    .rx__credit(mem_to_l1__credit)
);


endmodule

