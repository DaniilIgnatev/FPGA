module div2(input logic clk, reset, enable, output logic q);

flop f(clk, reset, enable, ~q, q);

endmodule
