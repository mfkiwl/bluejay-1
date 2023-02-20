//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    clk,
    rst,
    cpu_to_mem__valid,
    cpu_to_mem__we,
    cpu_to_mem__addr,
    cpu_to_mem__dtype,
    cpu_to_mem__data,
    mem_to_cpu__valid,
    mem_to_cpu__error,
    mem_to_cpu__data,
    cs,
    we,
    addr,
    size,
    wr_data,
    ready,
    rd_data,
    pmar__0,
    pmar__1,
    pmar__2,
    pmar__3,
    pmar__4,
    pmar__5,
    pmar__6,
    pmar__7
);

input clk;
input rst;

input cpu_to_mem__valid;
input cpu_to_mem__we;
input [63:0] cpu_to_mem__addr;
input [2:0] cpu_to_mem__dtype;
input [63:0] cpu_to_mem__data;

output mem_to_cpu__valid;
output mem_to_cpu__error;
output [63:0] mem_to_cpu__data;

output cs;
output we;
output [39:0] addr;
output [1:0] size;
output [63:0] wr_data;
input ready;
input [63:0] rd_data;

input pmar__0;
input pmar__1;
input pmar__2;
input pmar__3;
input pmar__4;
input pmar__5;
input pmar__6;
input pmar__7

logic clk;
logic rst;

logic cpu_to_mem__valid;
logic cpu_to_mem__we;
logic [63:0] cpu_to_mem__addr;
logic [2:0] cpu_to_mem__dtype;
logic [63:0] cpu_to_mem__data;

logic mem_to_cpu__valid;
logic mem_to_cpu__error;
logic [63:0] mem_to_cpu__data;

logic cs;
logic we;
logic [39:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic ready;
logic [63:0] rd_data;
logic [2:0] dtype;

logic pmar__0;
logic pmar__1;
logic pmar__2;
logic pmar__3;
logic pmar__4;
logic pmar__5;
logic pmar__6;
logic pmar__7

logic [63:0] rd_data__pre_sign_or_zero_extender;
logic [63:0] rd_data__post_sign_or_zero_extender;

logic [7:0] pmar;
logic [1:0] status;

logic [3:0] state;
logic [3:0] state__n;

//==============================
// physical_memory_attribute_checker__0
//==============================
physical_memory_attribute_checker physical_memory_attribute_checker__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]), 
    .dtype(dtype),
    .pmar(pmar),
    .status(status)
);


//==============================
// memory_management_unit__sign_or_zero_extender__0
//==============================
memory_management_unit__sign_or_zero_extender memory_management_unit__sign_or_zero_extender__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]), 
    .dtype(dtype),
    .data__in(rd_data__pre_sign_or_zero_extender),
    .data__out(rd_data__post_sign_or_zero_extender)
);


always_comb
begin
    casez (addr)
        MEMORY_MAPPED_REGION__0:
        begin
            pmar = pmar__0;
        end
        MEMORY_MAPPED_REGION__1:
        begin
            pmar = pmar__1;
        end
        MEMORY_MAPPED_REGION__2:
        begin
            pmar = pmar__2;
        end
        MEMORY_MAPPED_REGION__3:
        begin
            pmar = pmar__3;
        end
        MEMORY_MAPPED_REGION__4:
        begin
            pmar = pmar__4;
        end
        MEMORY_MAPPED_REGION__5:
        begin
            pmar = pmar__5;
        end
        MEMORY_MAPPED_REGION__6:
        begin
            pmar = pmar__6;
        end
        MEMORY_MAPPED_REGION__7:
        begin
            pmar = pmar__7;
        end
        default:
        begin
            pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__FIELD] = PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MEMORY_TYPE__IO;
            pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__BYTE_ACCESS_SUPPORTED__FIELD] = 1'b0;
            pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__HALF_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
            pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
            pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__DOUBLE_WORD_ACCESS_SUPPORTED__FIELD] = 1'b0;
            pmar[PHYSICAL_MEMORY_ATTRIBUTE_REGISTER__MISALIGNED_ACCESS_SUPPORTED__FIELD] = 1'b0;
        end
    endcase
end

always_comb
begin
    case (dtype)
        DTYPE__BYTE:
        begin
            size = SIZE__BYTE; 
        end
        DTYPE__BYTE_UNSIGNED:
        begin
            size = SIZE__BYTE; 
        end
        DTYPE__HALF_WORD:
        begin
            size = SIZE__HALF_WORD; 
        end
        DTYPE__HALF_WORD_UNSIGNED:
        begin
            size = SIZE__HALF_WORD; 
        end
        DTYPE__WORD:
        begin
            size = SIZE__WORD; 
        end
        DTYPE__WORD_UNSIGNED:
        begin
            size = SIZE__WORD; 
        end
        DTYPE__DOUBLE_WORD:
        begin
            size = SIZE__DOUBLE_WORD; 
        end
    endcase
end


localparam STATE__RESET = 4'h0;
localparam STATE__READY = 4'h1;
localparam STATE__PMA_CHECK = 4'h2;
localparam STATE__REQ = 4'h3;
localparam STATE__RESP = 4'h4;
localparam STATE__ACCESS_FAULT = 4'h5; 
localparam STATE__MISALIGNED_ADDRESS = 4'h6; 

always_comb
begin
    cs = 1'b0;
    mem_to_cpu__valid = 1'b0;
    mem_to_cpu__error = 1'b0; 
    mem_to_cpu__data = rd_data__post_sign_or_zero_extender;
        
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
            state__n = cpu_to_mem__valid ? STATE__PMA_CHECK : STATE__READY;
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
            cs = 1'b1;
            state__n = ready ? STATE__RESP : STATE__REQ;
        end
            
        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            mem_to_cpu__valid = 1'b1;
            mem_to_cpu__error = 1'b0;
            mem_to_cpu__data = rd_data__post_sign_or_zero_extender;
            state__n = STATE__READY; 
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


//==============================
// d_flip_flop__rd_data__pre_sign_or_zero_extender
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__rd_data__pre_sign_or_zero_extender
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(rd_data),
    .q(rd_data__pre_sign_or_zero_extender)
);


//==============================
// d_flip_flop__we
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__we
(
    .clk(clk),
    .rst(rst),
    .en(cpu_to_mem__valid),
    .d(cpu_to_mem__we),
    .q(we)
);

//==============================
// d_flip_flop__addr
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__addr
(
    .clk(clk),
    .rst(rst),
    .en(cpu_to_mem__valid),
    .d(cpu_to_mem__addr[39:0]),
    .q(addr)
);

//==============================
// d_flip_flop__dtype
//==============================
d_flip_flop #(.WIDTH(3)) d_flip_flop__dtype
(
    .clk(clk),
    .rst(rst),
    .en(cpu_to_mem__valid),
    .d(cpu_to_mem__dtype),
    .q(dtype)
);

//==============================
// d_flip_flop__wr_data
//==============================
d_flip_flop #(.WIDTH(3)) d_flip_flop__wr_data
(
    .clk(clk),
    .rst(rst),
    .en(cpu_to_mem__valid),
    .d(cpu_to_mem__data),
    .q(wr_data)
);

//==============================
// d_flip_flop__state
//==============================
d_flip_flop #(.WIDTH(4), .RESET_VALUE(STATE__RESET)) d_flip_flop__state
(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .d(state__n),
    .q(state)
);


endmodule

