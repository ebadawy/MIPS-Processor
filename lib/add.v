`include "../lib/full_adder.v"
module add (
  output cout,
  output [31:0] sum,
  input [31:0] a, b,
  input cin
  );
wire [30:0] carry;

full_adder addr0  (.cout(carry[ 0]), .sum(sum[ 0]), .a(a[ 0]), .b(b[ 0]), .cin(cin      ));
full_adder addr1  (.cout(carry[ 1]), .sum(sum[ 1]), .a(a[ 1]), .b(b[ 1]), .cin(carry[ 0]));
full_adder addr2  (.cout(carry[ 2]), .sum(sum[ 2]), .a(a[ 2]), .b(b[ 2]), .cin(carry[ 1]));
full_adder addr3  (.cout(carry[ 3]), .sum(sum[ 3]), .a(a[ 3]), .b(b[ 3]), .cin(carry[ 2]));
full_adder addr4  (.cout(carry[ 4]), .sum(sum[ 4]), .a(a[ 4]), .b(b[ 4]), .cin(carry[ 3]));
full_adder addr5  (.cout(carry[ 5]), .sum(sum[ 5]), .a(a[ 5]), .b(b[ 5]), .cin(carry[ 4]));
full_adder addr6  (.cout(carry[ 6]), .sum(sum[ 6]), .a(a[ 6]), .b(b[ 6]), .cin(carry[ 5]));
full_adder addr7  (.cout(carry[ 7]), .sum(sum[ 7]), .a(a[ 7]), .b(b[ 7]), .cin(carry[ 6]));
full_adder addr8  (.cout(carry[ 8]), .sum(sum[ 8]), .a(a[ 8]), .b(b[ 8]), .cin(carry[ 7]));
full_adder addr9  (.cout(carry[ 9]), .sum(sum[ 9]), .a(a[ 9]), .b(b[ 9]), .cin(carry[ 8]));
full_adder addr10 (.cout(carry[10]), .sum(sum[10]), .a(a[10]), .b(b[10]), .cin(carry[ 9]));
full_adder addr11 (.cout(carry[11]), .sum(sum[11]), .a(a[11]), .b(b[11]), .cin(carry[10]));
full_adder addr12 (.cout(carry[12]), .sum(sum[12]), .a(a[12]), .b(b[12]), .cin(carry[11]));
full_adder addr13 (.cout(carry[13]), .sum(sum[13]), .a(a[13]), .b(b[13]), .cin(carry[12]));
full_adder addr14 (.cout(carry[14]), .sum(sum[14]), .a(a[14]), .b(b[14]), .cin(carry[13]));
full_adder addr15 (.cout(carry[15]), .sum(sum[15]), .a(a[15]), .b(b[15]), .cin(carry[14]));
full_adder addr16 (.cout(carry[16]), .sum(sum[16]), .a(a[16]), .b(b[16]), .cin(carry[15]));
full_adder addr17 (.cout(carry[17]), .sum(sum[17]), .a(a[17]), .b(b[17]), .cin(carry[16]));
full_adder addr18 (.cout(carry[18]), .sum(sum[18]), .a(a[18]), .b(b[18]), .cin(carry[17]));
full_adder addr19 (.cout(carry[19]), .sum(sum[19]), .a(a[19]), .b(b[19]), .cin(carry[18]));
full_adder addr20 (.cout(carry[20]), .sum(sum[20]), .a(a[20]), .b(b[20]), .cin(carry[19]));
full_adder addr21 (.cout(carry[21]), .sum(sum[21]), .a(a[21]), .b(b[21]), .cin(carry[20]));
full_adder addr22 (.cout(carry[22]), .sum(sum[22]), .a(a[22]), .b(b[22]), .cin(carry[21]));
full_adder addr23 (.cout(carry[23]), .sum(sum[23]), .a(a[23]), .b(b[23]), .cin(carry[22]));
full_adder addr24 (.cout(carry[24]), .sum(sum[24]), .a(a[24]), .b(b[24]), .cin(carry[23]));
full_adder addr25 (.cout(carry[25]), .sum(sum[25]), .a(a[25]), .b(b[25]), .cin(carry[24]));
full_adder addr26 (.cout(carry[26]), .sum(sum[26]), .a(a[26]), .b(b[26]), .cin(carry[25]));
full_adder addr27 (.cout(carry[27]), .sum(sum[27]), .a(a[27]), .b(b[27]), .cin(carry[26]));
full_adder addr28 (.cout(carry[28]), .sum(sum[28]), .a(a[28]), .b(b[28]), .cin(carry[27]));
full_adder addr29 (.cout(carry[29]), .sum(sum[29]), .a(a[29]), .b(b[29]), .cin(carry[28]));
full_adder addr30 (.cout(carry[30]), .sum(sum[30]), .a(a[30]), .b(b[30]), .cin(carry[29]));
full_adder addr31 (.cout(cout     ), .sum(sum[31]), .a(a[31]), .b(b[31]), .cin(carry[30]));

endmodule
