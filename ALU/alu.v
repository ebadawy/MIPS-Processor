`define AND 4'b0000
`define OR  4'b0001
`define ADD 4'b0010
`define SUB 4'b0110
`define SLT 4'b0111
`define NOR 4'b1100

module alu (
  input [31:0]a, [31:0]b, [3:0]alu_ct,
  output reg [31:0]z, zero
  );

  always begin
    case(alu_ct)
      `AND: begin
        and (z, a, b);
      end
      `OR: begin
        or (z, a, b);
      end
      `ADD: begin
        add Add_op(z, a, b);
      end
      `SUB: begin
        sub Sub_op(z, a, b);
      end
      `SLT: begin
        slt Slt_op(z, a, b);
      end
      `NOR: begin
        nor (z, a, b);
      end
    default: z <= 0;
  endcase

endmodule
