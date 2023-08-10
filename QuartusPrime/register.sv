module register
#(parameter Bits = 8, parameter Bus = 2)
(input logic clk, reset, WE, input logic[Bus-1:0] A, input logic[Bits-1:0] WD, output logic[Bits-1:0] RD);

logic[Bits-1:0] register_ar[0:2**Bus-1];

always_ff@(posedge clk, posedge reset)
begin
	if (reset)
		for(int i = 0; i < 2**Bus;i++) register_ar[i] <= 0;
	else
	if (WE)
		register_ar[A] <= WD;
end


always_comb
begin
	RD = register_ar[A];
end

endmodule
