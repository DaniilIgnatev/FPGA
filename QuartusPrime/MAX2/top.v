module top(input wire clk, output wire o1, output wire o2);

reg [15:0] cnt = 0;
reg pix_stb = 0;
always @(posedge clk)
   {pix_stb, cnt} <= cnt + 16'h8000;  // divide by 4: (2^16)/4 = 0x4000

assign o1 = clk;
assign o2 = 1;

endmodule
