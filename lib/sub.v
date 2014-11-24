`include "../lib/full_subtractor.v"
module sub (
  output Bor_out,
  output signed [31:0] d,
  input  signed [31:0] a, b
  );
wire [30:0] bor;

full_subtractor sub0  (.Bor_out(bor[ 0]), .d(d[ 0]), .a(a[ 0]), .b(b[ 0]), .Bor_in(Bor_in ));
full_subtractor sub1  (.Bor_out(bor[ 1]), .d(d[ 1]), .a(a[ 1]), .b(b[ 1]), .Bor_in(bor[ 0]));
full_subtractor sub2  (.Bor_out(bor[ 2]), .d(d[ 2]), .a(a[ 2]), .b(b[ 2]), .Bor_in(bor[ 1]));
full_subtractor sub3  (.Bor_out(bor[ 3]), .d(d[ 3]), .a(a[ 3]), .b(b[ 3]), .Bor_in(bor[ 2]));
full_subtractor sub4  (.Bor_out(bor[ 4]), .d(d[ 4]), .a(a[ 4]), .b(b[ 4]), .Bor_in(bor[ 3]));
full_subtractor sub5  (.Bor_out(bor[ 5]), .d(d[ 5]), .a(a[ 5]), .b(b[ 5]), .Bor_in(bor[ 4]));
full_subtractor sub6  (.Bor_out(bor[ 6]), .d(d[ 6]), .a(a[ 6]), .b(b[ 6]), .Bor_in(bor[ 5]));
full_subtractor sub7  (.Bor_out(bor[ 7]), .d(d[ 7]), .a(a[ 7]), .b(b[ 7]), .Bor_in(bor[ 6]));
full_subtractor sub8  (.Bor_out(bor[ 8]), .d(d[ 8]), .a(a[ 8]), .b(b[ 8]), .Bor_in(bor[ 7]));
full_subtractor sub9  (.Bor_out(bor[ 9]), .d(d[ 9]), .a(a[ 9]), .b(b[ 9]), .Bor_in(bor[ 8]));
full_subtractor sub10 (.Bor_out(bor[10]), .d(d[10]), .a(a[10]), .b(b[10]), .Bor_in(bor[ 9]));
full_subtractor sub11 (.Bor_out(bor[11]), .d(d[11]), .a(a[11]), .b(b[11]), .Bor_in(bor[10]));
full_subtractor sub12 (.Bor_out(bor[12]), .d(d[12]), .a(a[12]), .b(b[12]), .Bor_in(bor[11]));
full_subtractor sub13 (.Bor_out(bor[13]), .d(d[13]), .a(a[13]), .b(b[13]), .Bor_in(bor[12]));
full_subtractor sub14 (.Bor_out(bor[14]), .d(d[14]), .a(a[14]), .b(b[14]), .Bor_in(bor[13]));
full_subtractor sub15 (.Bor_out(bor[15]), .d(d[15]), .a(a[15]), .b(b[15]), .Bor_in(bor[14]));
full_subtractor sub16 (.Bor_out(bor[16]), .d(d[16]), .a(a[16]), .b(b[16]), .Bor_in(bor[15]));
full_subtractor sub17 (.Bor_out(bor[17]), .d(d[17]), .a(a[17]), .b(b[17]), .Bor_in(bor[16]));
full_subtractor sub18 (.Bor_out(bor[18]), .d(d[18]), .a(a[18]), .b(b[18]), .Bor_in(bor[17]));
full_subtractor sub19 (.Bor_out(bor[19]), .d(d[19]), .a(a[19]), .b(b[19]), .Bor_in(bor[18]));
full_subtractor sub20 (.Bor_out(bor[20]), .d(d[20]), .a(a[20]), .b(b[20]), .Bor_in(bor[19]));
full_subtractor sub21 (.Bor_out(bor[21]), .d(d[21]), .a(a[21]), .b(b[21]), .Bor_in(bor[20]));
full_subtractor sub22 (.Bor_out(bor[22]), .d(d[22]), .a(a[22]), .b(b[22]), .Bor_in(bor[21]));
full_subtractor sub23 (.Bor_out(bor[23]), .d(d[23]), .a(a[23]), .b(b[23]), .Bor_in(bor[22]));
full_subtractor sub24 (.Bor_out(bor[24]), .d(d[24]), .a(a[24]), .b(b[24]), .Bor_in(bor[23]));
full_subtractor sub25 (.Bor_out(bor[25]), .d(d[25]), .a(a[25]), .b(b[25]), .Bor_in(bor[24]));
full_subtractor sub26 (.Bor_out(bor[26]), .d(d[26]), .a(a[26]), .b(b[26]), .Bor_in(bor[25]));
full_subtractor sub27 (.Bor_out(bor[27]), .d(d[27]), .a(a[27]), .b(b[27]), .Bor_in(bor[26]));
full_subtractor sub28 (.Bor_out(bor[28]), .d(d[28]), .a(a[28]), .b(b[28]), .Bor_in(bor[27]));
full_subtractor sub29 (.Bor_out(bor[29]), .d(d[29]), .a(a[29]), .b(b[29]), .Bor_in(bor[28]));
full_subtractor sub30 (.Bor_out(bor[30]), .d(d[30]), .a(a[30]), .b(b[30]), .Bor_in(bor[29]));
full_subtractor sub31 (.Bor_out(Bor_out), .d(d[31]), .a(a[31]), .b(b[31]), .Bor_in(bor[30]));

endmodule
