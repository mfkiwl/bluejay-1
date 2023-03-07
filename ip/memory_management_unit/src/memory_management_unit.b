//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    clk,
    rst,
    cpu_to_mmu__cs,
    cpu_to_mmu__we,
    cpu_to_mmu__addr,
    cpu_to_mmu__size,
    cpu_to_mmu__wr_data,
    cpu_to_mmu__ready,
    cpu_to_mmu__resp,
    cpu_to_mmu__rd_data,
    mmu_to_bus__cs,
    mmu_to_bus__we,
    mmu_to_bus__addr,
    mmu_to_bus__size,
    mmu_to_bus__wr_data,
    mmu_to_bus__ready,
    mmu_to_bus__resp,
    mmu_to_bus__rd_data,
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

input cpu_to_mmu__cs;
input cpu_to_mmu__we;
input [63:0] cpu_to_mmu__addr;
input [1:0] cpu_to_mmu__size;
input [63:0] cpu_to_mmu__wr_data;
output cpu_to_mmu__ready;
output cpu_to_mmu__resp;
output [63:0] cpu_to_mmu__rd_data;

output mmu_to_bus__cs;
output mmu_to_bus__we;
output [39:0] mmu_to_bus__addr;
output [1:0] mmu_to_bus__size;
output [63:0] mmu_to_bus__wr_data;
input mmu_to_bus__ready;
input mmu_to_bus__resp;
input [63:0] mmu_to_bus__rd_data;

input [7:0] pmar__0;
input [7:0] pmar__1;
input [7:0] pmar__2;
input [7:0] pmar__3;
input [7:0] pmar__4;
input [7:0] pmar__5;
input [7:0] pmar__6;
input [7:0] pmar__7;

logic clk;
logic rst;

