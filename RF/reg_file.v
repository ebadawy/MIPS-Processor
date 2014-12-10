`include "../RF/reg_32bits.v"
`include "../lib/mux32bits_32to1.v"
`include "../lib/dec_5to32.v"

module reg_file (
  input  [4:0]  readReg1, readReg2, writeReg,
  input  [31:0] writeData,
  input regWrite, clk,
  output [31:0] readData1, readData2);

  wire [31:0] regOutput0, regOutput1, regOutput2, regOutput3, regOutput4, regOutput5, regOutput6, regOutput7, regOutput8, regOutput9, regOutput10, regOutput11, regOutput12, regOutput13, regOutput14, regOutput15, regOutput16, regOutput17, regOutput18, regOutput19, regOutput20, regOutput21, regOutput22, regOutput23, regOutput24, regOutput25, regOutput26, regOutput27, regOutput28, regOutput29, regOutput30, regOutput31; 

  wire [31:0] regInput0, regInput1, regInput2, regInput3, regInput4, regInput5, regInput6, regInput7, regInput8, regInput9, regInput10, regInput11, regInput12, regInput13, regInput14, regInput15, regInput16, regInput17, regInput18, regInput19, regInput20, regInput21, regInput22, regInput23, regInput24, regInput25, regInput26, regInput27, regInput28, regInput29, regInput30, regInput31;

  wire [31:0] we, int;
  wire [31:0] regOutput [31:0];

  dec_5to32 dec (.b(int), .a(writeReg));

  and (we[0 ], regWrite, int[0 ]);
  and (we[1 ], regWrite, int[1 ]);
  and (we[2 ], regWrite, int[2 ]);
  and (we[3 ], regWrite, int[3 ]);
  and (we[4 ], regWrite, int[4 ]);
  and (we[5 ], regWrite, int[5 ]);
  and (we[6 ], regWrite, int[6 ]);
  and (we[7 ], regWrite, int[7 ]);
  and (we[8 ], regWrite, int[8 ]);
  and (we[9 ], regWrite, int[9 ]);
  and (we[10], regWrite, int[10]);
  and (we[11], regWrite, int[11]);
  and (we[12], regWrite, int[12]);
  and (we[13], regWrite, int[13]);
  and (we[14], regWrite, int[14]);
  and (we[15], regWrite, int[15]);
  and (we[16], regWrite, int[16]);
  and (we[17], regWrite, int[17]);
  and (we[18], regWrite, int[18]);
  and (we[19], regWrite, int[19]);
  and (we[20], regWrite, int[20]);
  and (we[21], regWrite, int[21]);
  and (we[22], regWrite, int[22]);
  and (we[23], regWrite, int[23]);
  and (we[24], regWrite, int[24]);
  and (we[25], regWrite, int[25]);
  and (we[26], regWrite, int[26]);
  and (we[27], regWrite, int[27]);
  and (we[28], regWrite, int[28]);
  and (we[29], regWrite, int[29]);
  and (we[30], regWrite, int[30]);
  and (we[31], regWrite, int[31]);

  reg_32bits reg0 (.d(1'b0     ), .q(regOutput0 ), .we(1'b1  ), .clk(clk));
  reg_32bits reg1 (.d(writeData), .q(regOutput1 ), .we(we[1 ]), .clk(clk));
  reg_32bits reg2 (.d(writeData), .q(regOutput2 ), .we(we[2 ]), .clk(clk));
  reg_32bits reg3 (.d(writeData), .q(regOutput3 ), .we(we[3 ]), .clk(clk));
  reg_32bits reg4 (.d(writeData), .q(regOutput4 ), .we(we[4 ]), .clk(clk));
  reg_32bits reg5 (.d(writeData), .q(regOutput5 ), .we(we[5 ]), .clk(clk));
  reg_32bits reg6 (.d(writeData), .q(regOutput6 ), .we(we[6 ]), .clk(clk));
  reg_32bits reg7 (.d(writeData), .q(regOutput7 ), .we(we[7 ]), .clk(clk));
  reg_32bits reg8 (.d(writeData), .q(regOutput8 ), .we(we[8 ]), .clk(clk));
  reg_32bits reg9 (.d(writeData), .q(regOutput9 ), .we(we[9 ]), .clk(clk));
  reg_32bits reg10(.d(writeData), .q(regOutput10), .we(we[10]), .clk(clk));
  reg_32bits reg11(.d(writeData), .q(regOutput11), .we(we[11]), .clk(clk));
  reg_32bits reg12(.d(writeData), .q(regOutput12), .we(we[12]), .clk(clk));
  reg_32bits reg13(.d(writeData), .q(regOutput13), .we(we[13]), .clk(clk));
  reg_32bits reg14(.d(writeData), .q(regOutput14), .we(we[14]), .clk(clk));
  reg_32bits reg15(.d(writeData), .q(regOutput15), .we(we[15]), .clk(clk));
  reg_32bits reg16(.d(writeData), .q(regOutput16), .we(we[16]), .clk(clk));
  reg_32bits reg17(.d(writeData), .q(regOutput17), .we(we[17]), .clk(clk));
  reg_32bits reg18(.d(writeData), .q(regOutput18), .we(we[18]), .clk(clk));
  reg_32bits reg19(.d(writeData), .q(regOutput19), .we(we[19]), .clk(clk));
  reg_32bits reg20(.d(writeData), .q(regOutput20), .we(we[20]), .clk(clk));
  reg_32bits reg21(.d(writeData), .q(regOutput21), .we(we[21]), .clk(clk));
  reg_32bits reg22(.d(writeData), .q(regOutput22), .we(we[22]), .clk(clk));
  reg_32bits reg23(.d(writeData), .q(regOutput23), .we(we[23]), .clk(clk));
  reg_32bits reg24(.d(writeData), .q(regOutput24), .we(we[24]), .clk(clk));
  reg_32bits reg25(.d(writeData), .q(regOutput25), .we(we[25]), .clk(clk));
  reg_32bits reg26(.d(writeData), .q(regOutput26), .we(we[26]), .clk(clk));
  reg_32bits reg27(.d(writeData), .q(regOutput27), .we(we[27]), .clk(clk));
  reg_32bits reg28(.d(writeData), .q(regOutput28), .we(we[28]), .clk(clk));
  reg_32bits reg29(.d(writeData), .q(regOutput29), .we(we[29]), .clk(clk));
  reg_32bits reg30(.d(writeData), .q(regOutput30), .we(we[30]), .clk(clk));
  reg_32bits reg31(.d(writeData), .q(regOutput31), .we(we[31]), .clk(clk));


  mux32bits_32to1 rd1(.z(readData1), .s(readReg1),  .i0(regOutput0), .i1(regOutput1), .i2(regOutput2), .i3(regOutput3), .i4(regOutput4), .i5(regOutput5), .i6(regOutput6), .i7(regOutput7), .i8(regOutput8), .i9(regOutput9), .i10(regOutput10), .i11(regOutput11), .i12(regOutput12), .i13(regOutput13), .i14(regOutput14), .i15(regOutput15), .i16(regOutput16), .i17(regOutput17), .i18(regOutput18), .i19(regOutput19), .i20(regOutput20), .i21(regOutput21), .i22(regOutput22), .i23(regOutput23), .i24(regOutput24), .i25(regOutput25), .i26(regOutput26), .i27(regOutput27), .i28(regOutput28), .i29(regOutput29), .i30(regOutput30), .i31(regOutput31));


  mux32bits_32to1 rd2(.z(readData2), .s(readReg2),  .i0(regOutput0), .i1(regOutput1), .i2(regOutput2), .i3(regOutput3), .i4(regOutput4), .i5(regOutput5), .i6(regOutput6), .i7(regOutput7), .i8(regOutput8), .i9(regOutput9), .i10(regOutput10), .i11(regOutput11), .i12(regOutput12), .i13(regOutput13), .i14(regOutput14), .i15(regOutput15), .i16(regOutput16), .i17(regOutput17), .i18(regOutput18), .i19(regOutput19), .i20(regOutput20), .i21(regOutput21), .i22(regOutput22), .i23(regOutput23), .i24(regOutput24), .i25(regOutput25), .i26(regOutput26), .i27(regOutput27), .i28(regOutput28), .i29(regOutput29), .i30(regOutput30), .i31(regOutput31));

endmodule
