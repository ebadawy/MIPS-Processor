`include "../lib/full_subtractor.v"
module sub (
  output Bor_out,
  output signed [31:0] d,
  input  signed [31:0] a, b
  );
wire [30:0] bor;

full_subtractor sub0  (.Bor_out(bor[ 0]), .d(d[ 0]), .b(a[ 0]), .a(b[ 0]), .Bor_in(0      ));
full_subtractor sub1  (.Bor_out(bor[ 1]), .d(d[ 1]), .b(a[ 1]), .a(b[ 1]), .Bor_in(bor[ 0]));
full_subtractor sub2  (.Bor_out(bor[ 2]), .d(d[ 2]), .b(a[ 2]), .a(b[ 2]), .Bor_in(bor[ 1]));
full_subtractor sub3  (.Bor_out(bor[ 3]), .d(d[ 3]), .b(a[ 3]), .a(b[ 3]), .Bor_in(bor[ 2]));
full_subtractor sub4  (.Bor_out(bor[ 4]), .d(d[ 4]), .b(a[ 4]), .a(b[ 4]), .Bor_in(bor[ 3]));
full_subtractor sub5  (.Bor_out(bor[ 5]), .d(d[ 5]), .b(a[ 5]), .a(b[ 5]), .Bor_in(bor[ 4]));
full_subtractor sub6  (.Bor_out(bor[ 6]), .d(d[ 6]), .b(a[ 6]), .a(b[ 6]), .Bor_in(bor[ 5]));
full_subtractor sub7  (.Bor_out(bor[ 7]), .d(d[ 7]), .b(a[ 7]), .a(b[ 7]), .Bor_in(bor[ 6]));
full_subtractor sub8  (.Bor_out(bor[ 8]), .d(d[ 8]), .b(a[ 8]), .a(b[ 8]), .Bor_in(bor[ 7]));
full_subtractor sub9  (.Bor_out(bor[ 9]), .d(d[ 9]), .b(a[ 9]), .a(b[ 9]), .Bor_in(bor[ 8]));
full_subtractor sub10 (.Bor_out(bor[10]), .d(d[10]), .b(a[10]), .a(b[10]), .Bor_in(bor[ 9]));
full_subtractor sub11 (.Bor_out(bor[11]), .d(d[11]), .b(a[11]), .a(b[11]), .Bor_in(bor[10]));
full_subtractor sub12 (.Bor_out(bor[12]), .d(d[12]), .b(a[12]), .a(b[12]), .Bor_in(bor[11]));
full_subtractor sub13 (.Bor_out(bor[13]), .d(d[13]), .b(a[13]), .a(b[13]), .Bor_in(bor[12]));
full_subtractor sub14 (.Bor_out(bor[14]), .d(d[14]), .b(a[14]), .a(b[14]), .Bor_in(bor[13]));
full_subtractor sub15 (.Bor_out(bor[15]), .d(d[15]), .b(a[15]), .a(b[15]), .Bor_in(bor[14]));
full_subtractor sub16 (.Bor_out(bor[16]), .d(d[16]), .b(a[16]), .a(b[16]), .Bor_in(bor[15]));
full_subtractor sub17 (.Bor_out(bor[17]), .d(d[17]), .b(a[17]), .a(b[17]), .Bor_in(bor[16]));
full_subtractor sub18 (.Bor_out(bor[18]), .d(d[18]), .b(a[18]), .a(b[18]), .Bor_in(bor[17]));
full_subtractor sub19 (.Bor_out(bor[19]), .d(d[19]), .b(a[19]), .a(b[19]), .Bor_in(bor[18]));
full_subtractor sub20 (.Bor_out(bor[20]), .d(d[20]), .b(a[20]), .a(b[20]), .Bor_in(bor[19]));
full_subtractor sub21 (.Bor_out(bor[21]), .d(d[21]), .b(a[21]), .a(b[21]), .Bor_in(bor[20]));
full_subtractor sub22 (.Bor_out(bor[22]), .d(d[22]), .b(a[22]), .a(b[22]), .Bor_in(bor[21]));
full_subtractor sub23 (.Bor_out(bor[23]), .d(d[23]), .b(a[23]), .a(b[23]), .Bor_in(bor[22]));
full_subtractor sub24 (.Bor_out(bor[24]), .d(d[24]), .b(a[24]), .a(b[24]), .Bor_in(bor[23]));
full_subtractor sub25 (.Bor_out(bor[25]), .d(d[25]), .b(a[25]), .a(b[25]), .Bor_in(bor[24]));
full_subtractor sub26 (.Bor_out(bor[26]), .d(d[26]), .b(a[26]), .a(b[26]), .Bor_in(bor[25]));
full_subtractor sub27 (.Bor_out(bor[27]), .d(d[27]), .b(a[27]), .a(b[27]), .Bor_in(bor[26]));
full_subtractor sub28 (.Bor_out(bor[28]), .d(d[28]), .b(a[28]), .a(b[28]), .Bor_in(bor[27]));
full_subtractor sub29 (.Bor_out(bor[29]), .d(d[29]), .b(a[29]), .a(b[29]), .Bor_in(bor[28]));
full_subtractor sub30 (.Bor_out(bor[30]), .d(d[30]), .b(a[30]), .a(b[30]), .Bor_in(bor[29]));
full_subtractor sub31 (.Bor_out(Bor_out), .d(d[31]), .b(a[31]), .a(b[31]), .Bor_in(bor[30]));

endmodule
