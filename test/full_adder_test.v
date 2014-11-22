`include "../lib/full_adder.v"
module test;
  reg a, b, cin;
  wire cout, sum;

  full_adder adder(
    .cout(cout),
    .sum(sum),
    .a(a),
    .b(b),
    .cin(cin));

  initial begin
    $monitor ($time, ":  %b %b %b, %b %b", a, b, cin, cout, sum);
    #5 a = 0; b = 0; cin = 0;
    #5 a = 1;
    #5 a = 0; b = 1;
    #5 a = 1;
    #5 a = 0; b = 0; cin = 1;
    #5 a = 1; 
    #5 a = 0; b = 1;
    #5 a = 1;
    #7;
  end
endmodule
