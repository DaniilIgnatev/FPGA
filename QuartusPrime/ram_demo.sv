module ram_demo(input logic clk, WE, input logic[1:0] A, input logic[3:0] WD, output logic[3:0] RD, output logic[7:0] led_low, led_high);

ram #(4,2) SRAM(clk, WE, A, WD, RD);

logic[3:0] digit_low = 0;
logic digit_high = 0;

always_comb
begin
	if (RD > 9)
	begin
		digit_low = RD - 10;
		digit_high = 1;
	end
	else
	begin
		digit_low = RD;
		digit_high = 0;
	end
end

indicator ind_low(digit_low, led_low);
indicator ind_high(digit_high, led_high);

endmodule