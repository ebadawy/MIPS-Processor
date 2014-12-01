`include "../lib/sign_extend.v"

module test;
  reg  signed [15:0] a;
  wire signed [31:0] b;

  sign_extend se(.a(a), .b(b));

  initial begin
    $monitor($time, "a=%5d\t, b=%5d", a, b);
    #5 a = 0;
    #5 a = 10;
    #5 a = 170;
    #5 a = -20;
    #5 a = -220;
  end
endmodule

