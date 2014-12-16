`include "../mem/im.v"

module im_test;

  reg clk;
  reg [31:0] addr;
  wire [31:0] data;

  always #1 clk = ~clk;

  im m(clk, addr, data);
  
  initial begin
    addr = 0; clk = 0;
    repeat (224) begin
      #1 addr = addr + 1;
    end
    repeat (30) begin
      #1 addr = addr + 1;
    $display($time, ": addr = %h, data= %h", addr, data);
    end
    $finish;
  end
endmodule
