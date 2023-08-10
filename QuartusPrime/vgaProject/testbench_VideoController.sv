`timescale 1ps/1ps

module testbench_VideoController();

logic i_clk = 0;
logic i_reset = 0;

always
begin
	#1;
	i_clk = ~i_clk;
end



logic o_vga_hs = 0;
logic o_vga_vs = 0;
logic[3:0] VGA_R = '0;
logic[3:0] VGA_G = '0;
logic[3:0] VGA_B = '0;
logic	[2:0] i_wdata = '0;
logic [16:0] i_waddr = '0;
logic i_we = 0;
logic i_flush = 0;


logic CRCT_Blanking = 0;
logic CRCT_Active = 0;

logic CRCT_FrameEnd = 0;
logic CRCT_ScreenEnd = 0;

logic [9:0]  CRCT_X;
logic [9:0]	 CRCT_Y;
logic [16:0] CRCT_XY;

logic [2:0] f_rdata;
logic displayedFrameID = 0;
logic [2:0] ff_rdata = '0;
logic [2:0] sf_rdata = '0;

VideoControllerDebug dut(.*);


initial
begin
	$dumpvars;
	i_reset = 0;
	#2;
	i_reset = 1;
	#2;
	i_wdata = 3'b001;
	i_reset = 0;
	i_we = 1;
	
	for (int i = 0; i < 320*240;i++)
	begin
		i_waddr = i;
		#2;
	end
	
	i_we = 0;
	i_flush = 1;
	#2;
	i_flush = 0;
	
	#2000000;
	$finish;
end



endmodule
