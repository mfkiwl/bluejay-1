//==============================================
// jay
//==============================================
module jay
(
    input clk,
    input rst,
    output logic [63:0] port__0,
    output logic [63:0] port__1
);

logic [60:0] l1_to_mem__addr;
logic [63:0] l1_to_mem__wr_data;
logic [63:0] l1_to_mem__rd_data;
logic l1_to_mem__en;
logic l1_to_mem__we;

logic [63:0] addra;
logic [63:0] dina;
logic [63:0] douta;
logic ena;
logic wea;

//==============================
// central_processing_unit__0
//==============================
central_processing_unit central_processing_unit__0
(
    .clk(clk),
    .rst(rst),
    .l1_to_mem__addr(l1_to_mem__addr),
    .l1_to_mem__wr_data(l1_to_mem__wr_data),
    .l1_to_mem__rd_data(l1_to_mem__rd_data),
    .l1_to_mem__en(l1_to_mem__en),
    .l1_to_mem__we(l1_to_mem__we)
);

//==============================
// memory__0
//==============================
memory memory__0
(
    .clka(clk),
    .addra(addra),
    .dina(dina),
    .douta(douta),
    .ena(ena),
    .wea(wea)
);

assign addra = l1_to_mem__addr[11:0];
assign dina = l1_to_mem__wr_data;
assign l1_to_mem__rd_data = douta;
assign ena = l1_to_mem__en;
assign wea = l1_to_mem__we;



always_ff @(posedge clk) begin
    if (addra == 12'hfff) begin
        port__0 <= dina;
    end
end

always_ff @(posedge clk) begin
    if (addra == 12'hffe) begin
        port__1 <= dina;
    end
end







// //==============================
// // port__0
// //==============================
// memory #(.WIDTH(64), .DEPTH(1), .DEPTH__LOG2(0)) port__0
// (
//     .clk(clk),
//     .rst(rst),
//     .addr(port__0__addr),
//     .rw(port__0__rw),
//     .wr_data(port__0__wr_data),
//     .rd_data(port__0__rd_data)
// );

// logic port__0__addr;
// logic port__0__rw;
// logic [63:0] port__0__wr_data;
// logic [63:0] port__0__rd_data;

// assign port__0__addr = 0;
// assign port__0__rw = (mem__addr == 64'hff);
// assign port__0__wr_data = mem__wr_data;



endmodule
