module mux_8to1 (
  input [2:0] s,
  input i7, i6, i5, i4, i3, i2, i1, i0,
  output z);

wire int0, int1, int2 , int3 , int4 , int5 , int6, int7; 
wire int8, int9, int10, int11, int12, int13; 

not (s0_bar, s[0]);
not (s1_bar, s[1]);
not (s2_bar, s[2]);

and(int0, i0, s2_bar, s1_bar, s0_bar);
and(int1, i1, s2_bar, s1_bar, s[0]  );
and(int2, i2, s2_bar, s[1]  , s0_bar);
and(int3, i3, s2_bar, s[1]  , s[0]  );
and(int4, i4, s[2]  , s1_bar, s0_bar);
and(int5, i5, s[2]  , s1_bar, s[0]  );
and(int6, i6, s[2]  , s[1]  , s0_bar);
and(int7, i7, s[2]  , s[1]  , s[0]  );

or (int8 , int0 , int1 );
or (int9 , int2 , int3 );
or (int10, int4 , int5 );
or (int11, int6 , int7 );
or (int12, int8 , int9 );
or (int13, int10, int11);
or (z    , int12, int13);

endmodule
