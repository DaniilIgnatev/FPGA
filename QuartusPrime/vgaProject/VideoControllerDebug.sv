

//ТЗ:
//Графический режим 800x600
//Карта памяти 400x300
//Глубина - 8 цветов
//Двойная буферизация
//ФУНКЦИЯ. РЕЖИМ ЗАПИСИ (замена, and, or, xor)


//графический контроллер. Предоставляет интерфейс работы с памятью. Управляет компонентами.
module VideoControllerDebug
(
	input logic i_clk,
	input logic i_reset,
	output logic o_vga_hs, o_vga_vs,
	output logic[3:0] VGA_R, VGA_G, VGA_B,
	input logic	[2:0] i_wdata,
	input logic [16:0] i_waddr,
	input	logic i_we,
	input logic i_flush,
	
	//DEBUG
	output logic CRCT_Blanking,
	output logic CRCT_Active,

	output logic CRCT_FrameEnd,
	output logic CRCT_ScreenEnd,

	output logic [9:0]	CRCT_X,
	output logic [9:0]	CRCT_Y,
	output logic [16:0]	CRCT_XY,
	
	output logic [2:0] f_rdata,
	output logic displayedFrameID,
	output logic [2:0] ff_rdata,
	output logic [2:0] sf_rdata
);


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
ram #(3, 17, 76800) firstFrame(
	i_clk,
	i_we & displayedFrameID,
	i_waddr,
	CRCT_XY,
	i_wdata,
	ff_rdata
);


ram #(3, 17, 76800) secondFrame(
	i_clk,
	i_we & ~displayedFrameID,
	i_waddr,
	CRCT_XY,
	i_wdata,
	sf_rdata
);
	
logic i_flush_triggered = 0;


//ВЫСТАВЛЕНИЕ ЦВЕТА ТЕКУЩЕГО ПИКСЕЛЯ
always_ff@(posedge i_clk)
begin
	if (i_reset)
	begin
		displayedFrameID <= 0;
	end
	else
	begin
		if (i_flush)
		begin
			if (~i_flush_triggered)
			begin
				i_flush_triggered <= 1;
				displayedFrameID <= ~displayedFrameID;
			end
		end
		else
		begin
			i_flush_triggered <= 0;
		end
	end
	
	
end

//always_comb//цветные полосы
//begin
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
//end

assign f_rdata = displayedFrameID ? sf_rdata : ff_rdata;
assign VGA_R = {CRCT_X > 0 & f_rdata[0], 3'b00};
assign VGA_G = {CRCT_X > 0 & f_rdata[1], 3'b00};
assign VGA_B = {CRCT_X > 0 & f_rdata[2], 3'b00};

endmodule
