module jk(input logic clk, j, k, output logic q, qn);

logic Qprev = 0;
logic Q = 0;

always_ff@(posedge clk)
begin
	Qprev <= q;
	q <= Q;
end

always_comb
begin

	Q = ((~(j ^ k)) & ((j & k) ^ ~Qprev)) | ((j ^ k) & j);
	
	qn = ~q;
end

endmodule
