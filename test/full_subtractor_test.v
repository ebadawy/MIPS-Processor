`include "../lib/full_subtractor.v"

module test; 
  reg a, b, bin;
  wire bout, d;
  
  full_subtractor subtractor(
    .a(a),
    .b(b),
    .d(d),
    .Bor_in(bin),
    .Bor_out(bout));

  initial begin
    $monitor ($time, ":  %b  %b  %b | %b %b", a, b, bin, bout, d);
    #5 a = 0; b = 0; bin = 0;
    #5 a = 1;
    #5 a = 0; b = 1;
    #5 a = 1;
    #5 a = 0; b = 0; bin = 1;
    #5 a = 1;
    #5 a = 0; b = 1;
    #5 a = 1;
    #7; 
  end

endmodule
