`include "../ALU/alu.v"

module test;

  reg  signed [31:0] a, b;
  reg  [3:0] op;
  wire signed [31:0] z;

  alu a0 (
    .op(op),
    .a(a), 
    .b(b),
    .z(z));
  
  initial begin
    $monitor ($time, ": a=%0d\tb=%0d\top=%d\tz=%0d", a, b, op, z);  
    #5 a = 21; b = 3; op = 0;  
    #5 a = 2; b = 5; op = 1;  
    #5 a = 5; b = -4; op = 2;  
    #5 a = 9; b = 10; op = 6;  
    #5 a = 2; b = 5; op = 6;  
    #5 a = 1; b = 3; op = 7;  
    #5 a = 6; b = 5; op = 7;  
    #5 a = 1; b = 3; op = 12;  

  end

endmodule
