module d_flip_flop (
  input d, clk,
  output q, q_bar);

wire int0, int1;

nand (int0, d   , clk);
nand (int1, int0, clk);

nand (q    , int0, q_bar);
nand (q_bar, int1, q    );

endmodule
