`include "../CPU/cpu.v"

module cpu_test;

  reg clk;
  reg [31:0] addr;
  wire [31:0] alu_output, data;
  cpu c(.clk(clk), .alu_output(alu_output), .data(data));

  integer i;
  always #1 clk = ~clk;
  initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, cpu_test);
    clk = 0;
    for(i = 0; i < 223; i = i + 1) begin
     #2; //$display($time, ": data = %h, alu_output = %h", data, alu_output); 
    end
    #2; $display("data = %h, $0  = %h", data, alu_output);
    #2; $display("data = %h, $at = %h", data, alu_output);
    #2; $display("data = %h, $v0 = %h", data, alu_output);
    #2; $display("data = %h, $v1 = %h", data, alu_output);
    #2; $display("data = %h, $a0 = %h", data, alu_output);
    #2; $display("data = %h, $a1 = %h", data, alu_output);
    #2; $display("data = %h, $a2 = %h", data, alu_output);
    #2; $display("data = %h, $a3 = %h", data, alu_output);
    #2; $display("data = %h, $t0 = %h", data, alu_output);
    #2; $display("data = %h, $t1 = %h", data, alu_output);
    #2; $display("data = %h, $t2 = %h", data, alu_output);
    #2; $display("data = %h, $t3 = %h", data, alu_output);
    #2; $display("data = %h, $t4 = %h", data, alu_output);
    #2; $display("data = %h, $t5 = %h", data, alu_output);
    #2; $display("data = %h, $t6 = %h", data, alu_output);
    #2; $display("data = %h, $t7 = %h", data, alu_output);
    #2; $display("data = %h, $s0 = %h", data, alu_output);
    #2; $display("data = %h, $s1 = %h", data, alu_output);
    #2; $display("data = %h, $s2 = %h", data, alu_output);
    #2; $display("data = %h, $s3 = %h", data, alu_output);
    #2; $display("data = %h, $s4 = %h", data, alu_output);
    #2; $display("data = %h, $s5 = %h", data, alu_output);
    #2; $display("data = %h, $s6 = %h", data, alu_output);
    #2; $display("data = %h, $s7 = %h", data, alu_output);
    #2; $display("data = %h, $t8 = %h", data, alu_output);
    #2; $display("data = %h, $t9 = %h", data, alu_output);
    #2; $display("data = %h, $k0 = %h", data, alu_output);
    #2; $display("data = %h, $k1 = %h", data, alu_output);
    #2; $display("data = %h, $gp = %h", data, alu_output);
    #2; $display("data = %h, $sp = %h", data, alu_output);
    #2; $display("data = %h, $fp = %h", data, alu_output);
    #2; $display("data = %h, $ra = %h", data, alu_output);
    $finish;
  end
endmodule
