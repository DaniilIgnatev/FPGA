// VGA timings https://timetoexplore.net/blog/video-timings-vga-720p-1080p

module CRCT
#(
	parameter HS_STA = 16,// horizontal sync start
	parameter HS_END = 16 + 96,// horizontal sync end
	parameter HA_STA = 16 + 96 + 48,// horizontal active pixel start
	parameter VS_STA = 480 + 10,// vertical sync start
	parameter VS_END = 480 + 10 + 2,// vertical sync end
	parameter VA_END = 480,// vertical active pixel end
	parameter LINE   = 800,// complete line (pixels)
	parameter SCREEN = 525,// complete screen (lines)
	parameter PIX_STB_DIVIDER = 16'h8000,//каждый второй такт один пиксель
	parameter PIX_ADD_DIVIDER = 16'h8000//каждый второй пиксель значимый
)
(
	input logic i_clk,// base clock
	input logic i_rst,// reset: restarts frame
	output logic o_pix_stb,// pixel clock strobe
	output logic o_hs,// horizontal sync
	output logic o_vs,// vertical sync
	output logic o_blanking,// high during blanking interval
	output logic o_active,// high during active pixel drawing
	output logic o_frameend,// high for one tick at end of active drawing
	output logic o_screenend,// high for one tick at the end of screen
	output logic [9:0] o_x,// current pixel x position
	output logic [9:0] o_y,// current pixel y position
	output logic [16:0] o_xy,//номер пикселя,
	output logic pix_add,
	output logic [9:0] h_count,
	output logic [9:0] v_count
);



//logic [9:0] h_count;// line position
//logic [9:0] v_count;// screen position


// generate sync signals (active low for 640x480)
assign o_hs = ~((h_count >= HS_STA) & (h_count < HS_END));
assign o_vs = ~((v_count >= VS_STA) & (v_count < VS_END));

// keep x and y bound within the active pixels
assign o_x = (h_count < HA_STA) ? 0 : (h_count - HA_STA);
assign o_y = (v_count >= VA_END) ? (VA_END - 1) : (v_count);

// blanking: high within the blanking period
assign o_blanking = ((h_count < HA_STA) | (v_count > VA_END - 1));

// active: high during active pixel drawing
assign o_active = ~((h_count < HA_STA) | (v_count > VA_END - 1));

// animate: high for one tick at the end of the final active pixel line
assign o_frameend = ((v_count == VA_END - 1) & (h_count == LINE));

// screenend: high for one tick at the end of the screen
assign o_screenend = ((v_count == SCREEN - 1) & (h_count == LINE));

assign pix_add = o_x[0] & o_x ^ 10'b0;

logic [15:0] pix_stb_cnt;

logic [16:0] xy_buf;

always_ff@(posedge i_clk)
 begin
	if (i_rst)  // reset to start of frame
	begin
		o_pix_stb <= 0;
		pix_stb_cnt <= 0;
		
		h_count <= 0;
		v_count <= 0;
		
		o_xy <= 0;
		xy_buf <= 0;
	end
	else
	begin
		{o_pix_stb, pix_stb_cnt} = pix_stb_cnt + PIX_STB_DIVIDER;
		
		if (o_pix_stb)  // once per pixel
		begin
			if (v_count < VA_END)
			begin
				//дублирование нечетных строк четными
				if (h_count == 0)
					if (o_y[0] == 0)
						xy_buf = o_xy;
					else
						o_xy <= xy_buf;
				
				if (pix_add)
					o_xy <= o_xy + 1;
			end
			
			if (o_frameend & o_active)
			begin
				o_xy <= 0;
				xy_buf <= 0;
			end
			
			if (h_count == LINE)  // end of line
			begin
				h_count <= 0;
				v_count <= v_count + 1;
			end
			else 
				h_count <= h_count + 1;

			if (v_count == SCREEN)  // end of screen
			begin
				v_count <= 0;
			end
		end
	end
	
 end

endmodule
