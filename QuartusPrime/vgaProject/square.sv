module square
	#(
	parameter HALF_SIZE=80,
	parameter IX=320,
	parameter IY=240,
	parameter IX_DIR=1,
	parameter IY_DIR=1,
	parameter D_WIDTH=640,
	parameter D_HEIGH=480
	)
	(
	input logic i_clk,
	input logic i_pixel_stb,
	input logic i_rst,
	input logic i_can_animate,
	output logic [11:0] o_x1,
	output logic [11:0] o_x2,
	output logic [11:0] o_y1,
	output logic [11:0] o_y2
	);
	
	


endmodule
