`include "../mem/im.v"
`include "../RF/reg_file.v"
`include "../ALU/alu.v"
`include "../lib/mux5bit_2to1.v"
`include "../lib/mux32bit_2to1.v"
`include "../lib/sign_extend.v"
`include "../control/control2.v"
`include "../ALU/alu_control2.v"
`include "../mem/dm.v"
`include "../lib/shift_left_2.v"
`include "../lib/jump_addr.v"

module cpu(input clk,
           output [31:0] alu_output, data);

  reg [31:0] pc;
  wire [31:0] readData1, readData2, b;
  wire regDest0, regDst1, regWrite, aluSrc, zero, memToReg0, memToReg1; 
  wire memRead, memWrite, branch, branch_ne, s_branch, jump;
  wire [31:0] sExtended, alu_output, memData, writeData, j_addr, mux3_output;
  wire [3:0] alu_ctrl;
  wire [2:0] alu_op;
  wire [4:0] writeReg;
  wire [31:0] fa1_output, ex_shifted, nxt_pc, pc_4;
  initial pc <= 32'd0;
  im i_mem(.clk(clk),
           .data(data),
           .addr(pc));
  mux5bit_4to1 mux0(.i0(data[20:16]), 
.i1(data[15:11]), 
.i2(5'd31), 
.s({regDst1, regDst0}), 
.z(writeReg));

  reg_file        rf(.readReg1(data[25:21]),
                     .readReg2(data[20:16]),
                     .writeReg(writeReg),
                     .clk(clk),
                     .regWrite(regWrite),
                     .readData1(readData1),
                     .readData2(readData2),
                     .writeData(writeData));

  sign_extend     se(.a(data[15:0]), .b(sExtended));
  mux32bit_2to1   mux1(.i0(readData2),
                       .i1(sExtended), 
                       .s(aluSrc), 
                       .z(b));

  alu             main_alu(.op(alu_ctrl), .a(readData1), .b(b), .z(alu_output), .zero(zero));
  alu_control     ac  (.funct(data[5:0]), .alu_op(alu_op), .aluctrl(alu_ctrl));
  control         c(.op(data[31:26]), 
                    .alu_op(alu_op), 
                    .regDst0(regDst0), 
                    .regDst1(regDst1), 
                    .aluSrc(aluSrc), 
                    .memToReg0(memToReg0), 
                    .memToReg1(memToReg1), 
                    .regWrite(regWrite), 
                    .memRead(memRead), 
                    .memWrite(memWrite), 
                    .branch(branch),
                    .branch_ne(branch_ne),
                    .jump(jump));
  dm mem(.clk(clk), .addr(alu_output), .writeData(readData2), .memWrite(memWrite), .memRead(memRead), .readData(memData));  
  
  mux32bit_4to1 mux2(.i0(alu_output), .i1(memData), .i2(pc_4), .s({memToReg1, memToReg0}), .z(writeData));
  shift_left_2 sll2(.a(sExtended), .b(ex_shifted));

  //alu             fa1(.op(4'd2), .a(pc_4), .b(ex_shifted), .z(fa1_output));
  alu             fa1(.op(4'd2), .a(pc_4), .b(sExtended), .z(fa1_output));
  wire int0, int1;
  and (int0, branch, zero);
  and (int1, branch_ne, ~zero);
  or (s_branch, int0, int1);
  
  jump_addr ja(.inst(data[25:0]), .pc_4(pc_4[31:28]), .j_addr(j_addr));

  //mux32bit_2to1 mux3(.i0(pc_4), .i1(fa1_output), .s(s_branch), .z(nxt_pc));
  mux32bit_2to1_2 mux3(.i0(pc_4), .i1(fa1_output), .s(s_branch), .z(mux3_output));
  mux32bit_2to1_2 mux4(.i0(mux3_output), .i1(j_addr), .s(jump), .z(mux4_output));
  mux32bit_2to1_2 mux5(.i1(readData1), .i0(mux4_output), .z(nxt_pc), .s(jr)); 

  //mux32bit_2to1 mux4(.i1(j_addr), .i0(mux3_output), .z(nxt_pc), .s(jump)); 
    
  alu             fa2(.op(4'd2), .a(pc), .b(32'd1), .z(pc_4));
  
  always @(posedge clk) begin
    pc <= nxt_pc;
  end
  
endmodule
