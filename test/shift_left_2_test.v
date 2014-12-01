`include "../lib/shift_left_2.v"

module test;

  reg  [31:0] a;
  wire [31:0] b;

  shift_left_2 shift (
    .a(a),
    .b(b));
  initial begin
    $monitor ($time, ": a=%5d, b=%5d", a, b);
    #5 a = 0;
    #5 a = 2;
    #5 a = 9;
  end

endmodule
