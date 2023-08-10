`timescale 1ns/1ns

module testbench();

logic clk = 0;
logic reset = 0;

always
begin
	#5;
	clk = ~clk;
end


/*
#(parameter DATA_WIDTH = 8, parameter PTR_WIDTH=2)
(
input logic clk, reset, push, pop,
input logic[DATA_WIDTH-1: 0] write_data,
output logic[PTR_WIDTH-1: 0] read_data 
);
*/

logic push, pop;
logic[1:0] write_data, read_data;


stack_shift #(2,2) dut(
	.clk,
	.reset,
	.push,
	.pop,
	.write_data,
	.read_data
);

initial
begin
	$dumpvars;
	
	push = 0;
	pop = 0;
	write_data = 2'b00;
	read_data = 2'b00;
	
	reset = 1;
	#10;
	reset = 0;

	repeat(4)
	begin
		push = 1'b1;
		write_data = write_data < 1;
		#10;
		push = 1'b0;
		#10;
	end
	
	repeat(4)
	begin
		pop = 1'b1;
		#10;
		pop = 1'b0;
		#10;
	end
	

	$finish;
end



endmodule
