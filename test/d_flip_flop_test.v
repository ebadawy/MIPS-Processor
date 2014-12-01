`include "../lib/flip_flop.v"

module test;

  reg d, clk;
  wire q, q_bar;

  d_flip_flop dff(
    .d(d),
    .clk(clk),
    .q(q),
    .q_bar(q_bar));

  always #4 clk = ~clk;

  initial begin
    clk = 0;
    #5 d = 0;
    $display($time , ": d=%b, q=%b, q_bar=%b", d, q, q_bar);
    #5 d = 1;
    $display($time , ": d=%b, q=%b, q_bar=%b", d, q, q_bar);
    #5 d = 1;
    $display($time , ": d=%b, q=%b, q_bar=%b", d, q, q_bar);
    #5 d = 0;
    $display($time , ": d=%b, q=%b, q_bar=%b", d, q, q_bar);
    #5 d = 1; 
    $display($time , ": d=%b, q=%b, q_bar=%b", d, q, q_bar);
    $finish;
  end

endmodule
