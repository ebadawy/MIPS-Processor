module full_adder (
  output cout, sum,
  input a, b, cin
  );

wire int1, int2, int3;

xor (int1, a   , b   );
xor (sum , int1, cin );
and (int2, int1, cin );
and (int3, a   , b   );
or  (cout, int2, int3);

endmodule
