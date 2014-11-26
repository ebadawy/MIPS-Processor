`include "../ALU/one_bit_alu.v"

module test; 

  reg [3:0] op;
  reg a, b, cin, less;
  wire z, cout, set;
  wire op3_bar, op2_bar, op1_bar, op0_bar, sub;
  
  not ( op3_bar, op[3]);
  not ( op2_bar, op[2]);
  not ( op1_bar, op[1]);
  not ( op0_bar, op[0]);
  and ( sub, op3_bar, op[2], op[1], op0_bar);
  
  one_bit_alu alu0 (
    .op(op), 
    .a(a), 
    .b(b), 
    .cin(cin), 
    .less(less), 
    .sub(sub), 
    .r(z), 
    .cout(cout)); 
    
  initial begin
    $monitor ($time, ": sub=%b\ta=%b\tb=%b\tcin=%b\top=%d\tz=%b\tcout=%b", sub, a, b,cin, op, z, cout);
    #5 a = 0; b = 1; op = 0 ; cin = 0; 
    #5 op = 1 ;   
    #5 a = 1; op = 2;   
    #5 op = 6 ; 
    #5 op = 12; a = 1; b = 0;
    #7;
  end
endmodule
