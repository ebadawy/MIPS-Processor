`include "../lib/add.v"
module test;

reg [31:0] a, b;
reg cin;
wire [31:0] sum;
wire cout;

add Add_op(
  .a(a),
  .b(b),
  .cin(cin),
  .cout(cout),
  .sum(sum));

initial begin
  $monitor ($time, ": %0d %0d %0d | %0d %0d", a, b, cin, cout, sum);
  #5 a = 0; b = 0; cin = 0;
  #5 a = 2; b = 9; cin = 0;
  #5 cin = 1;
  #5 a = 1; b = 1; cin = 0;
end

endmodule

