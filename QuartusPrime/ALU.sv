module ALU
#(parameter N = 8)
(input logic[N-1:0] a, b, input logic[2:0] F, output logic c, output logic[N-1:0] Y);

logic[N-1:0] BB;
logic[N-1:0] AND;
logic[N-1:0] OR;
logic[N-1:0] SUM;
logic[N-1:0] SLT;

always_comb
begin
	if (F[2])
	begin
		BB = ~b;
		{SUM, c} = a - b;
	end
	else
	begin
		BB = b;
		{SUM, c} = a + b;
	end
	
	AND = BB & a;
	OR = BB | a;
	SLT = SUM[N-1];
	
	casez(F)
		 2'b00:
			Y = AND;
		 2'b01:
			Y = OR;
		 2'b10:
			Y = SUM;
		 2'b11:
			Y = SLT;
		 default:
			Y = 0;
	 endcase;
end

endmodule
