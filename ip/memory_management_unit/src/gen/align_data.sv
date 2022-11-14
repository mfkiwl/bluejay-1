//==============================================
// align_data 
//==============================================
module align_data 
(
    input clk,
    input rst,
    input [3:0] addr,
    input [63:0] din,
    output logic [63:0] dout,
);

logic [63:0] x;

always_comb begin
    case (addr)
        3'h0:
        begin
            dout = din; 
        end
        3'h1:
        begin
            dout[55:0] = din[63:7]
            dout[63:56] = din[63:7]
        end
        3'h2:
        begin
        end
        3'h3:
        begin
        end
        3'h4:
        begin
        end
        3'h5:
        begin
        end
        3'h6:
        begin
        end
        3'h7:
        begin
        end
    endcase
end