logic we;
logic [39:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic [63:0] rd_data;

logic cpu_to_mmu__cs;
logic cpu_to_mmu__we;
logic [63:0] cpu_to_mmu__addr;
logic [1:0] cpu_to_mmu__size;
logic [63:0] cpu_to_mmu__wr_data;
logic cpu_to_mmu__ready;
logic cpu_to_mmu__resp;
logic [63:0] cpu_to_mmu__rd_data;

logic mmu_to_bus__cs;
logic mmu_to_bus__we;
logic [39:0] mmu_to_bus__addr;
logic [1:0] mmu_to_bus__size;
logic [63:0] mmu_to_bus__wr_data;
//logic mmu_to_bus__ready;
//logic mmu_to_bus__resp;
//logic [63:0] mmu_to_bus__rd_data;

logic [7:0] pmar__0;
logic [7:0] pmar__1;
logic [7:0] pmar__2;
logic [7:0] pmar__3;
logic [7:0] pmar__4;
logic [7:0] pmar__5;
logic [7:0] pmar__6;
logic [7:0] pmar__7;

logic [7:0] pmar;
logic [1:0] status;

logic [3:0] state;
logic [3:0] state__n;

logic en__a;
logic en__b;

//==============================
// physical_memory_attribute_checker__0
//==============================
physical_memory_attribute_checker physical_memory_attribute_checker__0
(
    .clk(clk),
    .rst(rst),
    .addr(addr[2:0]), 
    .size(size),
    .pmar(pmar),
    .status(status)
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

assign mmu_to_bus__we = we;
assign mmu_to_bus__addr = addr;
assign mmu_to_bus__size = size;
assign mmu_to_bus__wr_data = wr_data;

localparam STATE__RESET = 4'h0;
localparam STATE__READY = 4'h1;
localparam STATE__PMA_CHECK = 4'h2;
localparam STATE__REQ = 4'h3;
localparam STATE__RESP = 4'h4;
localparam STATE__ACCESS_FAULT = 4'h5; 
localparam STATE__MISALIGNED_ADDRESS = 4'h6; 


always_comb
begin
    case (state)
        //==============================
        // STATE__RESET
        //==============================
        STATE__RESET:
        begin
            cpu_to_mmu__ready = 1'b0;
            cpu_to_mmu__resp = 1'b0;
            cpu_to_mmu__rd_data = rd_data;
            mmu_to_bus__cs = 1'b0;
            en__a = 1'b0;
            en__b = 1'b0;
            state__n = STATE__READY;
        end

        //==============================
        // STATE__READY
        //==============================
        STATE__READY:
        begin
            cpu_to_mmu__ready = 1'b0;
            cpu_to_mmu__resp = 1'b0;
            cpu_to_mmu__rd_data = rd_data;
            mmu_to_bus__cs = 1'b0;
            //en__a = 1'b0;
            en__b = 1'b0;
            en__a = cpu_to_mmu__cs;
            state__n = cpu_to_mmu__cs ? STATE__PMA_CHECK : STATE__READY;
        end

        //==============================
        // STATE__PMA_CHECK
        //==============================
        STATE__PMA_CHECK:
        begin
            cpu_to_mmu__ready = 1'b0;
            cpu_to_mmu__resp = 1'b0;
            cpu_to_mmu__rd_data = rd_data;
            mmu_to_bus__cs = 1'b0;
            en__a = 1'b0;
            en__b = 1'b0;
            state__n = (status == PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT) ? STATE__ACCESS_FAULT : (status == PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS) ? STATE__MISALIGNED_ADDRESS : STATE__REQ;
        end

        //==============================
        // STATE__REQ
        //==============================
        STATE__REQ:
        begin
            cpu_to_mmu__ready = 1'b0;
            cpu_to_mmu__resp = 1'b0;
            cpu_to_mmu__rd_data = rd_data;
            //mmu_to_bus__cs = 1'b0;
            en__a = 1'b0;
            //en__b = 1'b0;
            mmu_to_bus__cs = 1'b1;
            en__b = mmu_to_bus__ready;
            state__n = mmu_to_bus__ready ? STATE__RESP : STATE__REQ;
        end
            
        //==============================
        // STATE__RESP
        //==============================
        STATE__RESP:
        begin
            //cpu_to_mmu__ready = 1'b0;
            //cpu_to_mmu__resp = 1'b0;
            //cpu_to_mmu__rd_data = rd_data;
            mmu_to_bus__cs = 1'b0;
            en__a = 1'b0;
            en__b = 1'b0;
            cpu_to_mmu__ready = 1'b1;
            cpu_to_mmu__resp = 1'b0;
            cpu_to_mmu__rd_data = rd_data;
            state__n = STATE__READY; 
        end

        //==============================
        // STATE__ACCESS_FAULT
        //==============================
        STATE__ACCESS_FAULT:
        begin
            //cpu_to_mmu__ready = 1'b0;
            //cpu_to_mmu__resp = 1'b0;
            //cpu_to_mmu__rd_data = rd_data;
            mmu_to_bus__cs = 1'b0;
            en__a = 1'b0;
            en__b = 1'b0;
            cpu_to_mmu__ready = 1'b1;
            cpu_to_mmu__resp = 1'b1;
            cpu_to_mmu__rd_data = ERRORCODE__ACCESS_FAULT;
            state__n = STATE__READY;
        end

        //==============================
        // STATE__MISALIGNED_ADDRESS
        //==============================
        STATE__MISALIGNED_ADDRESS:
        begin
            //cpu_to_mmu__ready = 1'b0;
            //cpu_to_mmu__resp = 1'b0;
            //cpu_to_mmu__rd_data = rd_data;
            mmu_to_bus__cs = 1'b0;
            en__a = 1'b0;
            en__b = 1'b0;
            cpu_to_mmu__ready = 1'b1;
            cpu_to_mmu__resp = 1'b1;
            cpu_to_mmu__rd_data = ERRORCODE__MISALIGNED_ADDRESS;
            state__n = STATE__READY;
        end
    endcase
end


//always_comb
//begin
//    cpu_to_mmu__ready = 1'b0;
//    cpu_to_mmu__resp = 1'b0;
//    cpu_to_mmu__rd_data = rd_data;
//    mmu_to_bus__cs = 1'b0;
//    en__a = 1'b0;
//    en__b = 1'b0;
//        
//    case (state)
//        //==============================
//        // STATE__RESET
//        //==============================
//        STATE__RESET:
//        begin
//            state__n = STATE__READY;
//        end
//
//        //==============================
//        // STATE__READY
//        //==============================
//        STATE__READY:
//        begin
//            en__a = cpu_to_mmu__cs;
//            state__n = cpu_to_mmu__cs ? STATE__PMA_CHECK : STATE__READY;
//        end
//
//        //==============================
//        // STATE__PMA_CHECK
//        //==============================
//        STATE__PMA_CHECK:
//        begin
//            state__n = (status == PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__ACCESS_FAULT) ? STATE__ACCESS_FAULT : (status == PHYSICAL_MEMORY_ATTRIBUTE_CHECKER__STATUS__MISALIGNED_ADDRESS) ? STATE__MISALIGNED_ADDRESS : STATE__REQ;
//        end
//
//        //==============================
//        // STATE__REQ
//        //==============================
//        STATE__REQ:
//        begin
//            mmu_to_bus__cs = 1'b1;
//            en__b = mmu_to_bus__ready;
//            state__n = mmu_to_bus__ready ? STATE__RESP : STATE__REQ;
//        end
//            
//        //==============================
//        // STATE__RESP
//        //==============================
//        STATE__RESP:
//        begin
//            cpu_to_mmu__ready = 1'b1;
//            cpu_to_mmu__resp = 1'b0;
//            cpu_to_mmu__rd_data = rd_data;
//            state__n = STATE__READY; 
//        end
//
//        //==============================
//        // STATE__ACCESS_FAULT
//        //==============================
//        STATE__ACCESS_FAULT:
//        begin
//            cpu_to_mmu__ready = 1'b1;
//            cpu_to_mmu__resp = 1'b1;
//            cpu_to_mmu__rd_data = ERRORCODE__ACCESS_FAULT;
//            state__n = STATE__READY;
//        end
//
//        //==============================
//        // STATE__MISALIGNED_ADDRESS
//        //==============================
//        STATE__MISALIGNED_ADDRESS:
//        begin
//            cpu_to_mmu__ready = 1'b1;
//            cpu_to_mmu__resp = 1'b1;
//            cpu_to_mmu__rd_data = ERRORCODE__MISALIGNED_ADDRESS;
//            state__n = STATE__READY;
//        end
//    endcase
//end

//==============================
// d_flip_flop__we
//==============================
d_flip_flop #(.WIDTH(1)) d_flip_flop__we
(
    .clk(clk),
    .rst(rst),
    .en(en__a),
    .d(cpu_to_mmu__we),
    .q(we)
);

//==============================
// d_flip_flop__addr
//==============================
d_flip_flop #(.WIDTH(40)) d_flip_flop__addr
(
    .clk(clk),
    .rst(rst),
    .en(en__a),
    .d(cpu_to_mmu__addr[39:0]),
    .q(addr)
);

//==============================
// d_flip_flop__size
//==============================
d_flip_flop #(.WIDTH(2)) d_flip_flop__size
(
    .clk(clk),
    .rst(rst),
    .en(en__a),
    .d(cpu_to_mmu__size),
    .q(size)
);

//==============================
// d_flip_flop__wr_data
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__wr_data
(
    .clk(clk),
    .rst(rst),
    .en(en__a),
    .d(cpu_to_mmu__wr_data),
    .q(wr_data)
);

//==============================
// d_flip_flop__rd_data
//==============================
d_flip_flop #(.WIDTH(64)) d_flip_flop__rd_data
(
    .clk(clk),
    .rst(rst),
    .en(en__b),
    .d(mmu_to_bus__rd_data),
    .q(rd_data)
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

