module mux32bit_2to1(input [31:0] i0, i1,
                    input s,
                    output [31:0] z);

  mux_2to1 mux0 (.i0(i0[0 ]), .i1(i1[0 ]), .z(z[0 ]), .s(s));
  mux_2to1 mux1 (.i0(i0[1 ]), .i1(i1[1 ]), .z(z[1 ]), .s(s));
  mux_2to1 mux2 (.i0(i0[2 ]), .i1(i1[2 ]), .z(z[2 ]), .s(s));
  mux_2to1 mux3 (.i0(i0[3 ]), .i1(i1[3 ]), .z(z[3 ]), .s(s));
  mux_2to1 mux4 (.i0(i0[4 ]), .i1(i1[4 ]), .z(z[4 ]), .s(s));
  mux_2to1 mux5 (.i0(i0[5 ]), .i1(i1[5 ]), .z(z[5 ]), .s(s));
  mux_2to1 mux6 (.i0(i0[6 ]), .i1(i1[6 ]), .z(z[6 ]), .s(s));
  mux_2to1 mux7 (.i0(i0[7 ]), .i1(i1[7 ]), .z(z[7 ]), .s(s));
  mux_2to1 mux8 (.i0(i0[8 ]), .i1(i1[8 ]), .z(z[8 ]), .s(s));
  mux_2to1 mux9 (.i0(i0[9 ]), .i1(i1[9 ]), .z(z[9 ]), .s(s));
  mux_2to1 mux10(.i0(i0[10]), .i1(i1[10]), .z(z[10]), .s(s));
  mux_2to1 mux11(.i0(i0[11]), .i1(i1[11]), .z(z[11]), .s(s));
  mux_2to1 mux12(.i0(i0[12]), .i1(i1[12]), .z(z[12]), .s(s));
  mux_2to1 mux13(.i0(i0[13]), .i1(i1[13]), .z(z[13]), .s(s));
  mux_2to1 mux14(.i0(i0[14]), .i1(i1[14]), .z(z[14]), .s(s));
  mux_2to1 mux15(.i0(i0[15]), .i1(i1[15]), .z(z[15]), .s(s));
  mux_2to1 mux16(.i0(i0[16]), .i1(i1[16]), .z(z[16]), .s(s));
  mux_2to1 mux17(.i0(i0[17]), .i1(i1[17]), .z(z[17]), .s(s));
  mux_2to1 mux18(.i0(i0[18]), .i1(i1[18]), .z(z[18]), .s(s));
  mux_2to1 mux19(.i0(i0[19]), .i1(i1[19]), .z(z[19]), .s(s));
  mux_2to1 mux20(.i0(i0[20]), .i1(i1[20]), .z(z[20]), .s(s));
  mux_2to1 mux21(.i0(i0[21]), .i1(i1[21]), .z(z[21]), .s(s));
  mux_2to1 mux22(.i0(i0[22]), .i1(i1[22]), .z(z[22]), .s(s));
  mux_2to1 mux23(.i0(i0[23]), .i1(i1[23]), .z(z[23]), .s(s));
  mux_2to1 mux24(.i0(i0[24]), .i1(i1[24]), .z(z[24]), .s(s));
  mux_2to1 mux25(.i0(i0[25]), .i1(i1[25]), .z(z[25]), .s(s));
  mux_2to1 mux26(.i0(i0[26]), .i1(i1[26]), .z(z[26]), .s(s));
  mux_2to1 mux27(.i0(i0[27]), .i1(i1[27]), .z(z[27]), .s(s));
  mux_2to1 mux28(.i0(i0[28]), .i1(i1[28]), .z(z[28]), .s(s));
  mux_2to1 mux29(.i0(i0[29]), .i1(i1[29]), .z(z[29]), .s(s));
  mux_2to1 mux30(.i0(i0[30]), .i1(i1[30]), .z(z[30]), .s(s));
  mux_2to1 mux31(.i0(i0[31]), .i1(i1[31]), .z(z[31]), .s(s));
endmodule
