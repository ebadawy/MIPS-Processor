`include "../control/control.v"

module test;

  reg  [5:0] op;
  wire [1:0] alu_op;
  wire regDst, aluSrc, memToReg, regWrite;
  wire memRead, memWrite, branch;
  reg [8:0] expect;
  control c(
    .op(op),
    .alu_op(alu_op),
    .regDst(regDst),
    .aluSrc(aluSrc),
    .memToReg(memToReg),
    .regWrite(regWrite),
    .memRead(memRead),
    .memWrite(memWrite),
    .branch(branch));

  initial begin
    $monitor($time, ": op=%b\t %b%b%b%b%b%b%b%b\t expect=%b", op, regDst, aluSrc, memToReg, regWrite, memRead, memWrite, branch, alu_op, expect);
    #5 op = 0;          expect = 9'b100100010;
    #5 op = 6'b 100011; expect = 9'b011110000;
    #5 op = 6'b 101011; expect = 9'bx1x001000;
    #5 op = 6'b 000100; expect = 9'bx0x000101;

  end
endmodule
