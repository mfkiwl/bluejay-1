//==============================================
// platform_level_interrupt_controller__core
//==============================================
module platform_level_interrupt_controller__core
(
    clk,
    rst,
    cs,
    we,
    addr,
    wr_data,
    rd_data,
    request__0,
    request__1,
    complete__0,
    complete__1,
    context__0__eip
);

input clk;
input rst;
input cs;
input we;
input [25:0] addr;
input [31:0] wr_data;
output [31:0] rd_data;
input request__0;
input request__1;
output complete__0;
output complete__1;
output context__0__eip;

logic clk;
logic rst;
logic cs;
logic we;
logic [25:0] addr;
logic [31:0] wr_data;
logic [31:0] rd_data;
logic request__0;
logic request__1;
logic complete__0;
logic complete__1;
logic context__0__eip;

logic ip__0;
logic ip__1;

// Interrupt Source Priority - Source 0
logic [31:0] priority__0;
logic we__priority__0;
logic re__priority__0;
logic en__priority__0;

// Interrupt Source Priority - Source 1
logic [31:0] priority__1;
logic we__priority__1;
logic re__priority__1;
logic en__priority__1;

// Interrupt Pending Bits - Source 0-31
logic [31:0] ip__0_to_31;
logic we__ip__0_to_31;
logic re__ip__0_to_31;
logic en__ip__0_to_31;

// Interrupt Enable Bits - Context 0 - Source 0-31
logic [31:0] context__0__ie__0_to_31;
logic we__context__0__ie__0_to_31;
logic re__context__0__ie__0_to_31;
logic en__context__0__ie__0_to_31;
logic context__0__ie__0;
logic context__0__ie__1;

// Priority Threshold - Context 0 
logic [31:0] context__0__threshold;
logic we__context__0__threshold;
logic re__context__0__threshold;
logic en__context__0__threshold;

// Interrupt Claim/Complete - Context 0 
logic [31:0] context__0__claim_complete;
logic we__context__0__claim_complete;
logic re__context__0__claim_complete;
logic en__context__0__claim_complete;

// Interrupt Claim/Complete - Combined
logic we__context__x__claim_complete;
logic re__context__x__claim_complete;
logic claim__0;
logic claim__1;

logic [9:0] context__0__priority_mux__0__id;
logic context__0__priority_mux__0__ie;
logic context__0__priority_mux__0__ip;
logic [31:0] context__0__priority_mux__0__priority;


assign ip__0 = 1'b0;

//==============================================
// sr_flip_flop__ip__1
//==============================================
sr_flip_flop sr_flip_flop__ip__1 
(
    .clk(clk),
    .s(request__1),
    .r(claim__1 || rst),
    .q(ip__1)
);


//==============================
//  context__0__mux__0
//==============================
platform_level_interrupt_controller__priority_mux context__0__priority_mux__0
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
    .id__c(context__0__priority_mux__0__id),
    .ie__c(context__0__priority_mux__0__ie),
    .ip__c(context__0__priority_mux__0__ip),
    .priority__c(context__0__priority_mux__0__priority)
);

assign context__0__id = context__0__priority_mux__0__id;
assign context__0__priority = context__0__priority_mux__0__priority;
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
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_SOURCE_PRIORITY__0:
        begin
            rd_data = priority__0; 
            we__priority__0 = we;            
            re__priority__0 = ~we;            
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_SOURCE_PRIORITY__1:
        begin
            rd_data = priority__1; 
            we__priority__1 = we;            
            re__priority__1 = ~we;            
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__INTERRUPT_PENDING_BITS__0_TO_31:
        begin
            rd_data = ip__0_to_31;
            we__ip__0_to_31 = we;
            re__ip__0_to_31 = ~we;
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_ENABLE_BITS__0_TO_31:
        begin
            rd_data = context__0__ie__0_to_31;
            we__context__0__ie__0_to_31 = we;
            re__context__0__ie__0_to_31 = ~we;
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__PRIORITY_THRESHOLD:
        begin
            rd_data = context__0__threshold;
            we__context__0__threshold = we;
            re__context__0__threshold = ~we;
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__INTERRUPT_CLAIM_COMPLETE:
        begin
            rd_data = context__0__claim_complete;
            we__context__0__claim_complete = we;
            re__context__0__claim_complete = ~we;
        end
    endcase
end


//==============================================
// Interrupt Source Priority - Source 0
//==============================================
assign priority__0 = 32'h0;


//==============================================
// Interrupt Source Priority - Source 1
//==============================================
assign priority__1 = 32'h1;


//==============================================
// Interrupt Pending Bits - Source 0-31
//==============================================
assign ip__0_to_31[0] = ip__0;
assign ip__0_to_31[1] = ip__1;
assign ip__0_to_31[31:2] = 0;


//==============================================
// Interrupt Enable Bits - Context 0 - Source 0-31
//==============================================
assign context__0__ie__0_to_31[0] = context__0__ie__0;
assign context__0__ie__0_to_31[1] = context__0__ie__1;
assign context__0__ie__0_to_31[31:2] = 0;

assign en__context__0__ie__0_to_31 = cs & we__context__0__ie__0_to_31;

assign context__0__ie__0 = 1'b0;

//==============================
// d_flip_flop__context__0__ie__1
//==============================
d_flip_flop #(.WIDTH(1), .RESET_VALUE(1'b0)) d_flip_flop__context__0__ie__1
(
    .clk(clk),
    .rst(rst),
    .en(en__context__0__ie__0_to_31),
    .d(wr_data[1]),
    .q(context__0__ie__1)
);


//==============================================
// Priority Threshold - Context 0 
//==============================================
assign en__context__0__threshold = cs & we__context__0__threshold;

//==============================
// d_flip_flop__context__0__threshold
//==============================
d_flip_flop #(.WIDTH(32), .RESET_VALUE(32'h0)) d_flip_flop__context__0__threshold
(
    .clk(clk),
    .rst(rst),
    .en(en__context__0__threshold),
    .d(wr_data),
    .q(context__0__threshold)
);


//==============================================
// Interrupt Claim/Complete - Context 0 
//==============================================
assign context__0__claim_complete[9:0] = context__0__id;
assign context__0__claim_complete[31:10] = 22'h0;




assign re__context__x__claim_complete = re__context__0__claim_complete; 
assign we__context__x__claim_complete = we__context__0__claim_complete;

always_comb
begin
    claim__0 = 1'b0; 
    claim__1 = 1'b0; 

    case (rd_data[9:0]) 
        10'h0:
        begin
            claim__0 = cs & re__context__x__claim_complete;
        end
        10'h1:
        begin
            claim__1 = cs & re__context__x__claim_complete;
        end
    endcase
end

always_comb
begin
    complete__0 = 1'b0; 
    complete__1 = 1'b0; 

    case (wr_data[9:0]) 
        10'h0:
        begin
            complete__0 = cs & we__context__x__claim_complete;
        end
        10'h1:
        begin
            complete__1 = cs & we__context__x__claim_complete;
        end
    endcase
end


endmodule
