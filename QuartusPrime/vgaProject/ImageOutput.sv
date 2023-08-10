module ImageOutput
(
	input logic i_clk,
	input logic i_resetL,
	output logic o_vga_hs, o_vga_vs,
	output logic[3:0] VGA_R, VGA_G, VGA_B,
	input logic i_nextL
);

logic reset;
assign reset = ~i_resetL;

logic nextImage;
assign nextImage = ~i_nextL;

bit[1:0] data_id = 0;
logic [2:0] data;
logic [2:0] data_array[0:2];

assign data = data_array[data_id];


logic we;
logic [16:0] addr = 0;
assign we = addr < 76800;


ffd #(.init_file("1.mif")) picture1(addr, i_clk, data_array[0]);
ffd #(.init_file("2.mif")) picture2(addr, i_clk, data_array[1]);
ffd #(.init_file("3.mif")) picture3(addr, i_clk, data_array[2]);


logic flush = 0;
bit i_has_reset = 1;


always_ff@(posedge i_clk)
begin
	if (reset)
	begin
		data_id <= 0;
		addr <= 0;
		flush <= 0;
	end
	else
	begin
		if (nextImage & i_has_reset)//следующее изображение
		begin
			i_has_reset <= 0;
			
			if (data_id < 2)
				data_id <= data_id + 1;
			else
				data_id <= 0;
				
			addr <= 0;
			flush <= 0;
		end
		else
		begin
			if (~nextImage)
				i_has_reset <= 1;
			
			if (addr < 76800)
				addr <= addr + 1;
			else
				flush <= 1;
		end
	end
end


VideoControllerDebug video(i_clk, reset, o_vga_hs, o_vga_vs, VGA_R, VGA_G, VGA_B, data, addr, we, flush);


endmodule
