//==============================================
// cache
//==============================================
module cache_tag
(
    input clk,
    input rst,
    input we,
    input set_dirty,
    input [] tag,
    input [8:0] index,
    input [2:0] offset,
    input [31:0] block__tag,
    input block__valid,
    input block__dirty
);
	logic [34:0] data [511:0];

	assign {rd_dirty, rd_valid, rd_tag} = data[index];

	always_ff @(posedge clk) begin
		data[index] <= we ? {1'b0, 1'b1, tag};
	end



endmodule

//==============================================
// cache
//==============================================
module cache_memory
(
    input clk,
    input rst,
);

endmodule