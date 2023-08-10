`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
`include "counter.v"
module half_adder_tb;

    reg a, b;
    wire sum, carry;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    half_adder UUT (.a(a), .b(b), .sum(sum), .carry(carry));

    initial
        begin
            $dumpfile("out.vcd");
            $dumpvars(0,half_adder_tb);
        end
    
    initial // initial block executes only once
        begin
            // values for a and b
            a = 0;
            b = 0;
            #period; // wait for period 

            a = 0;
            b = 1;
            #period;

            a = 1;
            b = 0;
            #period;

            a = 1;
            b = 1;
            #period;
            $dumpoff;
        end
endmodule