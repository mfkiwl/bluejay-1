//==============================================
// bluejay 
//==============================================
module bluejay 
(
    input clk,
    input rst,
    output logic cs,
    output logic we,
    output logic [63:0] addr,
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


logic cs;
logic we;
logic [39:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic ready;
logic resp;
logic [63:0] rd_data;


assign cs = cs__3 | cs__4;
assign ready__3 = ready;
assign ready__4 = ready;
assign rd_data__3 = rd_data;
assign rd_data__4 = rd_data;


PYTHON
(
    for i in range(8):
        print(f"logic cs__{i};")
        print(f"logic we__{i};")
        print(f"logic [39:0] addr__{i};")
        print(f"logic [1:0] size__{i};")
        print(f"logic [63:0] wr_data__{i};")
        print(f"logic ready__{i};")
        print(f"logic [63:0] rd_data__{i};")
        print(f"logic [7:0] pma__{i};")
)

assign ready__1 = 1'b1;
assign ready__2 = 1'b1;
assign ready__3 = 1'b1;
assign ready__4 = 1'b1;
assign ready__5 = 1'b1;
assign ready__6 = 1'b1;
assign ready__7 = 1'b1;

//==============================
// jay__0 
//==============================
jay jay__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cs),
    .we(we),
    .addr(addr),
    .size(size),
    .wr_data(wr_data),
    .ready(ready),
    .resp(resp),
    .rd_data(rd_data),
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
    for i in range(8):
        print(f"    .cs__{i}(cs__{i}),")
        print(f"    .we__{i}(we__{i}),")
        print(f"    .addr__{i}(addr__{i}),")
        print(f"    .size__{i}(size__{i}),")
        print(f"    .wr_data__{i}(wr_data__{i}),")
        print(f"    .ready__{i}(ready__{i}),")
        print(f"    .rd_data__{i}(rd_data__{i}),")
        print(f"    .pma__{i}(pma__{i}),")
)
    .cs(cs),
    .we(we),
    .addr(addr),
    .size(size),
    .wr_data(wr_data),
    .ready(ready),
    .resp(resp),
    .rd_data(rd_data)
);

//==============================================
// machine_timer_registers__0 
//==============================================
machine_timer_registers machine_timer_registers__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cs__0),
    .we(we__0),
    .addr(addr__0[3:0]),
    .wr_data(wr_data__0),
    .rd_data(rd_data__0),
    .tip(tip)
);

//==============================================
// software_interrupt_registers__0 
//==============================================
software_interrupt_registers software_interrupt_registers__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__1),
    .we(we__1),
    .wr_data(wr_data__1),
    .rd_data(rd_data__1),
    .sip(sip)
);

//==============================================
// platform_level_interrupt_controller__0
//==============================================
platform_level_interrupt_controller platform_level_interrupt_controller__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__0),
    .we(we__0),
    .addr(addr__0[25:0]),
    .wr_data(wr_data__0[31:0]),
    .rd_data(rd_data__0[31:0]),
    .irq__0(),
    .irq__1(irq__1),
    .context__0__eip(context__0__eip)
);



//==============================
// physical_memory_attribute_registers__0
//==============================
physical_memory_attribute_registers physical_memory_attribute_registers__0
(   
    .clk(clk),
    .rst(rst),
    .cs(cs__2),
    .we(we__2),
    .addr(addr__2[2:0]),
    .wr_data(wr_data__2[7:0]),
    .rd_data(rd_data__2[7:0]),
    .pma__0(pma__0),
    .pma__1(pma__1),
    .pma__2(pma__2),
    .pma__3(pma__3),
    .pma__4(pma__4),
    .pma__5(pma__5),
    .pma__6(pma__6),
    .pma__7(pma__7)
);

endmodule

