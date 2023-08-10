typedef enum bit [2:0]{
	ADD = 3'b100,
	SUB = 3'b010,
	AND = 3'b001,
	OR = 3'b110,
	XOR = 3'b011
} aluInstr;



typedef struct packed{
	aluInstr oper;
	logic [7:0] inA, inB;
} command_t;



module aluWithEnums
(
	input command_t c,
	output bit [7:0] result
);

always_comb
begin
	unique case (c.oper)
		ADD: result = c.inA + c.inB;
		SUB: result = c.inA - c.inB;
		AND: result = c.inA & c.inB;
		OR: result = c.inA | c.inB;
		XOR: result = c.inA ^ c.inB;
	endcase
end

endmodule
