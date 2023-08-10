

//ТЗ:
//Графический режим 800x600
//Карта памяти 400x300
//Глубина - 8 цветов
//Двойная буферизация
//ФУНКЦИЯ. РЕЖИМ ЗАПИСИ (замена, and, or, xor)


//графический контроллер. Предоставляет интерфейс работы с памятью. Управляет компонентами.
module VideoController
(
	input logic i_clk,
	input logic i_reset,
	output logic o_vga_hs, o_vga_vs,
	output logic[3:0] VGA_R, VGA_G, VGA_B,
	input logic	[2:0] i_wdata,
	input logic [16:0] i_waddr,
	input	logic i_we,
	input logic i_flush
);


//CRT
logic CRCT_Blanking = 0;
logic CRCT_Active = 0;

logic CRCT_FrameEnd = 0;
logic CRCT_ScreenEnd = 0;

logic [9:0]  CRCT_X;
logic [9:0]	 CRCT_Y;
logic [16:0] CRCT_XY;

CRCT CRCT_640X480
(
	.i_clk(i_clk),
	.i_rst(i_reset),
	.o_pix_stb(pix_stb),
	.o_hs(o_vga_hs),
	.o_vs(o_vga_vs),
	.o_blanking(CRCT_Blanking),
	.o_active(CRCT_Active),
	.o_frameend(CRCT_FrameEnd),
	.o_screenend(CRCT_ScreenEnd),
	.o_x(CRCT_X),
	.o_y(CRCT_Y),
	.o_xy(CRCT_XY),
	.pix_add(pix_add)
);



//ДВОЙНАЯ БУФЕРИЗАЦИЯ КАДРА
logic [2:0] f_rdata;//содержимое пикселя по адресу


logic displayedFrameID = 1;//буфер, выводимый на экран


always_ff@(posedge i_flush)
	displayedFrameID <= ~displayedFrameID;


//FIRST FRAME
logic [2:0] ff_rdata = '0;

FrameBuffer firstFrame(
	i_clk,
	i_wdata,
	CRCT_XY,
	i_waddr,
	i_we & displayedFrameID,
	ff_rdata);


	
//SECOND FRAME
logic [2:0] sf_rdata = '0;

FrameBuffer secondFrame(
	i_clk,
	i_wdata,
	CRCT_XY,
	i_waddr,
	i_we & ~displayedFrameID,
	sf_rdata);


//ВЫСТАВЛЕНИЕ ЦВЕТА ТЕКУЩЕГО ПИКСЕЛЯ
always_ff@(negedge i_clk)
begin
//	if (CRCT_XY > 0 & CRCT_XY < 320 * 80 * 1)
//		f_rdata = 3'b001;
//	else
//	if (CRCT_XY > 320 * 80 * 1 & CRCT_XY < 320 * 80 * 2)
//		f_rdata = 3'b010;
//	else
//	if (CRCT_XY > 320 * 80 * 2 & CRCT_XY < 320 * 80 * 3)
//		f_rdata = 3'b100;
//	else
//		f_rdata = 3'b000;
	f_rdata <= displayedFrameID ? sf_rdata : ff_rdata;
end

assign VGA_R[3] = CRCT_X > 0 & f_rdata[0];
assign VGA_G[3] = CRCT_X > 0 & f_rdata[1];
assign VGA_B[3] = CRCT_X > 0 & f_rdata[2];

endmodule
