`include "../CPU/cpu.v"

module cpu_test;

  reg clk;
  reg [31:0] addr;
  wire [31:0] alu_output, data;
  wire [31:0] pc_4;
  cpu c(.clk(clk), .alu_output(alu_output), .data(data), .nxt_pc(pc_4));
  reg [31:0] regVal;
  integer i;
  always #1 clk = ~clk;
  initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, cpu_test);
    clk = 0;
   // for(i = 0; i < 223; i = i + 1) begin
   // #2; $display("pc_4 = %h, data = %h", pc_4, data);
     // if($isunknown(data)) begin 
      //  break;
     // end
    //end
    i = 0;
    while (i < 233) begin
    #2 ;//$display("pc_4 = %h, data = %b", pc_4, data);
    i = i + 1;
    end
    
    //for(i = 0; i < 32; i = i + 1) begin
     // regVal = c.rf.regs[i];
     // #2 $display("pc_4 = %h, data = %h, $s%d  = %h", pc_4, data, i,regVal);
    //end
    //#2; $display("Final value of PC = %h", pc_4 );
    #2; $display("$0  = %h", c.rf.regs[0 ] );
    #2; $display("$at = %h", c.rf.regs[1 ] );
    #2; $display("$v0 = %h", c.rf.regs[2 ] );
    #2; $display("$v1 = %h", c.rf.regs[3 ] );
    #2; $display("$a0 = %h", c.rf.regs[4 ] );
    #2; $display("$a1 = %h", c.rf.regs[5 ] );
    #2; $display("$a2 = %h", c.rf.regs[6 ] );
    #2; $display("$a3 = %h", c.rf.regs[7 ] );
    #2; $display("$t0 = %h", c.rf.regs[8 ] );
    #2; $display("$t1 = %h", c.rf.regs[9 ] );
    #2; $display("$t2 = %h", c.rf.regs[10] );
    #2; $display("$t3 = %h", c.rf.regs[11] );
    #2; $display("$t4 = %h", c.rf.regs[12] );
    #2; $display("$t5 = %h", c.rf.regs[13] );
    #2; $display("$t6 = %h", c.rf.regs[14] );
    #2; $display("$t7 = %h", c.rf.regs[15] );
    #2; $display("$s0 = %h", c.rf.regs[16] );
    #2; $display("$s1 = %h", c.rf.regs[17] );
    #2; $display("$s2 = %h", c.rf.regs[18] );
    #2; $display("$s3 = %h", c.rf.regs[19] );
    #2; $display("$s4 = %h", c.rf.regs[20] );
    #2; $display("$s5 = %h", c.rf.regs[21] );
    #2; $display("$s6 = %h", c.rf.regs[22] );
    #2; $display("$s7 = %h", c.rf.regs[23] );
    #2; $display("$t8 = %h", c.rf.regs[24] );
    #2; $display("$t9 = %h", c.rf.regs[25] );
    #2; $display("$k0 = %h", c.rf.regs[26] );
    #2; $display("$k1 = %h", c.rf.regs[27] );
    #2; $display("$gp = %h", c.rf.regs[28] );
    #2; $display("$sp = %h", c.rf.regs[29] );
    #2; $display("$fp = %h", c.rf.regs[30] );
    #2; $display("$ra = %h", c.rf.regs[31] );
    $finish;                                      
  end
endmodule
