module divn
#(
parameter N = 2
)
(
	input wire i_clk,
	output wire o_q
);

reg clkarray [0:N];

genvar gi;
generate
	for (gi = 0; gi < N; gi = gi + 1) begin
		div2 d(.clk(clkarray[gi]), .q(clkarray[gi + 1]));
	end
endgenerate

endmodule
