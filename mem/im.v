`define MEM_SIZE 256
`define INIT "../lib/initRegisters.txt"
`define VAL "../lib/regVals.txt"

module im (
  input clk,
  input [31:0] addr,
  output [31:0] data
);
  reg [31:0] mem [0:`MEM_SIZE-1];  
  reg [7:0] test_begin, test_end, regVals_begin, regVals_end;

  `ifdef R_TYPE
    parameter path = "../program/r_type.txt";
  `elsif I_TYPE
    parameter path = "../program/i_type.txt";
  `elsif BRANCH
    parameter path = "../program/branch.txt";
 `elsif BRANCHN
    parameter path = "../program/branchn.txt";
  `elsif JUMP
    parameter path = "../program/jump.txt";
  `elsif JAL
    parameter path = "../program/jal.txt";
  `elsif LOOP
    parameter path = "../program/loop.txt";
  `else
    parameter path = "../program/test.txt";
  `endif 

  parameter initRegisters = `INIT;
  parameter regVals       = `VAL;
 
 initial begin
   /* 
    test_begin    = 31;
    test_end      = 30+`CODE_SIZE;
    regVals_begin = 30+`CODE_SIZE+1;
    regVals_end   = 30+`CODE_SIZE+32;
  */
    $readmemh(path, mem, 1, `MEM_SIZE-33 );
   // $readmemh(initRegisters, mem, 0  , 30 );
   // $readmemh(path         , mem, 31 , `MEM_SIZE-33);
   // $readmemh(regVals      , mem, `MEM_SIZE-32, `MEM_SIZE-1);
  end
  assign data = mem[addr];
 
endmodule

