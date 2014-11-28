module mux_16to1 (
  input [3:0] s,
  input  i15, i14, i13, i12, i11, i10, i9, i8, i7,i6, i5, i4, i3, i2, i1, i0,
  output z);

wire int0 , int1 , int2 , int3 , int4 , int5 , int6 , int7; 
wire int8 , int9 , int10, int11, int12, int13, int14, int15;
 
not (s0_bar, s[0]);
not (s1_bar, s[1]);
not (s2_bar, s[2]);
not (s3_bar, s[3]);

and(int0 , i0 , s3_bar , s2_bar , s1_bar , s0_bar );
and(int1 , i1 , s3_bar , s2_bar , s1_bar , s[0]   );
and(int2 , i2 , s3_bar , s2_bar , s[1]   , s0_bar );
and(int3 , i3 , s3_bar , s2_bar , s[1]   , s[0]   );
and(int4 , i4 , s3_bar , s[2]   , s1_bar , s0_bar );
and(int5 , i5 , s3_bar , s[2]   , s1_bar , s[0]   );
and(int6 , i6 , s3_bar , s[2]   , s[1]   , s0_bar );
and(int7 , i7 , s3_bar , s[2]   , s[1]   , s[0]   );
and(int8 , i8 , s[3]   , s2_bar , s1_bar , s0_bar );
and(int9 , i9 , s[3]   , s2_bar , s1_bar , s[0]   );
and(int10, i10, s[3]   , s2_bar , s[1]   , s0_bar );
and(int11, i11, s[3]   , s2_bar , s[1]   , s[0]   );
and(int12, i12, s[3]   , s[2]   , s1_bar , s0_bar );
and(int13, i13, s[3]   , s[2]   , s1_bar , s[0]   );
and(int14, i14, s[3]   , s[2]   , s[1]   , s0_bar );
and(int15, i15, s[3]   , s[2]   , s[1]   , s[0]   );

or (z, int0, int1, int2, int3, int4, int5, int6, int7, int8, int9, int10, int11, int12, int13, int14, int15); 

//or (int16, int0 , int1 );
//or (int17, int2 , int3 );
//or (int18, int4 , int5 );
//or (int19, int6 , int7 );
//or (int20, int8 , int9 );
//or (int21, int10, int11);
//or (int22, int12, int13);
//or (int23, int14, int15);
//or (int24, int16, int17);
//or (int25, int18, int19);
//or (int26, int20, int21);
//or (int27, int22, int23);
//or (int28, int24, int25);
//or (int29, int26, int27);
//or (z    , int28, int29);

endmodule
