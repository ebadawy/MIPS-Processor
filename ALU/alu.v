`define AND 4'b0000
`define OR  4'b0001
`define ADD 4'b0010
`define SUB 4'b0110
`define SLT 4'b0111
`define NOR 4'b1100

`include "../ALU/one_bit_alu.v"

module alu (
  input [3:0] op,
  input [7:0] a,
  input [7:0] b,
  output [7:0] z, 
  output zero );

wire sub, set;
wire [6:0] carry;

not ( op3_bar, op[3]);
not ( op2_bar, op[2]);
not ( op1_bar, op[1]);
not ( op0_bar, op[0]);

and ( sub, op3_bar, op[2], op[1], op0_bar);

one_bit_alu alu0 (.op(op), .a(a[0]), .b(b[0]), .cin(sub     ), .less(set ), .sub(sub), .r(z[0]), .cout(carry[0])); 
one_bit_alu alu1 (.op(op), .a(a[1]), .b(b[1]), .cin(carry[0]), .less(1'b0), .sub(sub), .r(z[1]), .cout(carry[1]), .set());
one_bit_alu alu2 (.op(op), .a(a[2]), .b(b[2]), .cin(carry[1]), .less(1'b0), .sub(sub), .r(z[2]), .cout(carry[2]), .set());
one_bit_alu alu3 (.op(op), .a(a[3]), .b(b[3]), .cin(carry[2]), .less(1'b0), .sub(sub), .r(z[3]), .cout(carry[3]), .set());
one_bit_alu alu4 (.op(op), .a(a[4]), .b(b[4]), .cin(carry[3]), .less(1'b0), .sub(sub), .r(z[4]), .cout(carry[4]), .set());
one_bit_alu alu5 (.op(op), .a(a[5]), .b(b[5]), .cin(carry[4]), .less(1'b0), .sub(sub), .r(z[5]), .cout(carry[5]), .set());
one_bit_alu alu6 (.op(op), .a(a[6]), .b(b[6]), .cin(carry[5]), .less(1'b0), .sub(sub), .r(z[6]), .cout(carry[6]), .set());
one_bit_alu alu7 (.op(op), .a(a[7]), .b(b[7]), .cin(carry[6]), .less(1'b0), .sub(sub), .r(z[7]), .cout()        , .set(set));

//  always begin
//    case(alu_ct)
//      `AND: begin
//        and (z, a, b);
//      end
//      `OR: begin
//        or (z, a, b);
//      end
//      `ADD: begin
//        add Add_op(z, a, b);
//      end
//      `SUB: begin
//        sub Sub_op(z, a, b);
//      end
//      `SLT: begin
//        slt Slt_op(z, a, b);
//      end
//      `NOR: begin
//        nor (z, a, b);
//      end
//    default: z <= 0;
//  endcase

endmodule
