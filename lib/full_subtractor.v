module full_subtractor (
  output Bor_out, d,
  input a, b, Bor_in
  );

wire int1, int2, int3, int4, b_bar;

// d = (a xor b) xor Bor_in
xor (int1, a, b);
xor (d, int1, Bor_in);

// Bor_out = ((a xor b)' and Bor_in) or (a and b')
not (int2, int1);
and (int3, int2, Bor_in); //(a xor b)' and Bor_in
not (b_bar, b);
and (int4, b_bar, a); //a and b'
or  (Bor_out, int4, int3);

endmodule
