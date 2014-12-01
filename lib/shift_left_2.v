module shift_left_2 (
  input  [31:0] a,
  output [31:0] b); 

  buf (b[31], a[29]);
  buf (b[30], a[28]);
  buf (b[29], a[27]);
  buf (b[28], a[26]);
  buf (b[27], a[25]);
  buf (b[26], a[24]);
  buf (b[25], a[23]);
  buf (b[24], a[22]);
  buf (b[23], a[21]);
  buf (b[22], a[20]);
  buf (b[21], a[19]);
  buf (b[20], a[18]);
  buf (b[19], a[17]);
  buf (b[18], a[16]);
  buf (b[17], a[15]);
  buf (b[16], a[14]);
  buf (b[15], a[13]);
  buf (b[14], a[12]);
  buf (b[13], a[11]);
  buf (b[12], a[10]);
  buf (b[11], a[9 ]);
  buf (b[10], a[8 ]);
  buf (b[9 ], a[7 ]);
  buf (b[8 ], a[6 ]);
  buf (b[7 ], a[5 ]);
  buf (b[6 ], a[4 ]);
  buf (b[5 ], a[3 ]);
  buf (b[4 ], a[2]);
  buf (b[3 ], a[1 ]);
  buf (b[2 ], a[0 ]);
  buf (b[1 ], 1'b0 );
  buf (b[0 ], 1'b0 );

endmodule
