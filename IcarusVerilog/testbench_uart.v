`timescale 1 ns/10 ps
`include "uart.v"

module testbench_uart;

reg clock;
reg[7:0] tx_data;
reg tx_ready;
reg tx_line;
reg[7:0] rx_data;
reg rx_ready;
reg rx_line;

uart u0(clock, tx_data, tx_ready, tx_line, rx_data, rx_ready, rx_line);

initial begin
    clk <= 0;
end

endmodule