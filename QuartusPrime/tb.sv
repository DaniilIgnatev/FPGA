`timescale 1ns/1ns

module tb();

logic clk = 0;
logic reset = 0;
logic enable = 0;


always
begin
	#10
	clk = ~clk;
end


logic[7:0] a = 0;
logic[7:0] b = 0;
logic[7:0] out = 0;
logic[7:0] out_expected = 0;
logic p = 0;


fulladder8_s dut(clk, reset, a, b, out, p);


//8 тестовых векторов по 3 байта
logic[4:0] vectornum;
logic[4:0] errors;
logic[7:0] testvectors[0:23];


initial
begin
	vectornum = 0;
	errors = 0;
	$readmemh("C:\\Users\\idani\\Documents\\quartusprimeprojects\\fulladder8.tv", testvectors);
	reset = 1;
	enable = 1;
	reset = 0;
end


//Set test inputs at the pos edge
always@(posedge clk)
begin
	if(~reset & vectornum)
	begin
		if (out !== out_expected)
		begin
			$display("Error: a = %h, b = %h", a, b, out);
			$display(" output = %h (%h expected)", out, out_expected);
			errors = errors + 1;
		end
		
		
		if (vectornum == 27)
		begin
			$display("%d tests completed with %d errors", vectornum, errors);
			$finish;
		end
	end

	a = testvectors[vectornum];
	b = testvectors[vectornum + 1];
	out_expected = testvectors[vectornum + 2];
	vectornum = vectornum + 3;
end

endmodule
