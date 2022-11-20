//==============================================
// register_file
//==============================================
module register_file
(
    input clk,
    input rst,
    input we,
    input [4:0] addr,
    output [63:0] rd_data,
    input [63:0] wr_data
);

logic clk;
logic rst;
logic we;
logic [4:0] addr;
logic [63:0] rd_data;
logic [63:0] wr_data;

logic [63:0] x__0;
logic [63:0] x__1;
logic [63:0] x__2;
logic [63:0] x__3;
logic [63:0] x__4;
logic [63:0] x__5;
logic [63:0] x__6;
logic [63:0] x__7;
logic [63:0] x__8;
logic [63:0] x__9;
logic [63:0] x__10;
logic [63:0] x__11;
logic [63:0] x__12;
logic [63:0] x__13;
logic [63:0] x__14;
logic [63:0] x__15;
logic [63:0] x__16;
logic [63:0] x__17;
logic [63:0] x__18;
logic [63:0] x__19;
logic [63:0] x__20;
logic [63:0] x__21;
logic [63:0] x__22;
logic [63:0] x__23;
logic [63:0] x__24;
logic [63:0] x__25;
logic [63:0] x__26;
logic [63:0] x__27;
logic [63:0] x__28;
logic [63:0] x__29;
logic [63:0] x__30;
logic [63:0] x__31;

logic we__0;
logic we__1;
logic we__2;
logic we__3;
logic we__4;
logic we__5;
logic we__6;
logic we__7;
logic we__8;
logic we__9;
logic we__10;
logic we__11;
logic we__12;
logic we__13;
logic we__14;
logic we__15;
logic we__16;
logic we__17;
logic we__18;
logic we__19;
logic we__20;
logic we__21;
logic we__22;
logic we__23;
logic we__24;
logic we__25;
logic we__26;
logic we__27;
logic we__28;
logic we__29;
logic we__30;
logic we__31;

always_comb
begin
    we__0 = 1'b0;
    we__1 = 1'b0;
    we__2 = 1'b0;
    we__3 = 1'b0;
    we__4 = 1'b0;
    we__5 = 1'b0;
    we__6 = 1'b0;
    we__7 = 1'b0;
    we__8 = 1'b0;
    we__9 = 1'b0;
    we__10 = 1'b0;
    we__11 = 1'b0;
    we__12 = 1'b0;
    we__13 = 1'b0;
    we__14 = 1'b0;
    we__15 = 1'b0;
    we__16 = 1'b0;
    we__17 = 1'b0;
    we__18 = 1'b0;
    we__19 = 1'b0;
    we__20 = 1'b0;
    we__21 = 1'b0;
    we__22 = 1'b0;
    we__23 = 1'b0;
    we__24 = 1'b0;
    we__25 = 1'b0;
    we__26 = 1'b0;
    we__27 = 1'b0;
    we__28 = 1'b0;
    we__29 = 1'b0;
    we__30 = 1'b0;
    we__31 = 1'b0;

    case (addr)
        5'h0:
        begin
            rd_data = x__0;
            we__0 = we;
        end
        5'h1:
        begin
            rd_data = x__1;
            we__1 = we;
        end
        5'h2:
        begin
            rd_data = x__2;
            we__2 = we;
        end
        5'h3:
        begin
            rd_data = x__3;
            we__3 = we;
        end
        5'h4:
        begin
            rd_data = x__4;
            we__4 = we;
        end
        5'h5:
        begin
            rd_data = x__5;
            we__5 = we;
        end
        5'h6:
        begin
            rd_data = x__6;
            we__6 = we;
        end
        5'h7:
        begin
            rd_data = x__7;
            we__7 = we;
        end
        5'h8:
        begin
            rd_data = x__8;
            we__8 = we;
        end
        5'h9:
        begin
            rd_data = x__9;
            we__9 = we;
        end
        5'ha:
        begin
            rd_data = x__10;
            we__10 = we;
        end
        5'hb:
        begin
            rd_data = x__11;
            we__11 = we;
        end
        5'hc:
        begin
            rd_data = x__12;
            we__12 = we;
        end
        5'hd:
        begin
            rd_data = x__13;
            we__13 = we;
        end
        5'he:
        begin
            rd_data = x__14;
            we__14 = we;
        end
        5'hf:
        begin
            rd_data = x__15;
            we__15 = we;
        end
        5'h10:
        begin
            rd_data = x__16;
            we__16 = we;
        end
        5'h11:
        begin
            rd_data = x__17;
            we__17 = we;
        end
        5'h12:
        begin
            rd_data = x__18;
            we__18 = we;
        end
        5'h13:
        begin
            rd_data = x__19;
            we__19 = we;
        end
        5'h14:
        begin
            rd_data = x__20;
            we__20 = we;
        end
        5'h15:
        begin
            rd_data = x__21;
            we__21 = we;
        end
        5'h16:
        begin
            rd_data = x__22;
            we__22 = we;
        end
        5'h17:
        begin
            rd_data = x__23;
            we__23 = we;
        end
        5'h18:
        begin
            rd_data = x__24;
            we__24 = we;
        end
        5'h19:
        begin
            rd_data = x__25;
            we__25 = we;
        end
        5'h1a:
        begin
            rd_data = x__26;
            we__26 = we;
        end
        5'h1b:
        begin
            rd_data = x__27;
            we__27 = we;
        end
        5'h1c:
        begin
            rd_data = x__28;
            we__28 = we;
        end
        5'h1d:
        begin
            rd_data = x__29;
            we__29 = we;
        end
        5'h1e:
        begin
            rd_data = x__30;
            we__30 = we;
        end
        5'h1f:
        begin
            rd_data = x__31;
            we__31 = we;
        end
    endcase
end

assign x__0 = 64'h0;

always_ff @(posedge clk)
begin
    if (we__1)
    begin
        x__1 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__2)
    begin
        x__2 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__3)
    begin
        x__3 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__4)
    begin
        x__4 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__5)
    begin
        x__5 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__6)
    begin
        x__6 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__7)
    begin
        x__7 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__8)
    begin
        x__8 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__9)
    begin
        x__9 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__10)
    begin
        x__10 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__11)
    begin
        x__11 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__12)
    begin
        x__12 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__13)
    begin
        x__13 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__14)
    begin
        x__14 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__15)
    begin
        x__15 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__16)
    begin
        x__16 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__17)
    begin
        x__17 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__18)
    begin
        x__18 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__19)
    begin
        x__19 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__20)
    begin
        x__20 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__21)
    begin
        x__21 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__22)
    begin
        x__22 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__23)
    begin
        x__23 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__24)
    begin
        x__24 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__25)
    begin
        x__25 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__26)
    begin
        x__26 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__27)
    begin
        x__27 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__28)
    begin
        x__28 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__29)
    begin
        x__29 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__30)
    begin
        x__30 <= wr_data;
    end
end

always_ff @(posedge clk)
begin
    if (we__31)
    begin
        x__31 <= wr_data;
    end
end


endmodule
