module mux5bit_2to1(input [4:0] i0, i1,
                    input s,
                    output [4:0] z);

  mux_2to1 mux0(.i0(i0[0]), .i1(i1[0]), .z(z[0]), .s(s));
  mux_2to1 mux1(.i0(i0[1]), .i1(i1[1]), .z(z[1]), .s(s));
  mux_2to1 mux2(.i0(i0[2]), .i1(i1[2]), .z(z[2]), .s(s));
  mux_2to1 mux3(.i0(i0[3]), .i1(i1[3]), .z(z[3]), .s(s));
  mux_2to1 mux4(.i0(i0[4]), .i1(i1[4]), .z(z[4]), .s(s));
endmodule
