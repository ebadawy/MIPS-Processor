module mux5bit_4to1 (
  input [4:0] i0, i1, i2, i3,
  input [1:0] s ,
  output [4:0] z
);
  
  reg [4:0] z;

  initial z = 0;

  always @(*) begin
      case(s)
        2'b00 : z = i0;
        2'b01 : z = i1;
        2'b10 : z = i2;
        2'b11 : z = i3;
      endcase
  end

endmodule
