`include "../lib/mux_8to1.v"

module test;

  reg s2, s1, s0;
  reg i7, i6, i5, i4, i3, i2, i1, i0;

  wire z;
  mux_8to1 mux(
    .s2(s2),
    .s1(s1),
    .s0(s0),
    .i7(i7),
    .i6(i6),
    .i5(i5),
    .i4(i4),
    .i3(i3),
    .i2(i2),
    .i1(i1),
    .i0(i0),
    .z (z));

// 000 0
// 001 1
// 010 2
// 011 3
// 100 4
// 101 5
// 110 6
// 111 7
 
  initial begin
    $monitor($time, ": %b  %b  %b  %b  %b  %b  %b  %b | %b  %b  %b | %b", i7,  i6,  i5,  i4,  i3,  i2,  i1,  i0,  s2,  s1,  s0, z);
    
    #5 i7 = 0; i6 = 0; i5 = 0;  i4 = 0; i3 = 0; i2 = 0; i1 = 0; i0 = 0; s2 = 0; s1 = 0; s0 = 0;
    #5 i4 = 1; i5 = 1; i2 = 1; s1 = 1; // 010 select i2
    #5 s0 = 1; // 011 select i3
    #5 s2 = 1; // 111 select i7
    #5 i7 = 0;
    #5 s1 = 0; // 101 select i5
    #5 i5 = 1;
  end

endmodule

 
