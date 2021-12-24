//==============================================
// l0
//==============================================
module l0
(
    input clk,
    input rst,


    input cpu_req__valid,
    output logic cpu_req__ready,
    input cpu_req__rw,
    input [63:0] cpu_req__addr,
    input [63:0] cpu_req__data,

    output logic cpu_rtn__valid,
    input cpu_rtn__ready,
    output logic [63:0] cpu_rtn__data

    output logic mem_req__valid,
    input mem_req__ready,
    output logic mem_req__rw,
    output logic [63:0] mem_req__addr,
    output logic [WIDTH-1:0] mem_req__data,

    input mem_rtn__valid,
    output logic mem_rtn__ready,
    input [WIDTH-1:0] mem_rtn__data,

    output logic [] index,
    input [] tag,
    input valid,
    input dirty,
    output logic we,
    input [WIDTH-1:0] rd_data,
    output logic [WIDTH-1:0] wr_data
);


logic [] state;
logic [] rw;
logic [WIDTH-1:0] addr;





always_ff @(posedge clk) begin
    case (state)
        IDLE: state <= (cpu_req__valid & cpu_req__ready) ? 
        READ:
        HIT_WRITE
    endcase
end

always_comb begin
    case (state)
        READ: 
        begin

        end

end

always_comb begin
    case (addr[2:0])
        3'h0: cpu_rtn__data = rd_data;
        3'h1: cpu_rtn__data = rd_data >> 8;
        3'h2: cpu_rtn__data = rd_data >> 16;
        3'h3: cpu_rtn__data = rd_data >> 24;
        3'h4: cpu_rtn__data = rd_data >> 32;
        3'h5: cpu_rtn__data = rd_data >> 40;
        3'h6: cpu_rtn__data = rd_data >> 48;
        3'h7: cpu_rtn__data = rd_data >> 56;
    endcase
end

always_ff @(posedge clk) begin
    rw <= (cpu_req__valid & cpu_req__ready) ? cpu_req__rw : rw;
end

always_ff @(posedge clk) begin
    addr <= (cpu_req__valid & cpu_req__ready) ? cpu_req__addr : addr;
end

always_ff @(posedge clk) begin
    wr_data <= (cpu_req__valid & cpu_req__ready & cpu_req__rw) ? cpu_req__data : wr_data;
end


endmodule


mem[][63:0]