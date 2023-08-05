//==============================================
// platform_level_interrupt_controller__core
//==============================================
module platform_level_interrupt_controller__core
(
    input clk,
    input rst,
    input cs,
    input we,
    input [25:0] addr,
    input [31:0] wr_data,
    output logic ready,
    output logic resp,
    output logic [31:0] rd_data,
    input request__1,
    output logic complete__1,
    output logic context__0__eip
);


// Interrupt Source Priority - Source 1
logic [31:0] priority__1;
logic en__priority__1;

// Interrupt Pending Bits - Source 0-31
logic [31:0] ip__0_to_31;
logic ip__0_to_31__ip__0;
logic ip__0_to_31__ip__1;

// Interrupt Enable Bits - Context 0 - Source 0-31
logic [31:0] context__0__ie__0_to_31;
logic en__context__0__ie__0_to_31;
logic context__0__ie__0_to_31__ie__0;
logic context__0__ie__0_to_31__ie__1;

// Priority Threshold - Context 0 
logic [31:0] context__0__thrsh;
logic en__context__0__thres;

// Interrupt Claim/Complete - Context 0 
logic [31:0] context__0__clmcmpl;
logic en__context__0__clmcmpl;

logic claim__1;

always_comb
begin
    ready = 1'b1;
    resp = 1'b0;
    rd_data = 32'h0;
    en__priority__1 = 1'b0;
    en__context__0__ie__0_to_31 = 1'b0;
    en__context__0__thrsh = 1'b0;
    en__context__0__clmcmpl = 1'b0;
    re__clmcmpl = 1'b0;
    we__clmcmpl = 1'b0;

    case (addr)
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__PRIORITY__1:
        begin
            rd_data = priority__1; 
            en__priority__1 = cs & we;
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__IP__0_TO_31:
        begin
            rd_data = ip__0_to_31;
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__IE__0_TO_31:
        begin
            rd_data = context__0__ie__0_to_31;
            en__context__0__ie__0_to_31 = cs & we;
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__THRSH:
        begin
            rd_data = context__0__thrsh;
            en__context__0__thrsh = cs & we;
        end
        PLATFORM_LEVEL_INTERRUPT_CONTROLLER__CONTEXT__0__CLMCMPL:
        begin
            rd_data = context__0__clmcmpl;
            we__clmcmpl = cs & we;
            re__clmcmpl = cs & ~we;
        end
        default:
        begin
            resp = cs;
            rd_data = ERRORCODE__ACCESS_FAULT;
        end
    endcase
end

assign claim__1 = re__clmcmpl & (rd_data[9:0] == 10'h1);
assign complete__1 = we__clmcmpl & (wr_data[9:0] == 10'h1);

//==============================
// context__0__funnel 
//==============================
platform_level_interrupt_controller__funnel context__0__funnel
(
    .clk(clk),
    .rst(rst),
PYTHON
(
    for i in range(PLATFORM_LEVEL_INTERRUPT_CONTROLLER__NUMBER_OF_INTERRUPT_SOURCES):
        print(f".id__{i}(10'h{x:i}),")
        print(f".ip__{i}(ip__0_to_31__ip__{i}),")
        print(f".ie__{i}(context__0__ie__0_to_31__ie__{i}),")
        if i == 0:
            print(f".priority__{i}(32'h0),")
        else:
            print(f".priority__{i}(priority__{i}),")
)
    .id(context__0__id),
    .ip(),
    .ie(),
    .priority(context__0__priority)
);

assign context__0__eip = context__0__priority > context__0__thrsh;

//==============================
// platform_level_interrupt_controller__priority__1
//==============================
platform_level_interrupt_controller__priority platform_level_interrupt_controller__priority__1
(
    .clk(clk),
    .rst(rst),
    .en(en__priority__1),
    .wr_data(wr_data),
    .priority(priority__1)
)

//==============================
// platform_level_interrupt_controller__ip__0_to_31
//==============================
platform_level_interrupt_controller__ip platform_level_interrupt_controller__ip__0_to_31
(
    .clk(clk),
    .rst(rst),
PYTHON
(
    for i in range(32):
        if i == 0:
            print(f"    .request__{i}(1'b0),")
            print(f"    .claim__{i}(),")
        else
            print(f"    .request__{i}(request__{i}),")
            print(f"    .claim__{i}(claim__{i}),")
)
    .ip(ip__0_to_31)
)

//==============================
// platform_level_interrupt_controller__context__0__ie__0_to_31
//==============================
platform_level_interrupt_controller__ie platform_level_interrupt_controller__context__0__ie__0_to_31
(
    .clk(clk),
    .rst(rst),
    .en(en__context__0__ie__0_to_31),
    .wr_data(wr_data),
    .ie(context__0__ie__0_to_31)
)

//==============================
// platform_level_interrupt_controller__context__0__thrsh
//==============================
platform_level_interrupt_controller__thrsh platform_level_interrupt_controller__context__0__thrsh
(
    .clk(clk),
    .rst(rst),
    .en(en__context__0__thrsh),
    .wr_data(wr_data),
    .thrsh(context__0__thrsh)
)

//==============================
// platform_level_interrupt_controller__context__0__clmcmpl
//==============================
platform_level_interrupt_controller__clmcmpl platform_level_interrupt_controller__context__0__clmcmpl
(
    .clk(clk),
    .rst(rst),
    .id(context__0__id),
    .clmcmpl(context__0__clmcmpl)
)


endmodule


