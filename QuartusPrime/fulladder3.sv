module fulladder3(input logic a, b, c, output logic s, p);

logic ad0_s = 0, ad0_p = 0;
fulladder ad0(a, b, 0, ad0_s, ad0_p);
fulladder ad1(ad0_s, c, ad0_p, s, p);

endmodule