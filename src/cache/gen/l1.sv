//==============================================
// l1
//==============================================
module l1
(
    input clk,
    input rst,

    input cpu_to_l1__valid,
    output logic cpu_to_l1__ready,
    input [39:0] cpu_to_l1__addr,
    input cpu_to_l1__rw,
    input [63:0] cpu_to_l1__data,
    input [2:0] cpu_to_l1__dtype,

    output logic l1_to_cpu__valid,
    input l1_to_cpu__ready,
    output logic [63:0] l1_to_cpu__data,

    output logic l1_to_mem__valid,
    input l1_to_mem__ready,
    output logic [63:0] l1_to_mem__data,

    input mem_to_l1__valid,
    output logic mem_to_l1__ready,
    input [63:0] mem_to_l1__data
);

logic [2:0] state;
logic [2:0] state_n;
logic [2:0] offset;
logic [5:0] index;
logic [8:0] data_mem__addr;
logic data_mem__rw;
logic [63:0] data_mem__wr_data;
logic [63:0] data_mem__rd_data;
logic [5:0] tag_mem__addr;
logic tag_mem__rw;
logic [29:0] tag_mem__wr_data;
logic [29:0] tag_mem__rd_data;
logic inc_offset;
logic inc_index;


logic S0__valid;
logic S0__ready;
logic [39:0] S0__addr;
logic S0__rw;
logic [2:0] S0__dtype;
logic [63:0] S0__wr_data;
logic [63:0] S0__rd_data;
logic S0__hit;


//==============================================
// Stage 0 (S0)
//==============================================
// S0 pipe stage (valid).
always_ff @(posedge clk) begin
    if (rst) begin
        S0__valid <= 1'b0;
    end
    else begin
        S0__valid <= S0__ready ? cpu_to_l1__valid : S0__valid;
    end
end

// S0 pipe stage (data).
always_ff @(posedge clk) begin
    if (cpu_to_l1__valid & S0__ready) begin
        S0__addr <= cpu_to_l1__addr;
        S0__rw <= cpu_to_l1__rw;
        S0__wr_data <= cpu_to_l1__data;
        S0__dtype <= cpu_to_l1__dtype;
    end
end

assign S0__ready = l1_to_cpu__ready & (~S0__valid || S0__hit); 
assign S0__hit = S0__valid & (S0__addr[39:12] == tag_mem__rd_data[27:0]) & tag_mem__rd_data[28] & (state == STATE__READ_WRITE);
assign cpu_to_l1__ready = S0__ready;
assign l1_to_cpu__valid = S0__valid & S0__hit;
assign l1_to_cpu__data = S0__rd_data;

