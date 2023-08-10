module register_demo(input logic clk, WE, input logic[1:0] A, input logic[3:0] WD, output logic[3:0] RD, output logic[7:0] led_low, led_high);

logic[3:0] readD;
register#(4,2) regfile(clk, 0, WE, A, WD, readD);

logic[3:0] digit_low, digit_high;

always_comb
begin
	if (readD > 9)
	begin
		digit_low = readD - 10;
		digit_high = 1;
	end
	else
	begin
		digit_low = readD;
		digit_high = 0;
	end
end

assign RD = readD;

indicator ind_low(digit_low, led_low);
indicator ind_high(digit_high, led_high);

endmodule
