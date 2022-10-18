//==============================================
// memory_management_unit 
//==============================================
module memory_management_unit
(
    input clk,
    input rst,
    input valid,
    input [63:0] addr,
    input [2:0] dtype,
    input [63:0] wr_data,
    output [63:0] rd_data,
    output

);

always_comb begin
    case (addr[])
        x'h0:
        begin
             
        end
    begin
end


endmodule

////==============================================
//// memory_management_unit 
////==============================================
//module memory_management_unit
//(
//    input clk,
//    input rst,
//    input cpu_to_mem__valid,
//    output cpu_to_mem__ready,
//    input cpu_to_mem__we,
//    input [63:0] cpu_to_mem__addr,
//    input [2:0] cpu_to_mem__dtype,
//    input [63:0] cpu_to_mem__wr_data,
//    output [63:0] cpu_to_mem__rd_data,
//    output cpu_to_mem__done,
//    output cpu_to_mem__access_fault,
//    output cpu_to_mem__address_misaligned_fault,
//);
//
//always_ff @(posedge clk) begin
//    if (cpu_to_mem__valid) begin
//        we <= cpu_to_mem__we;
//        addr <= cpu_to_mem__addr;
//        dtype <= cpu_to_mem__dtype;
//        wr_data <= cpu_to_mem__wr_data;
//    end
//end
//
//
//
//endmodule
