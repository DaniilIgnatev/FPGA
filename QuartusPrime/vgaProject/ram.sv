module ram
#
(
	parameter WordSize = 3,
	parameter Address_Bus = 17,
	parameter Address_Max = 76800
)
(
	input bit i_clk,
	input bit i_we,
	input bit [Address_Bus-1:0] i_waddr,
	input bit [Address_Bus-1:0] i_raddr,
	input bit [WordSize-1:0] i_write,
	output bit [WordSize-1:0] o_read
);

bit [WordSize-1:0] memory [0:Address_Max-1];

always_ff@(posedge i_clk)
begin
	if (i_we)
		memory[i_waddr] <= i_write;
end

assign o_read = memory[i_raddr];

endmodule