// Format rd_data.
always_comb begin
    case (S0__dtype)
        3'h0:
        begin
            S0__rd_data = data_mem__rd_data;
        end
        3'h1:
            case (S0__addr[2:0])
                3'h0:
                begin
                    S0__rd_data = {{32{data_mem__rd_data[31]}}, data_mem__rd_data[31:0]};
                end
                3'h4:
                begin
                    S0__rd_data = {{32{data_mem__rd_data[63]}}, data_mem__rd_data[63:32]};
                end
            endcase
        3'h2:
        begin
            case (S0__addr[2:0])
                3'h0:
                begin
                    S0__rd_data = {{32{1'b0}}, data_mem__rd_data[31:0]};
                end
                3'h4:
                begin
                    S0__rd_data = {{32{1'b0}}, data_mem__rd_data[63:32]};
                end
            endcase
        end
        3'h3:
        begin
            case (S0__addr[2:0])
                3'h0:
                begin
                    S0__rd_data = {{16{data_mem__rd_data[15]}}, data_mem__rd_data[15:0]};
                end
                3'h2:
                begin
                    S0__rd_data = {{16{data_mem__rd_data[31]}}, data_mem__rd_data[31:16]};
                end
                3'h4:
                begin
                    S0__rd_data = {{16{data_mem__rd_data[47]}}, data_mem__rd_data[47:32]};
                end
                3'h6:
                begin
                    S0__rd_data = {{16{data_mem__rd_data[63]}}, data_mem__rd_data[63:48]};
                end
            endcase
        end
        3'h4:
        begin
            case (S0__addr[2:0])
                3'h0:
                begin
                    S0__rd_data = {{16{1'b0}}, data_mem__rd_data[15:0]};
                end
                3'h2:
                begin
                    S0__rd_data = {{16{1'b0}}, data_mem__rd_data[31:16]};
                end
                3'h4:
                begin
                    S0__rd_data = {{16{1'b0}}, data_mem__rd_data[47:32]};
                end
                3'h6:
                begin
                    S0__rd_data = {{16{1'b0}}, data_mem__rd_data[63:48]};
                end
            endcase            
        end
        3'h5:
        begin
            case (S0__addr[2:0])
                3'h0:
                begin
                    S0__rd_data = {{8{data_mem__rd_data[7]}}, data_mem__rd_data[7:0]};
                end
                3'h1:
                begin
                    S0__rd_data = {{8{data_mem__rd_data[15]}}, data_mem__rd_data[15:8]};
                end
                3'h2:
                begin
                    S0__rd_data = {{8{data_mem__rd_data[23]}}, data_mem__rd_data[23:16]};
                end
                3'h3:
                begin
                    S0__rd_data = {{8{data_mem__rd_data[31]}}, data_mem__rd_data[31:24]};
                end
                3'h4:
                begin
                    S0__rd_data = {{8{data_mem__rd_data[39]}}, data_mem__rd_data[39:32]};
                end
                3'h5:
                begin
                    S0__rd_data = {{8{data_mem__rd_data[47]}}, data_mem__rd_data[47:40]};
                end
                3'h6:
                begin
                    S0__rd_data = {{8{data_mem__rd_data[55]}}, data_mem__rd_data[55:48]};
                end
                3'h7:
                begin
                    S0__rd_data = {{8{data_mem__rd_data[63]}}, data_mem__rd_data[63:56]};
                end  
            endcase        
        end
        3'h6:
        begin
            case (S0__addr[2:0])
                3'h0:
                begin
                    S0__rd_data = {{8{1'b0}}, data_mem__rd_data[7:0]};
                end
                3'h1:
                begin
                    S0__rd_data = {{8{1'b0}}, data_mem__rd_data[15:8]};
                end
                3'h2:
                begin
                    S0__rd_data = {{8{1'b0}}, data_mem__rd_data[23:16]};
                end
                3'h3:
                begin
                    S0__rd_data = {{8{1'b0}}, data_mem__rd_data[31:24]};
                end
                3'h4:
                begin
                    S0__rd_data = {{8{1'b0}}, data_mem__rd_data[39:32]};
                end
                3'h5:
                begin
                    S0__rd_data = {{8{1'b0}}, data_mem__rd_data[47:40]};
                end
                3'h6:
                begin
                    S0__rd_data = {{8{1'b0}}, data_mem__rd_data[55:48]};
                end
                3'h7:
                begin
                    S0__rd_data = {{8{1'b0}}, data_mem__rd_data[63:56]};
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


always_comb begin
    state_n = state;
    data_mem__rw = 1'b0;
    data_mem__addr = {S0__addr[11:6], S0__addr[5:3]};
    tag_mem__rw = 1'b0;
    tag_mem__wr_data = tag_mem__wr_data;
    tag_mem__addr = S0__addr[11:6];
    mem_to_l1__ready = 1'b0;
    l1_to_mem__valid = 1'b0;
    inc_offset = 1'b0;
    inc_index = 1'b0;

    case (state)
        STATE__RESET:
        begin
            state_n = STATE__INIT;
        end
        STATE__INIT:
        begin
            inc_index = 1'b1;    
            tag_mem__rw = 1'b1;
            tag_mem__wr_data = 0;
            tag_mem__addr = index;

            if (&index) begin
                state_n = STATE__READ_WRITE;
            end
        end
        STATE__READ_WRITE:
        begin
            if (S0__valid) begin
                if (S0__hit) begin
                    if (S0__rw) begin
                        data_mem__rw = 1'b1;
                        data_mem__wr_data = S0__wr_data;
                        tag_mem__rw = 1'b1;
                        tag_mem__wr_data = tag_mem__rd_data;
                        tag_mem__wr_data[29] = 1'b1;
                        state_n = STATE__READ_WRITE;
                    end
                end
                else begin
                    if (tag_mem__rd_data[29]) begin
                        state_n = STATE__WRITE_BACK__SEND_HEADER;
                    end
                    else begin
                        state_n = STATE__ALLOCATE__SEND_REQUEST;
                    end
                end
            end
        end
        STATE__ALLOCATE__SEND_REQUEST:
        begin
            l1_to_mem__valid = 1'b1;
            l1_to_mem__data = {1'b0, S0__addr};

            if (l1_to_mem__ready) begin
                state_n = STATE__ALLOCATE__WRITE_L1;
            end       
        end
        STATE__ALLOCATE__WRITE_L1:
        begin
            mem_to_l1__ready = 1'b1;
            data_mem__addr = {S0__addr[11:6], offset};

            if (mem_to_l1__valid) begin
                data_mem__rw = 1'b1;
                data_mem__wr_data = mem_to_l1__data;
                tag_mem__rw = 1'b1;
                tag_mem__wr_data[27:0] = S0__addr[39:12];
                tag_mem__wr_data[28] = 1'b1;
                tag_mem__wr_data[29] = 1'b0;
                inc_offset = 1'b1;

                if (&offset) begin
                    state_n = STATE__READ_WRITE;
                end
            end
        end
        STATE__WRITE_BACK__SEND_HEADER:
        begin
            l1_to_mem__valid = 1'b1;
            l1_to_mem__data = {1'b1, S0__addr};

            if (l1_to_mem__ready) begin
                state_n = STATE__WRITE_BACK__SEND_DATA;
            end 
        end
        STATE__WRITE_BACK__SEND_DATA:
        begin
            data_mem__addr = {S0__addr[11:6], offset};
            l1_to_mem__valid = 1'b1;
            l1_to_mem__data = data_mem__rd_data;

            if (l1_to_mem__ready) begin
                inc_offset = 1'b1;

                if (&offset) begin
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
    if (rst) begin
        index <= 0;
    end
    else begin
        index <= inc_index ? index + 1 : index;
    end
end

always_ff @(posedge clk) begin
    if (rst) begin
        offset <= 0;
    end
    else begin
        offset <= inc_offset ? offset + 1 : offset;
    end
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


endmodule








// // S0
// logic S0__valid;
// logic S0__ready;
// logic [63:0] S0__addr;
// logic S0__rw;
// logic [63:0] S0__wr_data;
// logic [1:0] S0__type;
// logic [63:0] S0__rd_data;
// logic S0__hit;

// // S1
// logic S1__valid;
// logic S1__ready;
// logic [63:0] S1__rd_data;

// //==============================================
// // Stage 0 (S0)
// //==============================================
// // S0 pipe stage (valid)
// always_ff @(posedge clk) begin
//     if (rst) begin
//         S0__valid <= 1'b0;
//     end
//     else begin
//         S0__valid <= S0__ready ? cpu_to_l1__valid : S0__valid;
//     end
// end

// // S0 pipe stage (data).
// always_ff @(posedge clk) begin
//     if (cpu_to_l1__valid & S0__ready) begin
//         S0__addr <= cpu_to_l1__addr;
//         S0__rw <= cpu_to_l1__rw;
//         S0__wr_data <= cpu_to_l1__wr_data;
//         S0__type <= cpu_to_l1__type;
//     end
// end

// assign S0__ready = ~S0__valid | (S0__valid & S0__hit & S1__ready);

// //==============================================
// // Stage 1 (S1)
// //==============================================
// // S1 pipe stage (valid)
// always_ff @(posedge clk) begin
//     if (rst) begin
//         S1__valid <= 1'b0;
//     end
//     else begin
//         S1__valid <= S1__ready ? (S0__valid & S0__hit) : S1__valid;
//     end
// end

// // S1 pipe stage (data).
// always_ff @(posedge clk) begin
//     if (S0__valid & S0__hit & S1__ready) begin
//         S1__rd_data <= S0__rd_data;
//     end
// end


// assign S1__ready = l1_to_cpu__ready;








// // Breakout addr.
// assign tag = addr[39:12];
// assign index = addr[11:6];
// assign block_offset = addr[5:3];
// assign byte_offset = addr[2:0];

// assign hit = (S0__tag = tag_mem__rd_data[27:0]) & tag_mem__rd_data[28];



// //==============================================
// // FSM
// //==============================================
// // FSM state
// logic [2:0] state;
// logic [2:0] state_n;
// // parameter READ_WRITE = 3'h0;
// // parameter WRITE_BACK_0 = 3'h1;
// // parameter WRITE_BACK_1 = 3'h2;
// // parameter ALLOCATE_0 = 3'h3;
// // parameter ALLOCATE_1 = 3'h4;
// // parameter ALLOCATE_2 = 3'h5;


// always_comb begin
//     S0__hit = 1'b0;
//     data_mem__rw = 1'b0;
//     tag_mem__rw = 1'b0;

//     case (state)
//         STATE__READ_WRITE:
//         begin
//             if (S0__valid) begin
//                 S0__hit = (S0__addr[39:12] == tag_mem__rd_data[27:0]) & tag_mem__rd_data[28];

//                 if (S0__rw) begin
//                     data_mem__rw = 1'b1;
//                     tag_mem__rw = 1'b1;
//                     tag_mem__wr_data = tag_mem__rd_data;
//                     tag_mem__wr_data[29] = 1'b1;
//                     state_n = S0__hit ? STATE__READ_WRITE : STATE__WRITE_BACK;
//                 end 
//                 else begin
//                     state_n = S0__hit ? STATE__READ_WRITE : STATE__ALLOCATE__SEND_REQUEST;
//                 end
//             end
//         STATE__ALLOCATE__SEND_REQUEST:
//         begin
//             l1_to_mem__valid = 1'b1;
//             l1_to_mem__data = {S0__addr, S0__rw};
//             state_n = l1_to_mem__ready ? STATE__ALLOCATE__WAIT : STATE__ALLOCATE__SEND_REQUEST;
//         end
//         STATE__ALLOCATE__WAIT:
//         begin
//             mem_to_l1__ready = 1'b1;
//             state_n = mem_to_l1__valid ? STATE__ALLOCATE__WRITE_L1 : STATE__ALLOCATE__WAIT;
//         end
//         STATE__ALLOCATE__WRITE_L1:
//         begin
//             mem_to_l1__ready = 1'b1;

//             if (mem_to_l1__valid) begin
//                 rw_count += 1;
                
//             end
//         end








            

//             if (S0__rw) begin
//                 data_mem__rw = S0__valid;
//             end
//             data_mem__rw = S0__rw & S0__valid;
//             tag_mem__rw = S0__rw & S0__valid;
//             tag_mem__wr_data[29] = 1'b1;
//             state_n = (S1__ready & ) ? STATE__READ_WRITE;
//             end
//             else begin
                
//             end
//         end
//     endcase
// end





















// //==============================================
// // CPU to L1
// //==============================================
// always_ff @(posedge clk) begin
//     if (cpu_to_l1__valid & cpu_to_l1__ready) begin
//         addr <= cpu_to_l1__addr;
//         rw <= cpu_to_l1__rw;
//         wr_data <= cpu_to_l1__data;
//         type <= cpu_to_l1__type;
//     end
// end

// //==============================================
// // L1 to CPU
// //==============================================
// always_ff @(posedge clk) begin
//     if (cpu_to_l1__valid_n & cpu_to_l1__ready) begin
//         l1_to_cpu__data <= data_mem__rd_data;
//     end
// end







// logic hit;
// logic valid;
// logic dirty;
// logic flop_l1_to_mem_out;
// logic flop_l1_to_mem_in;
// logic l1_to_mem__valid_n;
// logic [63:0] l1_to_mem__addr_n;
// logic l1_to_mem__rw_n;
// logic [511:0] l1_to_mem__wr_data_n;
// logic [511:0] mem_data;

// assign valid = sram__rd_data[565];
// assign hit = valid & (sram__rd_data[563:512] == S0__addr[63:12]);
// assign dirty = sram__rd_data[564];
// assign sram__addr = S0__addr[11:6];













// assign S0__tag = S0__addr[39:12];
// assign S0__index = S0__addr[11:6];
// assign S0__block_offset = S0__addr[5:3];
// assign S0__byte_offset = S0__addr[2:0];

// assign S0__hit = (S0__tag = tag_mem__rd_data[27:0]) & tag_mem__rd_data[28];




// //==============================================
// // STAGE 1 (S1)
// //==============================================
// always_ff @(posedge clk) begin
//     if (rst) begin
//         S1__valid <= 1'b0;
//     end
//     else begin
//         S1__valid <= S1__ready ? S0__valid : S1__valid;
//     end
// end

// // S1 pipe stage (data).
// always_ff @(posedge clk) begin
//     if (S0__valid & S1__ready) begin
//         S1__addr <= S0__addr;
//         S1__rd_data <= S0__rd_data;
//     end
// end


// //==============================================
// // STAGE 1 (S1)
// //==============================================
// // S1 pipe stage (valid)
// always_ff @(posedge clk) begin
//     if (rst) begin
//         S1__valid <= 1'b0;
//     end
//     else begin
//         S1__valid <= S1__ready ? S0__valid : S1__valid;
//     end
// end

// // S1 pipe stage (data).
// always_ff @(posedge clk) begin
//     if (S0__valid & S1__ready) begin
//         S1__addr <= S0__addr;
//         S1__rd_data <= S0__rd_data;
//     end
// end


