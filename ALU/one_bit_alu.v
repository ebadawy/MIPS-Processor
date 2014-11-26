`include "../lib/full_adder.v"
`include "../lib/mux_16to1.v"

module one_bit_alu (
  input  [3:0] op,
  input  a, b, cin, less, sub,
  output r, cout, set
  );
 
wire and_op, or_op, xor_op, nor_op, add_op, slt_op, xor_b;

and (and_op, a, b);
or  (or_op, a, b);
xor (xor_op, a, b);
nor (xnor_op, a, b);

full_adder add     (.sum(and_op), .a(a), .b(b    ), .cin(cin), .cout(cout));
full_adder subtract(.sum(sub_op), .a(a), .b(xor_b), .cin(cin), .cout(cout));

or (set, sub_op, 1'b1);
wire rr;
mux_16to1 mux(
  .s  (op    ),
  .i0 (and_op),
  .i1 (or_op ),
  .i2 (add_op),
  .i6 (sub_op),
  .i7 (less  ),
  .i12(nor_op),
  .i3 (1'b0  ),
  .i4 (1'b0  ),
  .i5 (1'b0  ),
  .i8 (1'b0  ),
  .i9 (1'b0  ),
  .i10(1'b0  ),
  .i11(1'b0  ),
  .i13(1'b0  ),
  .i14(1'b0  ),
  .i15(1'b0  ),
  .z  (r    ));

endmodule
