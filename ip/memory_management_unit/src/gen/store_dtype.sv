//==============================================
// store_dtype 
//==============================================
module store_dtype 
(
    input clk,
    input rst,
    input [3:0] addr,
    input dtype,
    input [63:0] wr_data,
    input [63:0] din,
    output logic [63:0] dout
);

always_comb begin
    dout = din;

    case (dtype)
        3'h0:
        begin
            dout = wr_data;
        end
        3'h1:
        begin
            case (addr[2])
                1'b0:
                begin
                    dout[31:0] = wr_data[31:0];
                end
                1'b1:
                begin
                    dout[63:32] = wr_data[31:0];
                end
            endcase
        end
        3'h2:
        begin
            case (addr[2])
                1'b0:
                begin
                    dout[31:0] = wr_data[31:0];
                end
                1'b1:
                begin
                    dout[63:32] = wr_data[31:0];
                end
            endcase
        end
        3'h3:
        begin
            case (addr[2:1])
                2'h0:
                begin
                    dout[15:0] = wr_data[15:0];
                end
                2'h1:
                begin
                    dout[31:16] = wr_data[15:0];
                end
                2'h2:
                begin
                    dout[47:32] = wr_data[15:0];
                end
                2'h3:
                begin
                    dout[63:48] = wr_data[15:0];
                end
            endcase
        end
        3'h4:
        begin
            case (addr[2:1])
                2'h0:
                begin
                    dout[15:0] = wr_data[15:0];
                end
                2'h1:
                begin
                    dout[31:16] = wr_data[15:0];
                end
                2'h2:
                begin
                    dout[47:32] = wr_data[15:0];
                end
                2'h3:
                begin
                    dout[63:48] = wr_data[15:0];
                end
            endcase
        end
        3'h5:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    dout[7:0] = wr_data[7:0];
                end
                3'h1:
                begin
                    dout[15:8] = wr_data[7:0];
                end
                3'h2:
                begin
                    dout[23:16] = wr_data[7:0];
                end
                3'h3:
                begin
                    dout[31:24] = wr_data[7:0];
                end
                3'h4:
                begin
                    dout[39:32] = wr_data[7:0];
                end
                3'h5:
                begin
                    dout[47:40] = wr_data[7:0];
                end
                3'h6:
                begin
                    dout[55:48] = wr_data[7:0];
                end
                3'h7:
                begin
                    dout[63:56] = wr_data[7:0];
                end
            endcase
        end
        3'h6:
        begin
            case (addr[2:0])
                3'h0:
                begin
                    dout[7:0] = wr_data[7:0];
                end
                3'h1:
                begin
                    dout[15:8] = wr_data[7:0];
                end
                3'h2:
                begin
                    dout[23:16] = wr_data[7:0];
                end
                3'h3:
                begin
                    dout[31:24] = wr_data[7:0];
                end
                3'h4:
                begin
                    dout[39:32] = wr_data[7:0];
                end
                3'h5:
                begin
                    dout[47:40] = wr_data[7:0];
                end
                3'h6:
                begin
                    dout[55:48] = wr_data[7:0];
                end
                3'h7:
                begin
                    dout[63:56] = wr_data[7:0];
                end
            endcase
        end
    endcase
end

endmodule
