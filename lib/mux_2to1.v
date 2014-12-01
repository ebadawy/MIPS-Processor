module mux_2to1 (
  input i1, i0, s,
  output z);

wire int0, int1, s_bar;

not (s_bar, s);

and(int0, i0, s_bar);
and(int1, i1, s    );

or (z, int0, int1);

endmodule
