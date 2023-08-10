module combTestWithEnums;

command_t c();
bit [7:0] result;

aluWithEnums dut (.*);

initial
begin
	$monitor("%h = %h %0s %h", result, c.inA, c.oper, c.inB);
	
	for (c.oper = c.oper.first; 1; c.oper = c.oper.next)
	begin
		c.inA = 8'h35;
		c.inB = 8'h15;
		#1;
		if (c.oper == c.oper.last)
			break;
	end
end


endmodule
