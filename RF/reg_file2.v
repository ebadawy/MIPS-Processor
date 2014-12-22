`include "../RF/reg_32bits.v"
`include "../lib/mux32bits_32to1.v"
`include "../lib/dec_5to32.v"

module reg_file (
  input  [4:0]  readReg1, readReg2, writeReg,
  input  [31:0] writeData,
  input regWrite, clk,
  output [31:0] readData1, readData2);
  reg [5:0]i;
  reg [31:0] regs [0:31];
  initial begin
    for(i = 0; i < 32; i = i + 1) begin
      regs[i] = 0;
    end
  end

  always @(negedge clk) begin
    if(regWrite && writeReg != 0)  
      regs[writeReg] = writeData;
  end
  
  assign readData1 = (readReg1 != 0) ? regs[readReg1] : 0;
  assign readData2 = (readReg2 != 0) ? regs[readReg2] : 0;

endmodule
