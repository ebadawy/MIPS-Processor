`include "../lib/mux_2to1.v"

module test;

  reg s, i0, i1;
  wire z;

  mux_2to1 mux(
    .s (s ),
    .i1(i1),
    .i0(i0),
    .z (z));

  initial begin
    $monitor($time, ": %b  %b  | %b | %b", i1,  i0, s, z);
    
    #5 i1 = 0; i0 = 0; s = 0;
    #5 i1 = 1;
    #5 i0 = 1;
    #5 i1 = 0;
    #5 s  = 1; 
 end

endmodule

 
