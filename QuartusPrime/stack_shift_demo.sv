module stack_shift_demo(input logic clk, reset, push, pop, input logic[7:0] write_data, output logic[7:0] read_data, output logic[7:0] led);

stack_shift #(8,2) dut (.reset(~reset), .*);
indicator ind(read_data, led);

endmodule
