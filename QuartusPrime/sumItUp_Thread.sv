module sumItUp_Thread(
	input logic clk,
	input logic reset_l,
	input logic go_l,
	input logic [15:0] inA,
	output logic done,
	output logic [15:0] sum
);

logic ld_l, cl_l, inAeq;
logic [15:0] addOut;

enum bit {sA, sB} state;

always_ff@(posedge clk, negedge reset_l)
begin: st_machine
	if (~reset_l)
		state <= sA;
	else
	begin
		if (((state == sA) & go_l) | ((state == sB) & inAeq))
			state <= sA;
		if (((state == sA) & ~go_l) | ((state == sB) & ~inAeq))
			state <= sB;	
	end
end: st_machine


always_ff@(posedge clk, negedge reset_l)
begin: reg_sum
	if (~reset_l)
		sum <= 0;
	else
		if (~ld_l)
			sum <= addOut;
		else
			if (~cl_l)
				sum <= 0;
end: reg_sum


assign addOut = inA + sum;
assign ld_l = ~(((state == sA) & ~go_l) | ((state == sB) & ~inAeq));
assign cl_l = ~((state == sB) & inAeq);
assign done = (state == sB) & inAeq;
assign inAeq = (inA == 0);

endmodule
