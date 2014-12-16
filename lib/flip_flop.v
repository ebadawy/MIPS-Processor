`include "../lib/mux_2to1.v"

module d_flip_flop (
  input d, clk, we,
  output q, q_bar);

wire int0, int1, ff_input;

mux_2to1 mux(
    .z(ff_input),
    .i0(q),
    .i1(d),
    .s(we));

nand (int0, ff_input, ~clk);
nand (int1, int0    , ~clk);

nand (q    , int0, q_bar);
nand (q_bar, int1, q    );

endmodule
