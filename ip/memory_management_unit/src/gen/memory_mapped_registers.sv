//==============================================
// 
//==============================================
module memory_mapped_registers 
(
    input clk,
    input rst,
    input we,
    input [1:0] addr,
    input [7:0] wr_data,
    output logic [7:0] rd_data,
    output logic [7:0] n__0,
    output logic [7:0] n__1,
    output logic [7:0] n__2,
    output logic [7:0] n__3
);


always_comb begin
    case (addr)
        2'h0:
        begin
            rd_data = n__0;
            n__0__we = we;
        end
        2'h1:
        begin
            rd_data = n__1;
            n__1__we = we;
        end
        2'h2:
        begin
            rd_data = n__2;
            n__2__we = we;
        end
        2'h3:
        begin
            rd_data = n__3;
            n__3__we = we;
        end
    endcase
end


always_ff @(posedge clk) begin
    n__0 <= rst ? 8'h0 : n__0__we ? wr_data : n__0;
end

always_ff @(posedge clk) begin
    n__1 <= rst ? 8'h0 : n__1__we ? wr_data : n__1;
end

always_ff @(posedge clk) begin
    n__2 <= rst ? 8'h0 : n__2__we ? wr_data : n__2;
end

always_ff @(posedge clk) begin
    n__3 <= rst ? 8'h0 : n__3__we ? wr_data : n__3;
end

endmodule
