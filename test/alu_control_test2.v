`include "../ALU/alu_control2.v"

module test;

  reg [5:0] funct;
  reg [2:0] alu_op;
  wire [3:0] aluctrl;
  reg [3:0] expect; 
  alu_control a0 (
    .funct(funct),
    .alu_op(alu_op), 
    .aluctrl(aluctrl));
  
  initial begin
    $monitor ($time, ": funct=%b\top=%b\taluctrl=%b\texpect=%b", funct, alu_op, aluctrl, expect);  
    #5 funct  = 6'b100000; alu_op = 3'b00; expect = 4'b0010;
    #5 alu_op = 3'b01;     expect = 4'b0110;
    #5 alu_op = 3'b10;     expect = 4'b0010; //add
    #5 funct  = 6'b100010; expect = 4'b0110; //sub  
    #5 funct  = 6'b100100; expect = 4'b0000; //and
    #5 funct  = 6'b100101; expect = 4'b0001; //or
    #5 funct  = 6'b101010; expect = 4'b0111; //slt
    #5 funct  = 6'b100111; expect = 4'b1100; //nor

  end

endmodule
