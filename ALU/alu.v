`define AND 4'b0000
`define OR  4'b0001
`define ADD 4'b0010
`define SUB 4'b0110
`define SLT 4'b0111
`define NOR 4'b1100

`include "../ALU/one_bit_alu.v"

module alu (
  input [3:0] op,
  input signed [31:0] a, b,
  output signed [31:0] z, 
  output zero);

wire set;
wire [30:0] carry;

one_bit_alu alu0  (.op(op), .r(z[0 ]), .a(a[0 ]), .b(b[0 ]), .cin(1'b0     ), .cout(carry[0 ]), .less(set )); 
one_bit_alu alu1  (.op(op), .r(z[1 ]), .a(a[1 ]), .b(b[1 ]), .cin(carry[0 ]), .cout(carry[1 ]), .less(1'b0));
one_bit_alu alu2  (.op(op), .r(z[2 ]), .a(a[2 ]), .b(b[2 ]), .cin(carry[1 ]), .cout(carry[2 ]), .less(1'b0));
one_bit_alu alu3  (.op(op), .r(z[3 ]), .a(a[3 ]), .b(b[3 ]), .cin(carry[2 ]), .cout(carry[3 ]), .less(1'b0));
one_bit_alu alu4  (.op(op), .r(z[4 ]), .a(a[4 ]), .b(b[4 ]), .cin(carry[3 ]), .cout(carry[4 ]), .less(1'b0));
one_bit_alu alu5  (.op(op), .r(z[5 ]), .a(a[5 ]), .b(b[5 ]), .cin(carry[4 ]), .cout(carry[5 ]), .less(1'b0));
one_bit_alu alu6  (.op(op), .r(z[6 ]), .a(a[6 ]), .b(b[6 ]), .cin(carry[5 ]), .cout(carry[6 ]), .less(1'b0));
one_bit_alu alu7  (.op(op), .r(z[7 ]), .a(a[7 ]), .b(b[7 ]), .cin(carry[6 ]), .cout(carry[7 ]), .less(1'b0));
one_bit_alu alu8  (.op(op), .r(z[8 ]), .a(a[8 ]), .b(b[8 ]), .cin(carry[7 ]), .cout(carry[8 ]), .less(1'b0));
one_bit_alu alu9  (.op(op), .r(z[9 ]), .a(a[9 ]), .b(b[9 ]), .cin(carry[8 ]), .cout(carry[9 ]), .less(1'b0));
one_bit_alu alu10 (.op(op), .r(z[10]), .a(a[10]), .b(b[10]), .cin(carry[9 ]), .cout(carry[10]), .less(1'b0));
one_bit_alu alu11 (.op(op), .r(z[11]), .a(a[11]), .b(b[11]), .cin(carry[10]), .cout(carry[11]), .less(1'b0));
one_bit_alu alu12 (.op(op), .r(z[12]), .a(a[12]), .b(b[12]), .cin(carry[11]), .cout(carry[12]), .less(1'b0));
one_bit_alu alu13 (.op(op), .r(z[13]), .a(a[13]), .b(b[13]), .cin(carry[12]), .cout(carry[13]), .less(1'b0));
one_bit_alu alu14 (.op(op), .r(z[14]), .a(a[14]), .b(b[14]), .cin(carry[13]), .cout(carry[14]), .less(1'b0));
one_bit_alu alu15 (.op(op), .r(z[15]), .a(a[15]), .b(b[15]), .cin(carry[14]), .cout(carry[15]), .less(1'b0));
one_bit_alu alu16 (.op(op), .r(z[16]), .a(a[16]), .b(b[16]), .cin(carry[15]), .cout(carry[16]), .less(1'b0));
one_bit_alu alu17 (.op(op), .r(z[17]), .a(a[17]), .b(b[17]), .cin(carry[16]), .cout(carry[17]), .less(1'b0));
one_bit_alu alu18 (.op(op), .r(z[18]), .a(a[18]), .b(b[18]), .cin(carry[17]), .cout(carry[18]), .less(1'b0));
one_bit_alu alu19 (.op(op), .r(z[19]), .a(a[19]), .b(b[19]), .cin(carry[18]), .cout(carry[19]), .less(1'b0));
one_bit_alu alu20 (.op(op), .r(z[20]), .a(a[20]), .b(b[20]), .cin(carry[19]), .cout(carry[20]), .less(1'b0));
one_bit_alu alu21 (.op(op), .r(z[21]), .a(a[21]), .b(b[21]), .cin(carry[20]), .cout(carry[21]), .less(1'b0));
one_bit_alu alu22 (.op(op), .r(z[22]), .a(a[22]), .b(b[22]), .cin(carry[21]), .cout(carry[22]), .less(1'b0));
one_bit_alu alu23 (.op(op), .r(z[23]), .a(a[23]), .b(b[23]), .cin(carry[22]), .cout(carry[23]), .less(1'b0));
one_bit_alu alu24 (.op(op), .r(z[24]), .a(a[24]), .b(b[24]), .cin(carry[23]), .cout(carry[24]), .less(1'b0));
one_bit_alu alu25 (.op(op), .r(z[25]), .a(a[25]), .b(b[25]), .cin(carry[24]), .cout(carry[25]), .less(1'b0));
one_bit_alu alu26 (.op(op), .r(z[26]), .a(a[26]), .b(b[26]), .cin(carry[25]), .cout(carry[26]), .less(1'b0));
one_bit_alu alu27 (.op(op), .r(z[27]), .a(a[27]), .b(b[27]), .cin(carry[26]), .cout(carry[27]), .less(1'b0));
one_bit_alu alu28 (.op(op), .r(z[28]), .a(a[28]), .b(b[28]), .cin(carry[27]), .cout(carry[28]), .less(1'b0));
one_bit_alu alu29 (.op(op), .r(z[29]), .a(a[29]), .b(b[29]), .cin(carry[28]), .cout(carry[29]), .less(1'b0));
one_bit_alu alu30 (.op(op), .r(z[30]), .a(a[30]), .b(b[30]), .cin(carry[29]), .cout(carry[30]), .less(1'b0));
one_bit_alu alu31 (.op(op), .r(z[31]), .a(a[31]), .b(b[31]), .cin(carry[30]), .set (set      ), .less(1'b0));

nor (zero, z[0 ], z[1 ], z[2 ], z[3 ], z[4 ], z[5 ], z[6 ], z[7 ], z[8 ], z[9 ],
           z[10], z[11], z[12], z[13], z[14], z[15], z[16], z[17], z[18], z[19],
           z[20], z[21], z[22], z[23], z[24], z[25], z[26], z[27], z[28], z[29], 
           z[30], z[31]);

endmodule
