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
    input int__1
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

logic cs__0;
logic we__0;
logic [39:0] addr__0;
logic [1:0] size__0;
logic [63:0] wr_data__0;
logic ready__0;
logic [63:0] rd_data__0;
logic [7:0] pma__0;
logic cs__1;
logic we__1;
logic [39:0] addr__1;
logic [1:0] size__1;
logic [63:0] wr_data__1;
logic ready__1;
logic [63:0] rd_data__1;
logic [7:0] pma__1;
logic cs__2;
logic we__2;
logic [39:0] addr__2;
logic [1:0] size__2;
logic [63:0] wr_data__2;
logic ready__2;
logic [63:0] rd_data__2;
logic [7:0] pma__2;
logic cs__3;
logic we__3;
logic [39:0] addr__3;
logic [1:0] size__3;
logic [63:0] wr_data__3;
logic ready__3;
logic [63:0] rd_data__3;
logic [7:0] pma__3;
logic cs__4;
logic we__4;
logic [39:0] addr__4;
logic [1:0] size__4;
logic [63:0] wr_data__4;
logic ready__4;
logic [63:0] rd_data__4;
logic [7:0] pma__4;
logic cs__5;
logic we__5;
logic [39:0] addr__5;
logic [1:0] size__5;
logic [63:0] wr_data__5;
logic ready__5;
logic [63:0] rd_data__5;
logic [7:0] pma__5;
logic cs__6;
logic we__6;
logic [39:0] addr__6;
logic [1:0] size__6;
logic [63:0] wr_data__6;
logic ready__6;
logic [63:0] rd_data__6;
logic [7:0] pma__6;
logic cs__7;
logic we__7;
logic [39:0] addr__7;
logic [1:0] size__7;
logic [63:0] wr_data__7;
logic ready__7;
logic [63:0] rd_data__7;
logic [7:0] pma__7;

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
    .cs__0(cs__0),
    .we__0(we__0),
    .addr__0(addr__0),
    .size__0(size__0),
    .wr_data__0(wr_data__0),
    .ready__0(ready__0),
    .rd_data__0(rd_data__0),
    .pma__0(pma__0),
    .cs__1(cs__1),
    .we__1(we__1),
    .addr__1(addr__1),
    .size__1(size__1),
    .wr_data__1(wr_data__1),
    .ready__1(ready__1),
    .rd_data__1(rd_data__1),
    .pma__1(pma__1),
    .cs__2(cs__2),
    .we__2(we__2),
    .addr__2(addr__2),
    .size__2(size__2),
    .wr_data__2(wr_data__2),
    .ready__2(ready__2),
    .rd_data__2(rd_data__2),
    .pma__2(pma__2),
    .cs__3(cs__3),
    .we__3(we__3),
    .addr__3(addr__3),
    .size__3(size__3),
    .wr_data__3(wr_data__3),
    .ready__3(ready__3),
    .rd_data__3(rd_data__3),
    .pma__3(pma__3),
    .cs__4(cs__4),
    .we__4(we__4),
    .addr__4(addr__4),
    .size__4(size__4),
    .wr_data__4(wr_data__4),
    .ready__4(ready__4),
    .rd_data__4(rd_data__4),
    .pma__4(pma__4),
    .cs__5(cs__5),
    .we__5(we__5),
    .addr__5(addr__5),
    .size__5(size__5),
    .wr_data__5(wr_data__5),
    .ready__5(ready__5),
    .rd_data__5(rd_data__5),
    .pma__5(pma__5),
    .cs__6(cs__6),
    .we__6(we__6),
    .addr__6(addr__6),
    .size__6(size__6),
    .wr_data__6(wr_data__6),
    .ready__6(ready__6),
    .rd_data__6(rd_data__6),
    .pma__6(pma__6),
    .cs__7(cs__7),
    .we__7(we__7),
    .addr__7(addr__7),
    .size__7(size__7),
    .wr_data__7(wr_data__7),
    .ready__7(ready__7),
    .rd_data__7(rd_data__7),
    .pma__7(pma__7),
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

endmodule

