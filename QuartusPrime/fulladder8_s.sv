module fulladder8_s(input logic clk, reset, input logic[7:0] a, b, output logic[7:0] s, output logic p);

logic[7:0] async_sum;
logic async_p;

always_ff@(negedge clk, posedge reset)
	if (reset)
	begin
		s <= 0;
		p <= 0;
	end
	else
	begin
		s <= async_sum;
		p <= async_p;
	end
	
fulladder8 adder(a, b, async_sum, async_p);

endmodule
