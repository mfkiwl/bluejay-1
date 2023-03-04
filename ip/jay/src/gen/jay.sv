//==============================================
// jay 
//==============================================
module jay 
(
    clk,
    rst,
    port__0,
    port__1,
    port__2,
    port__3,
    ena,
    wea,
    addra,
    dina,
    douta
);

input clk;
input rst;

inout [7:0] port__0;
inout [7:0] port__1;
inout [7:0] port__2;
inout [7:0] port__3;

output ena;
output [7:0] wea;
output [11:0] addra; 
output [63:0] dina;
input [63:0] douta;

logic clk;
logic rst;

//logic [7:0] port__0;
//logic [7:0] port__1;
//logic [7:0] port__2;
//logic [7:0] port__3;

logic ena;
logic [7:0] wea;
logic [11:0] addra;
logic [63:0] dina;
logic [63:0] douta;


logic cpu_to_mmu__cs;
logic cpu_to_mmu__we;
logic [63:0] cpu_to_mmu__addr;
logic [1:0] cpu_to_mmu__size;
logic [63:0] cpu_to_mmu__wr_data;
logic cpu_to_mmu__ready;
logic cpu_to_mmu__resp;
logic [63:0] cpu_to_mmu__rd_data;

logic irq__0;
logic irq__1;
logic context__0__eip;

logic tip;

logic [7:0] pmar__0;
logic [7:0] pmar__1;
logic [7:0] pmar__2;
logic [7:0] pmar__3;
logic [7:0] pmar__4;
logic [7:0] pmar__5;
logic [7:0] pmar__6;
logic [7:0] pmar__7;

logic mmu_to_bus__cs;
logic mmu_to_bus__we;
logic [39:0] mmu_to_bus__addr;
logic [1:0] mmu_to_bus__size;
logic [63:0] mmu_to_bus__wr_data;
logic mmu_to_bus__ready;
logic mmu_to_bus__resp;
logic [63:0] mmu_to_bus__rd_data;

logic cs__0;
logic we__0;
logic [39:0] addr__0;
logic [1:0] size__0;
logic [63:0] wr_data__0;
logic ready__0;
logic resp__0;
logic [63:0] rd_data__0;

logic cs__1;
logic we__1;
logic [39:0] addr__1;
logic [1:0] size__1;
logic [63:0] wr_data__1;
logic ready__1;
logic resp__1;
logic [63:0] rd_data__1;

logic cs__2;
logic we__2;
logic [39:0] addr__2;
logic [1:0] size__2;
logic [63:0] wr_data__2;
logic ready__2;
logic resp__2;
logic [63:0] rd_data__2;

logic cs__3;
logic we__3;
logic [39:0] addr__3;
logic [1:0] size__3;
logic [63:0] wr_data__3;
logic ready__3;
logic resp__3;
logic [63:0] rd_data__3;

logic cs__4;
logic we__4;
logic [39:0] addr__4;
logic [1:0] size__4;
logic [63:0] wr_data__4;
logic ready__4;
logic resp__4;
logic [63:0] rd_data__4;

logic cs__5;
logic we__5;
logic [39:0] addr__5;
logic [1:0] size__5;
logic [63:0] wr_data__5;
logic ready__5;
logic resp__5;
logic [63:0] rd_data__5;

logic cs__6;
logic we__6;
logic [39:0] addr__6;
logic [1:0] size__6;
logic [63:0] wr_data__6;
logic ready__6;
logic resp__6;
logic [63:0] rd_data__6;

logic cs__7;
logic we__7;
logic [39:0] addr__7;
logic [1:0] size__7;
logic [63:0] wr_data__7;
logic ready__7;
logic resp__7;
logic [63:0] rd_data__7;

//==============================
// central_processing_unit__0
//==============================
central_processing_unit central_processing_unit__0 
(
    .clk(clk),
    .rst(rst),
    .cs(cpu_to_mmu__cs),
    .we(cpu_to_mmu__we),
    .addr(cpu_to_mmu__addr),
    .size(cpu_to_mmu__size),
    .wr_data(cpu_to_mmu__wr_data),
    .ready(cpu_to_mmu__ready),
    .resp(cpu_to_mmu__resp),
    .rd_data(cpu_to_mmu__rd_data),
    .eip(context__0__eip),
    .tip(tip)
);

