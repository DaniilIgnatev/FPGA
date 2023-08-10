module flop(input logic clk, reset, enable, input logic d, output logic q);

always_ff@(posedge clk, posedge reset)
	if (reset)
		q <= 0;
	else
		if (enable)
			q <= d;
 
endmodule
