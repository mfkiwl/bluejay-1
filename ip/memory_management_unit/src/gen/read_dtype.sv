//==============================================
// read_dtype 
//==============================================
module read_dtype 
(
    input clk,
    input rst,
    input [2:0] addr,
    input dtype,
    input [63:0] din,
    output logic [63:0] dout
);

logic [63:0] x;

always_comb begin
    case (addr[2:0])
        3'h0:
        begin
            x = din;
        end
        3'h1:
        begin
            x = din >> 8;
        end
        3'h2:
        begin
            x = din >> 16;
        end
        3'h3:
        begin
            x = din >> 24;
        end
        3'h4:
        begin
            x = din >> 32;
        end
        3'h5:
        begin
            x = din >> 40;
        end
        3'h6:
        begin
            x = din >> 48;
        end
        3'h7:
        begin
            x = din >> 56;
        end
    endcase
end

always_comb begin
    case (dtype)
        3'h0:
        begin
            dout[63:0] = x[63:0];
        end
        3'h1:
        begin
            dout[31:0] = x[31:0];
            dout[63:32] = {32{x[31]}};
        end
        3'h2:
        begin
            dout[31:0] = x[31:0];
            dout[63:32] = {32{1'b0}};
        end
        3'h3:
        begin
            dout[15:0] = x[15:0];
            dout[63:16] = {48{x[15]}};
        end
        3'h4:
        begin
            dout[15:0] = x[15:0];
            dout[63:16] = {48{1'b0}};
        end
        3'h5:
        begin
            dout[7:0] = x[7:0];
            dout[63:8] = {56{x[7]}};
        end
        3'h6:
        begin
            dout[7:0] = x[7:0];
            dout[63:8] = {56{1'b0}};
        end
    endcase
end

endmodule
