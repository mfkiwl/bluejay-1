//==============================================
// memory
//==============================================
module memory
(
    input clk,
    input rst,

    input cpu_req__valid,
    output logic cpu_req__ready,
    input cpu_req__rw,
    input [2:0] cpu_req__data_type,
    input [63:0] cpu_req__addr,
    input [63:0] cpu_req__data,

    output logic cpu_rtn__valid,
    input cpu_rtn__ready,
    output logic [63:0] cpu_rtn__data
);

logic [7:0] memory [1023:0];
logic [7:0] byte_0, byte_1, byte_2, byte_3, byte_4, byte_5, byte_6, byte_7;

assign cpu_rtn__data = {byte_7, byte_6, byte_5, byte_4, byte_3, byte_2, byte_1, byte_0};

always_ff @(posedge clk) begin
    case (cpu_req__data_type)
        3'h0:
        begin
            memory[cpu_req__addr[9:0]] <= cpu_req__rw ? cpu_req__data[7:0] : memory[cpu_req__addr[9:0]];
            memory[cpu_req__addr[9:0] + 1] <= cpu_req__rw ? cpu_req__data[15:8] : memory[cpu_req__addr[9:0] + 1];
            memory[cpu_req__addr[9:0] + 2] <= cpu_req__rw ? cpu_req__data[23:16] : memory[cpu_req__addr[9:0] + 2];
            memory[cpu_req__addr[9:0] + 3] <= cpu_req__rw ? cpu_req__data[31:24] : memory[cpu_req__addr[9:0] + 3];
            memory[cpu_req__addr[9:0] + 4] <= cpu_req__rw ? cpu_req__data[39:32] : memory[cpu_req__addr[9:0] + 4];
            memory[cpu_req__addr[9:0] + 5] <= cpu_req__rw ? cpu_req__data[47:40] : memory[cpu_req__addr[9:0] + 5];
            memory[cpu_req__addr[9:0] + 6] <= cpu_req__rw ? cpu_req__data[55:48] : memory[cpu_req__addr[9:0] + 6];
            memory[cpu_req__addr[9:0] + 7] <= cpu_req__rw ? cpu_req__data[63:56] : memory[cpu_req__addr[9:0] + 7];
        end
        3'h1:
        begin
            memory[cpu_req__addr[9:0]] <= cpu_req__rw ? cpu_req__data[7:0] : memory[cpu_req__addr[9:0]];
            memory[cpu_req__addr[9:0] + 1] <= cpu_req__rw ? cpu_req__data[15:8] : memory[cpu_req__addr[9:0] + 1];
            memory[cpu_req__addr[9:0] + 2] <= cpu_req__rw ? cpu_req__data[23:16] : memory[cpu_req__addr[9:0] + 2];
            memory[cpu_req__addr[9:0] + 3] <= cpu_req__rw ? cpu_req__data[31:24] : memory[cpu_req__addr[9:0] + 3];
        end
        3'h3:
        begin
            memory[cpu_req__addr[9:0]] <= cpu_req__rw ? cpu_req__data[7:0] : memory[cpu_req__addr[9:0]];
            memory[cpu_req__addr[9:0] + 1] <= cpu_req__rw ? cpu_req__data[15:8] : memory[cpu_req__addr[9:0] + 1];
        end
        3'h5:
        begin
            memory[cpu_req__addr[9:0]] <= cpu_req__rw ? cpu_req__data[7:0] : memory[cpu_req__addr[9:0]];
        end
    endcase
end

always_comb begin
    case (cpu_req__data_type)
        3'h0:
        begin
            byte_0 = memory[cpu_req__addr[9:0]];
            byte_1 = memory[cpu_req__addr[9:0] + 1];
            byte_2 = memory[cpu_req__addr[9:0] + 2];
            byte_3 = memory[cpu_req__addr[9:0] + 3];
            byte_4 = memory[cpu_req__addr[9:0] + 4];
            byte_5 = memory[cpu_req__addr[9:0] + 5];
            byte_6 = memory[cpu_req__addr[9:0] + 6];
            byte_7 = memory[cpu_req__addr[9:0] + 7];
        end
        3'h1:
        begin
            byte_0 = memory[cpu_req__addr[9:0]];
            byte_1 = memory[cpu_req__addr[9:0] + 1];
            byte_2 = memory[cpu_req__addr[9:0] + 2];
            byte_3 = memory[cpu_req__addr[9:0] + 3];
            byte_4 = {8{byte_3[7]}};
            byte_5 = {8{byte_3[7]}};
            byte_6 = {8{byte_3[7]}};
            byte_7 = {8{byte_3[7]}};
        end
        3'h2:
        begin
            byte_0 = memory[cpu_req__addr[9:0]];
            byte_1 = memory[cpu_req__addr[9:0] + 1];
            byte_2 = memory[cpu_req__addr[9:0] + 2];
            byte_3 = memory[cpu_req__addr[9:0] + 3];
            byte_4 = 8'h0;
            byte_5 = 8'h0;
            byte_6 = 8'h0;
            byte_7 = 8'h0;
        end
        3'h3:
        begin
            byte_0 = memory[cpu_req__addr[9:0]];
            byte_1 = memory[cpu_req__addr[9:0] + 1];
            byte_2 = {8{byte_1[7]}};
            byte_3 = {8{byte_1[7]}};
            byte_4 = {8{byte_1[7]}};
            byte_5 = {8{byte_1[7]}};
            byte_6 = {8{byte_1[7]}};
            byte_7 = {8{byte_1[7]}};
        end
        3'h4:
        begin
            byte_0 = memory[cpu_req__addr[9:0]];
            byte_1 = memory[cpu_req__addr[9:0] + 1];
            byte_2 = 8'h0;
            byte_3 = 8'h0;
            byte_4 = 8'h0;
            byte_5 = 8'h0;
            byte_6 = 8'h0;
            byte_7 = 8'h0;
        end
        3'h5:
        begin
            byte_0 = memory[cpu_req__addr[9:0]];
            byte_1 = {8{byte_0[7]}};
            byte_2 = {8{byte_0[7]}};
            byte_3 = {8{byte_0[7]}};
            byte_4 = {8{byte_0[7]}};
            byte_5 = {8{byte_0[7]}};
            byte_6 = {8{byte_0[7]}};
            byte_7 = {8{byte_0[7]}};
        end
        3'h6:
        begin
            byte_0 = memory[cpu_req__addr[9:0]];
            byte_1 = 8'h0;
            byte_2 = 8'h0;
            byte_3 = 8'h0;
            byte_4 = 8'h0;
            byte_5 = 8'h0;
            byte_6 = 8'h0;
            byte_7 = 8'h0;
        end
    endcase
end

endmodule