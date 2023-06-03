//==============================================
// jay 
//==============================================
module jay 
(
    input clk,
    input rst,
    inout [7:0] port__0,
    inout [7:0] port__1,
    inout [7:0] port__2,
    inout [7:0] port__3,
    output logic ena,
    output logic [7:0] wea,
    output logic [11:0] addra, 
    output logic [63:0] dina,
    input [63:0] douta,
    input int__1,
    output logic pwm
);


logic context__0__eip;

logic tip;


logic cs;
logic we;
logic [39:0] addr;
logic [1:0] size;
logic [63:0] wr_data;
logic ready;
logic resp;
logic [63:0] rd_data;

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
// central_processing_unit__0
//==============================
central_processing_unit central_processing_unit__0 
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
    .eip(context__0__eip),
    .tip(tip)
);

//==============================
// memory_management_unit__0
//==============================
memory_management_unit memory_management_unit__0
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



//==============================
// memory_controller__0
//==============================
memory_controller memory_controller__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__0),
    .we(we__0),
    .addr(addr__0[14:0]),
    .size(size__0),
    .wr_data(wr_data__0),
    .ready(ready__0),
    .rd_data(rd_data__0),
    .ena(ena),
    .wea(wea),
    .addra(addra),
    .dina(dina),
    .douta(douta)
);

//==============================================
// platform_level_interrupt_controller 
//==============================================
platform_level_interrupt_controller platform_level_interrupt_controller__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__1),
    .we(we__1),
    .addr(addr__1[25:0]),
    .wr_data(wr_data__1[31:0]),
    .rd_data(rd_data__1[31:0]),
    .int__1(int__1),
    .context__0__eip(context__0__eip)
);

//==============================================
// machine_timer_registers__0 
//==============================================
machine_timer_registers machine_timer_registers__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cs__2),
    .we(we__2),
    .addr(addr__2[3:0]),
    .wr_data(wr_data__2),
    .rd_data(rd_data__2),
    .tip(tip)
);

//==============================
// physical_memory_attribute_registers__0
//==============================
physical_memory_attribute_registers physical_memory_attribute_registers__0
(   
    .clk(clk),
    .rst(rst),
    .cs(cs__3),
    .we(we__3),
    .addr(addr__3[2:0]),
    .wr_data(wr_data__3[7:0]),
    .rd_data(rd_data__3[7:0]),
    .pma__0(pma__0),
    .pma__1(pma__1),
    .pma__2(pma__2),
    .pma__3(pma__3),
    .pma__4(pma__4),
    .pma__5(pma__5),
    .pma__6(pma__6),
    .pma__7(pma__7)
);

//==============================
// general_purpose_input_output__0
//==============================
general_purpose_input_output general_purpose_input_output__0
(
    .clk(clk),
    .rst(rst),
    .cs(cs__4),
    .we(we__4),
    .addr(addr__4[3:0]),
    .wr_data(wr_data__4[7:0]),
    .rd_data(rd_data__4[7:0]),
    .port__0(port__0),
    .port__1(port__1),
    .port__2(port__2),
    .port__3(port__3)
);

//==============================================
// pusle_width_modulator__0 
//==============================================
pulse_width_modulator pusle_width_modulator__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cs__5),
    .we(we__5),
    .addr(addr__5[3:0]),
    .wr_data(wr_data__5),
    .rd_data(rd_data__5),
    .pwm(pwm)
);

endmodule

