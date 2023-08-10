module div3_SM(input logic clk, reset, enable, output logic y);

typedef enum logic [1:0] {S0, S1, S2} statetype;

statetype state, nextstate;

//регистр состояния
always_ff@(posedge clk, posedge reset, posedge enable)
	if (reset)
		state <= S0;
	else
		if (enable)
			state <= nextstate;
		
//логика следующего состояния
always_comb
begin
	case (state)
		S0:
			nextstate = S1;
		S1:
			nextstate = S2;
		S2:
			nextstate = S0;
		default:
			nextstate = S0;
	endcase
end
	
always_comb
begin
	y = (state == S0);
end
	
endmodule
