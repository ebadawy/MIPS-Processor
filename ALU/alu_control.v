`include "../lib/mux_2to1.v"

module alu_control (
  input [5:0] funct,
  input [1:0] alu_op,
  output [3:0] aluctrl );
  
  wire int0, int1, int2, int3, int4, int5;
  wire funct0_bar, funct1_bar, funct2_bar, funct3_bar, funct4_bar, funct5_bar; 
  wire [3:0] int6;

  not (funct0_bar, funct[0]);
  not (funct1_bar, funct[1]);
  not (funct2_bar, funct[2]);
  not (funct3_bar, funct[3]);
  not (funct4_bar, funct[4]);
  not (funct5_bar, funct[5]);
  
  and (int0, funct[5], funct4_bar, funct3_bar, funct2_bar, funct1_bar, funct0_bar);   //add 100000
  and (int1, funct[5], funct4_bar, funct3_bar, funct2_bar, funct[1]  , funct0_bar);   //sub 100010
  and (int2, funct[5], funct4_bar, funct3_bar, funct[2]  , funct1_bar, funct0_bar);   //and 100100
  and (int3, funct[5], funct4_bar, funct3_bar, funct[2]  , funct1_bar, funct[0]  );   //or  100101
  and (int4, funct[5], funct4_bar, funct[3]  , funct2_bar, funct[1]  , funct0_bar);   //slt 101010
  and (int5, funct[5], funct4_bar, funct3_bar, funct[2]  , funct[1]  , funct[0]  );   //nor 100111

  or  (int6[0], int4, int3);
  or  (int6[1], int4, int1, int0);
  or  (int6[2], int5, int4,int1);
  buf (int6[3], int5);

  mux_2to1 mux0(.z(aluctrl[0]), .i0(1'b0     ), .i1(int6[0]), .s(alu_op[1]));
  mux_2to1 mux1(.z(aluctrl[1]), .i0(1'b1     ), .i1(int6[1]), .s(alu_op[1]));
  mux_2to1 mux2(.z(aluctrl[2]), .i0(alu_op[0]), .i1(int6[2]), .s(alu_op[1]));
  mux_2to1 mux3(.z(aluctrl[3]), .i0(1'b0     ), .i1(int6[3]), .s(alu_op[1]));

endmodule
