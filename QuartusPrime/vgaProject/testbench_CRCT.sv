`timescale 1ps/1ps

module testbench_CRCT();

logic i_clk = 0;
logic i_reset = 0;

always
begin
	#1;
	i_clk = ~i_clk;
end



logic o_pix_stb = 0;// pixel clock strobe
logic o_hs = 0;// horizontal sync
logic o_vs = 0;// vertical sync
logic o_blanking = 0;// high during blanking interval
logic o_active = 0;// high during active pixel drawing
logic o_frameend = 0;// high for one tick at end of active drawing
logic o_screenend = 0;// high for one tick at the end of screen
logic [9:0] o_x = 0;// current pixel x position
logic [9:0] o_y = 0;// current pixel y position
logic [16:0] o_xy = 0;//номер пикселя
logic pix_add = 0;
logic [9:0] h_count = 0;
logic [9:0] v_count = 0;

CRCT dut(.i_rst(i_reset), .*);


initial
begin
	$dumpvars;
	i_reset = 0;
	#2;
	i_reset = 1;
	#2;
	i_reset = 0;
	#2;
	
	#2000000;
	$finish;
end



endmodule
