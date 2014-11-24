`include "../lib/sub.v"
module test;

reg  signed [31:0] a, b;
wire signed [31:0] d;
wire bout;

sub Sub_op(
  .a(a),
  .b(b),
  .Bor_out(bout),
  .d(d));

initial begin
  $monitor ($time, ": %0d %0d | %0d %0d", a, b, bout, d);
  #5 a = 0; b = 0; 
  #5 a = 2; b = 9; 
  #5 a = 1; b = 1; 
  #5 a = 10; b = 6;
end

endmodule

