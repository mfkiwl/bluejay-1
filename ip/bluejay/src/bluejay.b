//==============================================
// bluejay 
//==============================================
module bluejay 
(
    input clk,
    input rst,
    output logic cs,
    output logic we,
    output logic [39:0] addr,
    output logic [1:0] size,
    output logic [63:0] wr_data,
    input ready,
    input resp,
    input [63:0] rd_data,
    input irq__1
);


logic sip;
logic tip;
logic context__0__eip;

logic jay_to_jbus__cs,
logic jay_to_jbus__we,
logic [39:0] jay_to_jbus__addr,
logic [1:0] jay_to_jbus__size,
logic [63:0] jay_to_jbus__wr_data,
logic jay_to_jbus__ready,
logic jay_to_jbus__resp,
logic [63:0] jay_to_jbus__rd_data,

PYTHON
(
    for i in range(JBUS__NUMBER_OF_REGIONS):
        print(f"logic cs__{i};")
        print(f"logic we__{i};")
        print(f"logic [39:0] addr__{i};")
        print(f"logic [1:0] size__{i};")
        print(f"logic [63:0] wr_data__{i};")
        print(f"logic ready__{i};")
        print(f"logic resp__{i};")
        print(f"logic [63:0] rd_data__{i};")
        print(f"logic [7:0] pma__{i};")
)

assign cs = cs__0;
assign we = we__0;
assign addr = addr__0;
assign size = size__0;
assign wr_data = wr_data__0; 
assign ready__0 = ready;
assign resp__0 = resp,
assign rd_data__0 = rd_data,

//==============================
// jay__0 
//==============================
jay jay__0 
(
    .clk(clk),
    .rst(rst),
    .cs(jay_to_jbus__cs),
    .we(jay_to_jbus__we),
    .addr(jay_to_jbus__addr),
    .size(jay_to_jbus__size),
    .wr_data(jay_to_jbus__wr_data),
    .ready(jay_to_jbus__ready),
    .resp(jay_to_jbus__resp),
    .rd_data(jay_to_jbus__rd_data),
    .sip(sip),
    .tip(tip),
    .eip(context__0__eip)
);

//==============================
// jbus__0
//==============================
jbus jbus__0
(
    .clk(clk),
    .rst(rst),
PYTHON                                                                                                                                                                                                         
(
    for i in range(JBUS__NUMBER_OF_REGIONS):
        print(f"    .cs__{i}(cs__{i}),")
        print(f"    .we__{i}(we__{i}),")
        print(f"    .addr__{i}(addr__{i}),")
        print(f"    .size__{i}(size__{i}),")
        print(f"    .wr_data__{i}(wr_data__{i}),")
        print(f"    .ready__{i}(ready__{i}),")
        print(f"    .rd_data__{i}(rd_data__{i}),")
        print(f"    .pma__{i}(pma__{i}),")
)
    .cs(jay_to_jbus__cs),
    .we(jay_to_jbus__we),
    .addr(jay_to_jbus__addr),
    .size(jay_to_jbus__size),
    .wr_data(jay_to_jbus__wr_data),
    .ready(jay_to_jbus__ready),
    .resp(jay_to_jbus__resp),
    .rd_data(jay_to_jbus__rd_data)
);

//==============================================
// machine_timer_registers__0 
//==============================================
machine_timer_registers machine_timer_registers__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cs__1),
    .we(we__1),
    .addr(addr__1[3:0]),
    .wr_data(wr_data__1),
    .ready(ready__1),
    .resp(resp__1),
    .rd_data(rd_data__1),
    .tip(tip)
);

//==============================================
// software_interrupt_registers__0 
//==============================================
software_interrupt_registers software_interrupt_registers__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__2),
    .we(we__2),
    .wr_data(wr_data__2),
    .ready(ready__2),
    .resp(resp__2),
    .rd_data(rd_data__2),
    .sip(sip)
);

//==============================================
// platform_level_interrupt_controller__0
//==============================================
platform_level_interrupt_controller platform_level_interrupt_controller__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__3),
    .we(we__3),
    .addr(addr__3[25:0]),
    .wr_data(wr_data__3[31:0]),
    .ready(ready__3),
    .resp(resp__3),
    .rd_data(rd_data__3[31:0]),
    .irq__0(),
    .irq__1(irq__1),
    .context__0__eip(context__0__eip)
);

endmodule

