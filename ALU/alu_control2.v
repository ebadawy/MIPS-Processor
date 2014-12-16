`define AND 0000
`define OR  4'b0001
`define ADD 4'b0010
`define SUB 4'b0110
`define SLT 4'b0111
`define NOR 4'b1100
`define AND_FUNCT 6'b100100
`define OR_FUNCT  6'b100101
`define ADD_FUNCT 6'b100000
`define SUB_FUNCT 6'b100010
`define SLT_FUNCT 6'b101010
`define NOR_FUNCT 6'b100111
`define SLL_FUNCT 6'b000000
`define LW   3'b000 //lw || sw || addi
`define BEQ  3'b001
`define ORI  3'b100 
`define ANDI 3'b011

module alu_control (
  input [5:0] funct,
  input [2:0] alu_op,
  output [3:0] aluctrl );

  reg [3:0] funct_val;
  
  reg [3:0] aluctrl_val;
  
  always @(*) begin
    case(funct)
      `AND_FUNCT  : funct_val =  `AND;
      `OR_FUNCT   : funct_val =  `OR ;
      `ADD_FUNCT  : funct_val =  `ADD;
      `SUB_FUNCT  : funct_val =  `SUB;
      `SLT_FUNCT  : funct_val =  `SLT;
      `NOR_FUNCT  : funct_val =  `NOR;
      default: funct_val= 0;
    endcase
  end  
  
  always @(*) begin
    
    aluctrl_val <= 0;
    
    case (alu_op)
      `LW  : aluctrl_val <= 4'd2;//lw sw addi
      `BEQ : aluctrl_val <= 4'd6;//branch
      `ORI : aluctrl_val <= 4'd1;//ori
      `ANDI: aluctrl_val <= 4'd0;//andi
      3'd2 : aluctrl_val <= funct_val;//r type
      default: aluctrl_val <= 0;
    endcase
  end

  assign aluctrl = aluctrl_val;

endmodule
