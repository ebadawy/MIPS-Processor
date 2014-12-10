`include "../RF/reg_file.v"

module test;

  reg [4:0] readReg1, readReg2, writeReg;
  reg [31:0] writeData;
  reg regWrite, clk;
  wire [31:0] readData1, readData2;

  reg_file rf(.readReg1(readReg1),
    .readReg2(readReg2),
    .writeReg(writeReg),
    .writeData(writeData),
    .regWrite(regWrite),
    .clk(clk),
    .readData1(readData1),
    .readData2(readData2));

  initial begin
    $dumpfile("reg_file_wave.vcd");
    $dumpvars(0, test);
    //$monitor($time, ": readReg1=%5d, readReg2=%5d, writeReg=%5d, writeData=%5d, regWrite=%b, readData1=%5d, readData2=%5d",
      //                  readReg1, readReg2, writeReg, writeData, regWrite, readData1, readData2);
    clk = 0;
    #5 writeReg = 0; writeData = 10; regWrite = 1;
    #5 writeReg = 1; 
    #5 writeReg = 2; 
    #5 writeReg = 3; 
    #5 writeReg = 4; 
    #5 writeReg = 5; 
    #5 writeReg = 6; 
    #5 writeReg = 7; 
    #5 writeReg = 8; 
    #5 writeReg = 9; 
    #5 writeReg = 10; 
    #5 writeReg = 11; 
    #5 writeReg = 12; 
    #5 writeReg = 13; 
    #5 writeReg = 14; 
    #5 writeReg = 15; 
    #5 writeReg = 16; 
    #5 writeReg = 17; 
    #5 writeReg = 18; 
    #5 writeReg = 19; 
    #5 writeReg = 20; 
    #5 writeReg = 21; 
    #5 writeReg = 22; 
    #5 writeReg = 23; 
    #5 writeReg = 24; 
    #5 writeReg = 25; 
    #5 writeReg = 26; 
    #5 writeReg = 27; 
    #5 writeReg = 28; 
    #5 writeReg = 29; 
    #5 writeReg = 30; 
    #5 writeReg = 31; 
    #5 readReg1 = 0; readReg2 = 2;
    #5;
    $display(": readReg1=%5d, readReg2=%5d, writeReg=%5d, writeData=%5d, regWrite=%b, readData1=%5d, readData2=%5d",
                        readReg1, readReg2, writeReg, writeData, regWrite, readData1, readData2);

    $finish;
  end

  always #1 clk = ~clk;

endmodule
