`include "../RF/reg_32bits.v"

module test;

  reg [31:0] d;
  reg we, clk;
  wire [31:0] q;

  reg_32bits register (d, we, clk, q);

  always #6 clk = ~clk;

  initial begin
 
    $dumpfile("test22.vcd");
    $dumpvars(0, test); 
    clk = 0;
    $display ($time, ": d=%5d, q=%5d, we=%b", d, q, we);
    #5 d = 4; we = 1;
    $display ($time, ": d=%5d, q=%5d, we=%b", d, q, we);
    #5 d = 53;
    $display ($time, ": d=%5d, q=%5d, we=%b", d, q, we);
    #5 d = 6; we = 0;
    $display ($time, ": d=%5d, q=%5d, we=%b", d, q, we);
    #5;
    $display ($time, ": d=%5d, q=%5d, we=%b", d, q, we);
    $finish;
  end

endmodule
