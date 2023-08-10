module ram
#(parameter Bits = 8, parameter Bus = 10)
(input logic clk, we,
input logic[Bus-1:0] addr,
input logic[Bits-1:0] din,
output logic[Bits-1:0] dout
);

logic[Bits-1:0] memory [0:2**Bus-1];

always_ff@(posedge clk)
begin
	if (we)
		memory[addr] <= din;
end

assign dout = memory[addr];

endmodule
