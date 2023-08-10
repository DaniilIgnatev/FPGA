`timescale 1ns/1ns

module tb2();

logic clk = 0;
logic reset = 0;
logic enable = 0;


always
begin
	#1
	clk = ~clk;
end


logic a = 0;
logic b = 0;
logic out = 0;
logic nout = 0;


jk dut(clk, a, b, out, nout);


initial
begin
	$dumpvars;
	enable = 0;
	reset = 1;
	enable = 1;
	reset = 0;
	#10
	a = 0;
	b = 0;
	#10
	a = 0;
	b = 1;
	#10
	a = 1;
	b = 0;
	#10
	a = 1;
	b = 1;
	#10
	a = 0;
	b = 0;
	#10
	a = 0;
	b = 1;
	#10
	a = 1;
	b = 0;
	#10
	a = 1;
	b = 1;
	#10
	a = 0;
	b = 0;
	#10
	a = 0;
	b = 1;
	#10
	a = 1;
	b = 0;
	#10
	a = 1;
	b = 1;
	#10
	a = 0;
	b = 0;
	#10
	a = 0;
	b = 1;
	#10
	a = 1;
	b = 0;
	#10
	a = 1;
	b = 1;
	#10
	$finish;
end


endmodule