//==============================
// memory_management_unit
//==============================
memory_management_unit memory_management_unit__0
(
    .clk(clk),
    .rst(rst),
    .cpu_to_mmu__cs(cpu_to_mmu__cs),
    .cpu_to_mmu__we(cpu_to_mmu__we),
    .cpu_to_mmu__addr(cpu_to_mmu__addr),
    .cpu_to_mmu__size(cpu_to_mmu__size),
    .cpu_to_mmu__wr_data(cpu_to_mmu__wr_data),
    .cpu_to_mmu__ready(cpu_to_mmu__ready),
    .cpu_to_mmu__resp(cpu_to_mmu__resp),
    .cpu_to_mmu__rd_data(cpu_to_mmu__rd_data),
    .mmu_to_bus__cs(mmu_to_bus__cs),
    .mmu_to_bus__we(mmu_to_bus__we),
    .mmu_to_bus__addr(mmu_to_bus__addr),
    .mmu_to_bus__size(mmu_to_bus__size),
    .mmu_to_bus__wr_data(mmu_to_bus__wr_data),
    .mmu_to_bus__ready(mmu_to_bus__ready),
    .mmu_to_bus__resp(mmu_to_bus__resp),
    .mmu_to_bus__rd_data(mmu_to_bus__rd_data),
    .pmar__0(pmar__0),
    .pmar__1(pmar__1),
    .pmar__2(pmar__2),
    .pmar__3(pmar__3),
    .pmar__4(pmar__4),
    .pmar__5(pmar__5),
    .pmar__6(pmar__6),
    .pmar__7(pmar__7)
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
    .irq__0(irq__0),
    .irq__1(irq__1),
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
    .addr(addr__2[0]),
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
    .pmar__0(pmar__0),
    .pmar__1(pmar__1),
    .pmar__2(pmar__2),
    .pmar__3(pmar__3),
    .pmar__4(pmar__4),
    .pmar__5(pmar__5),
    .pmar__6(pmar__6),
    .pmar__7(pmar__7)
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

//==============================
// bus__0
//==============================
bus bus__0 
(
    .clk(clk),
    .rst(rst),
    .cs(mmu_to_bus__cs),
    .we(mmu_to_bus__we),
    .addr(mmu_to_bus__addr),
    .size(mmu_to_bus__size),
    .wr_data(mmu_to_bus__wr_data),
    .ready(mmu_to_bus__ready),
    .resp(mmu_to_bus__resp),
    .rd_data(mmu_to_bus__rd_data),
    .cs__0(cs__0),
    .we__0(we__0),
    .addr__0(addr__0),
    .size__0(size__0),
    .wr_data__0(wr_data__0),
    .ready__0(ready__0),
    .resp__0(1'b0),
    .rd_data__0(rd_data__0),
    .cs__1(cs__1),
    .we__1(we__1),
    .addr__1(addr__1),
    .size__1(size__1),
    .wr_data__1(wr_data__1),
    .ready__1(1'b1),
    .resp__1(1'b0),
    .rd_data__1(rd_data__1),
    .cs__2(cs__2),
    .we__2(we__2),
    .addr__2(addr__2),
    .size__2(size__2),
    .wr_data__2(wr_data__2),
    .ready__2(1'b1),
    .resp__2(1'b0),
    .rd_data__2(rd_data__2),
    .cs__3(cs__3),
    .we__3(we__3),
    .addr__3(addr__3),
    .size__3(size__3),
    .wr_data__3(wr_data__3),
    .ready__3(1'b1),
    .resp__3(1'b0),
    .rd_data__3(rd_data__3),
    .cs__4(cs__4),
    .we__4(we__4),
    .addr__4(addr__4),
    .size__4(size__4),
    .wr_data__4(wr_data__4),
    .ready__4(1'b1),
    .resp__4(1'b0),
    .rd_data__4(rd_data__4),
    .cs__5(cs__5),
    .we__5(we__5),
    .addr__5(addr__5),
    .size__5(size__5),
    .wr_data__5(wr_data__5),
    .ready__5(1'b1),
    .resp__5(1'b0),
    .rd_data__5(rd_data__5),
    .cs__6(cs__6),
    .we__6(we__6),
    .addr__6(addr__6),
    .size__6(size__6),
    .wr_data__6(wr_data__6),
    .ready__6(1'b1),
    .resp__6(1'b0),
    .rd_data__6(rd_data__6),
    .cs__7(cs__7),
    .we__7(we__7),
    .addr__7(addr__7),
    .size__7(size__7),
    .wr_data__7(wr_data__7),
    .ready__7(1'b1),
    .resp__7(1'b0),
    .rd_data__7(rd_data__7)
);

endmodule

