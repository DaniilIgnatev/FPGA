module ramMatrix
#
(
	parameter WordSize = 8,
	parameter Rows_Bus = 10,
	parameter Columns_Bus = 10
)
(
	input logic i_clk,
	input logic i_we,
	input logic [Rows_Bus-1:0] i_waddr_row,
	input logic [Columns_Bus-1:0] i_waddr_col,
	input logic [Rows_Bus-1:0] i_raddr_row,
	input logic [Columns_Bus-1:0] i_raddr_col,
	input logic [WordSize-1:0] i_write,
	output logic [WordSize-1:0] o_read
);

logic[WordSize-1:0] memory [0:2**Rows_Bus-1][0:2**Columns_Bus-1];

always_ff@(posedge i_clk)
begin
	if (i_we)
		memory[i_waddr_row][i_waddr_col] <= i_write;
end

assign o_read = memory[i_raddr_row][i_raddr_col];

endmodule
