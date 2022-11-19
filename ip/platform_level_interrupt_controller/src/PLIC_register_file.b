//==============================================
// PLIC_register_file 
//==============================================
module PLIC_register_file
(
    clk,
    rst,
    ce,
    rw,
    addr,
    wr_data,
    rd_data,
    priority__0,
    priority__1,
);

input clk;
input rst;
input ce;
input rw;
input [25:0] addr;
input [31:0] wr_data;
output [31:0] rd_data;
output [31:0] priority__0;
output [31:0] priority__1;


logic clk;
logic rst;
logic ce;
logic rw;
logic [25:0] addr;
logic [31:0] wr_data;
logic [31:0] rd_data;

logic ir__0;
logic ir__1;


logic ip__0;
logic ip__1;


assign ip__0 = 1'b0;

//==============================
// sr_flip_flop__ip__1
//==============================
sr_flip_flop sr_flip_flop__ip__1
(
    .clk(clk),
    .s(ir__1),
    .r(claim__1 || rst),
    .q(ip__1)
)





//==============================
// d_flip_flop__ip__1
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__ip__1
(
    .clk(clk),
    .rst(rst),
    .en(ir__1),
    .d(1'b1),
    .q(context__0__ie__1),
)







logic context__0__eip;
logic [9:0] context__0__id;

//==============================
//  context__0__mux__0
//==============================
PLIC_mux context__0__mux__0
(
    .clk(clk),
    .rst(rst),
    .id__a(10'h0),
    .ie__a(context__0__ie__0),
    .ip__a(ip__0),
    .priority__a(priority__0),
    .id__b(10'h1),
    .ie__b(context__0__ie__1),
    .ip__b(ip__1),
    .priority__b(priority__1),
    .id__c(context__0__id),
    .ie__c(),
    .ip__c(),
    .priority__c(context__0__priority)
);

assign context__0__eip = (context__0__priority > context__0__threshold);


always_comb
begin
    rd_data = 32'h0;
    we__priority__0 = 1'b0;
    re__priority__0 = 1'b0;
    we__priority__1 = 1'b0;
    re__priority__1 = 1'b0;
    we__ip__0_to_31 = 1'b0;
    re__ip__0_to_31 = 1'b0;
    we__context__0__ie__0_to_31 = 1'b0;
    re__context__0__ie__0_to_31 = 1'b0;
    we__context__0__threshold = 1'b0;
    re__context__0__threshold = 1'b0;
    we__context__0__claim_complete = 1'b0;
    re__context__0__claim_complete = 1'b0;

    case (addr)
        PLIC__MEMORY_MAP__INTERRUPT_SOURCE_PRIORITY__0:
        begin
            rd_data = priority__0; 
            we__priority__0 = ce & rw;            
            re__priority__0 = ce & ~rw;            
        end
        PLIC__MEMORY_MAP__INTERRUPT_SOURCE_PRIORITY__1:
        begin
            rd_data = priority__1; 
            we__priority__1 = ce & rw;            
            re__priority__1 = ce & ~rw;            
        end
        PLIC__MEMORY_MAP__INTERRUPT_PENDING_BITS__0_TO_31:
        begin
            rd_data = ip__0_to_31;
            we__ip__0_to_31 = ce & rw;
            re__ip__0_to_31 = ce & ~rw;
        end
        PLIC__MEMORY_MAP__INTERRUPT_ENABLE_BITS__0_TO_31__CONTEXT__0:
        begin
            rd_data = context__0__ie__0_to_31;
            we__context__0__ie__0_to_31 = ce & rw;
            re__context__0__ie__0_to_31 = ce & ~rw;
        end
        PLIC__MEMORY_MAP__PRIORITY_THRESHOLD__CONTEXT__0:
        begin
            rd_data = context__0__threshold;
            we__context__0__threshold = ce & rw;
            re__context__0__threshold = ce & ~rw;
        end
        PLIC__MEMORY_MAP__INTERRUPT_CLAIM_COMPLETE__CONTEXT__0:
        begin
            rd_data = context__0__claim_complete;
            we__context__0__claim_complete = ce & rw;
            re__context__0__claim_complete = ce & ~rw;
        end
    endcase
end




//==============================================
// Interrupt Source Priority - Source 0
//==============================================
logic [31:0] priority__0;
logic we__priority__0;
logic re__priority__0;

assign priority__0 = 32'h0;


//==============================================
// Interrupt Source Priority - Source 1
//==============================================
logic [31:0] priority__1;
logic we__priority__1;
logic re__priority__1;

assign priority__1 = 32'h1;


//==============================================
// Interrupt Pending Bits - Source 0-31
//==============================================
logic [31:0] ip__0_to_31;
logic we__ip__0_to_31;
logic re__ip__0_to_31;

assign ip__0_to_31[0] = ip__0;
assign ip__0_to_31[1] = ip__1;
assign ip__0_to_31[31:2] = 0;


//==============================================
// Interrupt Enable Bits - Context 0 - Source 0-31
//==============================================
logic [31:0] context__0__ie__0_to_31;
logic we__context__0__ie__0_to_31;
logic re__context__0__ie__0_to_31;

assign context__0__ie__0_to_31[0] = context__0__ie__0;
assign context__0__ie__0_to_31[1] = context__0__ie__1;
assign context__0__ie__0_to_31[31:2] = 0;


logic context__0__ie__0;
logic context__0__ie__1;

assign context__0__ie__0 = 1'b0;

//==============================
// d_flip_flop__context__0__ie__1
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b1)) d_flip_flop__context__0__ie__1
(
    .clk(clk),
    .rst(rst),
    .en(we__context__0__ie__0_to_31),
    .d(wr_data[1]),
    .q(context__0__ie__1),
)


//==============================================
// Priority Threshold - Context 0 
//==============================================
logic [31:0] context__0__threshold;
logic we__context__0__threshold;
logic re__context__0__threshold;

assign threshold__context__0 = 32'h0;

//==============================
// d_flip_flop__context__0__threshold
//==============================
d_flip_flop #(.WIDTH(32), .RESET_VALUE(32'h0)) d_flip_flop__context__0__threshold
(
    .clk(clk),
    .rst(rst),
    .en(we__context__0__threshold),
    .d(wr_data),
    .q(context__0__threshold),
)


//==============================================
// Interrupt Claim/Complete - Context 0 
//==============================================
logic [31:0] context__0__claim_complete;
logic we__context__0__claim_complete;
logic re__context__0__claim_complete;

assign context__0__claim_complete = context__0__id;


endmodule
