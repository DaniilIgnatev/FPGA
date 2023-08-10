module div4(input logic clk, reset, enable, output logic q);

logic clk2;

div2 inT(clk, reset, enable, clk2);
div2 outT(clk2, reset, enable, q);

endmodule
