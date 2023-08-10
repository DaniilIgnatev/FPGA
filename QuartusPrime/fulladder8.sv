module fulladder8(input logic[7:0] a, b, output logic[7:0] s, output logic p);

logic[8:0] ad_p = '0; 

fulladder2 ad0(a[0], b[0], 0, s[0], ad_p[0]);

fulladder2 ad1(a[1], b[1], ad_p[0], s[1], ad_p[1]);

fulladder2 ad2(a[2], b[2], ad_p[1], s[2], ad_p[2]);

fulladder2 ad3(a[3], b[3], ad_p[2], s[3], ad_p[3]);

fulladder2 ad4(a[4], b[4], ad_p[3], s[4], ad_p[4]);

fulladder2 ad5(a[5], b[5], ad_p[4], s[5], ad_p[5]);

fulladder2 ad6(a[6], b[6], ad_p[5], s[6], ad_p[6]);

fulladder2 ad7(a[7], b[7], ad_p[6], s[7], ad_p[7]);

assign p = ad_p[7];

endmodule
