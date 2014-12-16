`include "../lib/mux32bits_32to1.v"

module test;

  reg  [4:0] s;
  reg  [31:0] i31, i30, i29, i28, i27, i26, i25, i24, i23,i22, i21, i20, i19, i18, i17, i16;
  reg  [31:0] i15, i14, i13, i12, i11, i10, i9, i8, i7,i6, i5, i4, i3, i2, i1, i0;
  wire [31:0] z;

  reg [31:0] val, expect;
  mux32bits_32to1 mux(
    .s  (s ),
    .i31(i31),  
    .i30(i30),
    .i29(i29),
    .i28(i28),
    .i27(i27),
    .i26(i26),
    .i25(i25),
    .i24(i24),
    .i23(i23),
    .i22(i22),
    .i21(i21),
    .i20(i20),
    .i19(i19),
    .i18(i18),
    .i17(i17),
    .i16(i16),
    .i15(i15),   
    .i14(i14),
    .i13(i13),
    .i12(i12),
    .i11(i11),
    .i10(i10),
    .i9 (i9 ),
    .i8 (i8 ),
    .i7 (i7 ),
    .i6 (i6 ),
    .i5 (i5 ),
    .i4 (i4 ),
    .i3 (i3 ),
    .i2 (i2 ),
    .i1 (i1 ),
    .i0 (i0 ),
    .z  (z ));
 
  initial begin
    $monitor($time, ": val=%d expect=%d", val, expect);
    #5 i31 = 5  ; val = i31; s = 5'b11111; expect = 5  ;
    #5 i25 = 345; val = i25; s = 5'b11001; expect = 345;
    #5 i6  = 35 ; val = i6 ; s = 5'b00110; expect = 35 ;
    #5 i16 = 276; val = i16; s = 5'b10000; expect = 276; 
  end

endmodule
