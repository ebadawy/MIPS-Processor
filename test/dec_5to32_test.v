`include "../lib/dec_5to32.v"

module test;

  reg [4:0] a;
  wire [31:0] b;

  dec_5to32 dec (a, b);

  initial begin

    $monitor($time ,": a=%5d, b=%5d",a , b);

    #5 a = 0; 
    #5 a = 5'b00001;
    #5 a = 5'b00100;
    #5 a = 5'b01000;
  end

endmodule
