module div2(input clk, output q);

reg d = 0;

always @(posedge clk)
begin
	d <= clk;
	q <= ~d;
end

endmodule

