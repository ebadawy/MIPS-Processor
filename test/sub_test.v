`include "../lib/sub.v"
module test;

reg [31:0] a, b;
reg bin;
wire [31:0] d;
wire bout;

sub Sub_op(
  .a(a),
  .b(b),
  .Bor_in(bin),
  .Bor_out(bout),
  .d(d));

initial begin
  $monitor ($time, ": %0d %0d %0d | %0d %0d", a, b, bin, bout, d);
  #5 a = 0; b = 0; bin = 0;
  #5 a = 2; b = 9; bin = 0;
  #5 bin = 1;
  #5 a = 1; b = 1; bin = 0;
  #5 a = 10; b = 6;
end

endmodule

