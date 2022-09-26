`timescale 1ns/1ns
module Shifter( dataA, dataB, Signal, dataOut, reset ); // SLL
  input reset ;
  input [31:0] dataA ;
  input [31:0] dataB ;
  input [5:0] Signal ;
  output [31:0] dataOut ;

 // reg [31:0] temp ;
  // parameter SLL = 6'b000000 ;

  wire [31:0] out1 ; // ²Ä¤@¼houtput
  wire [31:0] out2 ;
  wire [31:0] out3 ;
  wire [31:0] out4 ;
  wire [31:0] out5 ;

// MUX2to1( input0, input1, out, signal ) Level1
  MUX2to1 level1_0( dataA[0], 1'b0, out1[0], dataB[0]) ;
  MUX2to1 level1_1( dataA[1], dataA[0], out1[1], dataB[0]) ;
  MUX2to1 level1_2( dataA[2], dataA[1], out1[2], dataB[0]) ;
  MUX2to1 level1_3( dataA[3], dataA[2], out1[3], dataB[0]) ;
  MUX2to1 level1_4( dataA[4], dataA[3], out1[4], dataB[0]) ;
  MUX2to1 level1_5( dataA[5], dataA[4], out1[5], dataB[0]) ;
  MUX2to1 level1_6( dataA[6], dataA[5], out1[6], dataB[0]) ;
  MUX2to1 level1_7( dataA[7], dataA[6], out1[7], dataB[0]) ;
  MUX2to1 level1_8( dataA[8], dataA[7], out1[8], dataB[0]) ;
  MUX2to1 level1_9( dataA[9], dataA[8], out1[9], dataB[0]) ;
  MUX2to1 level1_10( dataA[10], dataA[9], out1[10], dataB[0]) ;
  MUX2to1 level1_11( dataA[11], dataA[10], out1[11], dataB[0]) ;
  MUX2to1 level1_12( dataA[12], dataA[11], out1[12], dataB[0]) ;
  MUX2to1 level1_13( dataA[13], dataA[12], out1[13], dataB[0]) ;
  MUX2to1 level1_14( dataA[14], dataA[13], out1[14], dataB[0]) ;
  MUX2to1 level1_15( dataA[15], dataA[14], out1[15], dataB[0]) ;
  MUX2to1 level1_16( dataA[16], dataA[15], out1[16], dataB[0]) ;
  MUX2to1 level1_17( dataA[17], dataA[16], out1[17], dataB[0]) ;
  MUX2to1 level1_18( dataA[18], dataA[17], out1[18], dataB[0]) ;
  MUX2to1 level1_19( dataA[19], dataA[18], out1[19], dataB[0]) ;
  MUX2to1 level1_20( dataA[20], dataA[19], out1[20], dataB[0]) ;
  MUX2to1 level1_21( dataA[21], dataA[20], out1[21], dataB[0]) ;
  MUX2to1 level1_22( dataA[22], dataA[21], out1[22], dataB[0]) ;
  MUX2to1 level1_23( dataA[23], dataA[22], out1[23], dataB[0]) ;
  MUX2to1 level1_24( dataA[24], dataA[23], out1[24], dataB[0]) ;
  MUX2to1 level1_25( dataA[25], dataA[24], out1[25], dataB[0]) ;
  MUX2to1 level1_26( dataA[26], dataA[25], out1[26], dataB[0]) ;
  MUX2to1 level1_27( dataA[27], dataA[26], out1[27], dataB[0]) ;
  MUX2to1 level1_28( dataA[28], dataA[27], out1[28], dataB[0]) ;
  MUX2to1 level1_29( dataA[29], dataA[28], out1[29], dataB[0]) ;
  MUX2to1 level1_30( dataA[30], dataA[29], out1[30], dataB[0]) ;
  MUX2to1 level1_31( dataA[31], dataA[30], out1[31], dataB[0]) ;

// MUX2to1( input0, input1, out, signal ) Level2 
  MUX2to1 level2_0( out1[0], 1'b0, out2[0], dataB[1]) ;
  MUX2to1 level2_1( out1[1], 1'b0, out2[1], dataB[1]) ;
  MUX2to1 level2_2( out1[2], out1[0], out2[2], dataB[1]) ;
  MUX2to1 level2_3( out1[3], out1[1], out2[3], dataB[1]) ;
  MUX2to1 level2_4( out1[4], out1[2], out2[4], dataB[1]) ;
  MUX2to1 level2_5( out1[5], out1[3], out2[5], dataB[1]) ;
  MUX2to1 level2_6( out1[6], out1[4], out2[6], dataB[1]) ;
  MUX2to1 level2_7( out1[7], out1[5], out2[7], dataB[1]) ;
  MUX2to1 level2_8( out1[8], out1[6], out2[8], dataB[1]) ;
  MUX2to1 level2_9( out1[9], out1[7], out2[9], dataB[1]) ;
  MUX2to1 level2_10( out1[10], out1[8], out2[10], dataB[1]) ;
  MUX2to1 level2_11( out1[11], out1[9], out2[11], dataB[1]) ;
  MUX2to1 level2_12( out1[12], out1[10], out2[12], dataB[1]) ;
  MUX2to1 level2_13( out1[13], out1[11], out2[13], dataB[1]) ;
  MUX2to1 level2_14( out1[14], out1[12], out2[14], dataB[1]) ;
  MUX2to1 level2_15( out1[15], out1[13], out2[15], dataB[1]) ;
  MUX2to1 level2_16( out1[16], out1[14], out2[16], dataB[1]) ;
  MUX2to1 level2_17( out1[17], out1[15], out2[17], dataB[1]) ;
  MUX2to1 level2_18( out1[18], out1[16], out2[18], dataB[1]) ;
  MUX2to1 level2_19( out1[19], out1[17], out2[19], dataB[1]) ;
  MUX2to1 level2_20( out1[20], out1[18], out2[20], dataB[1]) ;
  MUX2to1 level2_21( out1[21], out1[19], out2[21], dataB[1]) ;
  MUX2to1 level2_22( out1[22], out1[20], out2[22], dataB[1]) ;
  MUX2to1 level2_23( out1[23], out1[21], out2[23], dataB[1]) ;
  MUX2to1 level2_24( out1[24], out1[22], out2[24], dataB[1]) ;
  MUX2to1 level2_25( out1[25], out1[23], out2[25], dataB[1]) ;
  MUX2to1 level2_26( out1[26], out1[24], out2[26], dataB[1]) ;
  MUX2to1 level2_27( out1[27], out1[25], out2[27], dataB[1]) ;
  MUX2to1 level2_28( out1[28], out1[26], out2[28], dataB[1]) ;
  MUX2to1 level2_29( out1[29], out1[27], out2[29], dataB[1]) ;
  MUX2to1 level2_30( out1[30], out1[28], out2[30], dataB[1]) ;
  MUX2to1 level2_31( out1[31], out1[29], out2[31], dataB[1]) ;
  
// MUX2to1( input0, input1, out, signal ) Level3
  MUX2to1 level3_0( out2[0], 1'b0, out3[0], dataB[2]) ;
  MUX2to1 level3_1( out2[1], 1'b0, out3[1], dataB[2]) ;
  MUX2to1 level3_2( out2[2], 1'b0, out3[2], dataB[2]) ;
  MUX2to1 level3_3( out2[3], 1'b0, out3[3], dataB[2]) ;
  MUX2to1 level3_4( out2[4], out2[0], out3[4], dataB[2]) ;
  MUX2to1 level3_5( out2[5], out2[1], out3[5], dataB[2]) ;
  MUX2to1 level3_6( out2[6], out2[2], out3[6], dataB[2]) ;
  MUX2to1 level3_7( out2[7], out2[3], out3[7], dataB[2]) ;
  MUX2to1 level3_8( out2[8], out2[4], out3[8], dataB[2]) ;
  MUX2to1 level3_9( out2[9], out2[5], out3[9], dataB[2]) ;
  MUX2to1 level3_10( out2[10], out2[6], out3[10], dataB[2]) ;
  MUX2to1 level3_11( out2[11], out2[7], out3[11], dataB[2]) ;
  MUX2to1 level3_12( out2[12], out2[8], out3[12], dataB[2]) ;
  MUX2to1 level3_13( out2[13], out2[9], out3[13], dataB[2]) ;
  MUX2to1 level3_14( out2[14], out2[10], out3[14], dataB[2]) ;
  MUX2to1 level3_15( out2[15], out2[11], out3[15], dataB[2]) ;
  MUX2to1 level3_16( out2[16], out2[12], out3[16], dataB[2]) ;
  MUX2to1 level3_17( out2[17], out2[13], out3[17], dataB[2]) ;
  MUX2to1 level3_18( out2[18], out2[14], out3[18], dataB[2]) ;
  MUX2to1 level3_19( out2[19], out2[15], out3[19], dataB[2]) ;
  MUX2to1 level3_20( out2[20], out2[16], out3[20], dataB[2]) ;
  MUX2to1 level3_21( out2[21], out2[17], out3[21], dataB[2]) ;
  MUX2to1 level3_22( out2[22], out2[18], out3[22], dataB[2]) ;
  MUX2to1 level3_23( out2[23], out2[19], out3[23], dataB[2]) ;
  MUX2to1 level3_24( out2[24], out2[20], out3[24], dataB[2]) ;
  MUX2to1 level3_25( out2[25], out2[21], out3[25], dataB[2]) ;
  MUX2to1 level3_26( out2[26], out2[22], out3[26], dataB[2]) ;
  MUX2to1 level3_27( out2[27], out2[23], out3[27], dataB[2]) ;
  MUX2to1 level3_28( out2[28], out2[24], out3[28], dataB[2]) ;
  MUX2to1 level3_29( out2[29], out2[25], out3[29], dataB[2]) ;
  MUX2to1 level3_30( out2[30], out2[26], out3[30], dataB[2]) ;
  MUX2to1 level3_31( out2[31], out2[27], out3[31], dataB[2]) ;
  
// MUX2to1( input0, input1, out, signal ) Level4
  MUX2to1 level4_0( out3[0], 1'b0, out4[0], dataB[3]) ;
  MUX2to1 level4_1( out3[1], 1'b0, out4[1], dataB[3]) ;
  MUX2to1 level4_2( out3[2], 1'b0, out4[2], dataB[3]) ;
  MUX2to1 level4_3( out3[3], 1'b0, out4[3], dataB[3]) ;
  MUX2to1 level4_4( out3[4], 1'b0, out4[4], dataB[3]) ;
  MUX2to1 level4_5( out3[5], 1'b0, out4[5], dataB[3]) ;
  MUX2to1 level4_6( out3[6], 1'b0, out4[6], dataB[3]) ;
  MUX2to1 level4_7( out3[7], 1'b0, out4[7], dataB[3]) ;
  MUX2to1 level4_8( out3[8], out3[0], out4[8], dataB[3]) ;
  MUX2to1 level4_9( out3[9], out3[1], out4[9], dataB[3]) ;
  MUX2to1 level4_10( out3[10], out3[2], out4[10], dataB[3]) ;
  MUX2to1 level4_11( out3[11], out3[3], out4[11], dataB[3]) ;
  MUX2to1 level4_12( out3[12], out3[4], out4[12], dataB[3]) ;
  MUX2to1 level4_13( out3[13], out3[5], out4[13], dataB[3]) ;
  MUX2to1 level4_14( out3[14], out3[6], out4[14], dataB[3]) ;
  MUX2to1 level4_15( out3[15], out3[7], out4[15], dataB[3]) ;
  MUX2to1 level4_16( out3[16], out3[8], out4[16], dataB[3]) ;
  MUX2to1 level4_17( out3[17], out3[9], out4[17], dataB[3]) ;
  MUX2to1 level4_18( out3[18], out3[10], out4[18], dataB[3]) ;
  MUX2to1 level4_19( out3[19], out3[11], out4[19], dataB[3]) ;
  MUX2to1 level4_20( out3[20], out3[12], out4[20], dataB[3]) ;
  MUX2to1 level4_21( out3[21], out3[13], out4[21], dataB[3]) ;
  MUX2to1 level4_22( out3[22], out3[14], out4[22], dataB[3]) ;
  MUX2to1 level4_23( out3[23], out3[15], out4[23], dataB[3]) ;
  MUX2to1 level4_24( out3[24], out3[16], out4[24], dataB[3]) ;
  MUX2to1 level4_25( out3[25], out3[17], out4[25], dataB[3]) ;
  MUX2to1 level4_26( out3[26], out3[18], out4[26], dataB[3]) ;
  MUX2to1 level4_27( out3[27], out3[19], out4[27], dataB[3]) ;
  MUX2to1 level4_28( out3[28], out3[20], out4[28], dataB[3]) ;
  MUX2to1 level4_29( out3[29], out3[21], out4[29], dataB[3]) ;
  MUX2to1 level4_30( out3[30], out3[22], out4[30], dataB[3]) ;
  MUX2to1 level4_31( out3[31], out3[23], out4[31], dataB[3]) ;
  
// MUX2to1( input0, input1, out, signal ) Level5
  MUX2to1 level5_0( out4[0], 1'b0, out5[0], dataB[4]) ;
  MUX2to1 level5_1( out4[1], 1'b0, out5[1], dataB[4]) ;
  MUX2to1 level5_2( out4[2], 1'b0, out5[2], dataB[4]) ;
  MUX2to1 level5_3( out4[3], 1'b0, out5[3], dataB[4]) ;
  MUX2to1 level5_4( out4[4], 1'b0, out5[4], dataB[4]) ;
  MUX2to1 level5_5( out4[5], 1'b0, out5[5], dataB[4]) ;
  MUX2to1 level5_6( out4[6], 1'b0, out5[6], dataB[4]) ;
  MUX2to1 level5_7( out4[7], 1'b0, out5[7], dataB[4]) ;
  MUX2to1 level5_8( out4[8], 1'b0, out5[8], dataB[4]) ;
  MUX2to1 level5_9( out4[9], 1'b0, out5[9], dataB[4]) ;
  MUX2to1 level5_10( out4[10], 1'b0, out5[10], dataB[4]) ;
  MUX2to1 level5_11( out4[11], 1'b0, out5[11], dataB[4]) ;
  MUX2to1 level5_12( out4[12], 1'b0, out5[12], dataB[4]) ;
  MUX2to1 level5_13( out4[13], 1'b0, out5[13], dataB[4]) ;
  MUX2to1 level5_14( out4[14], 1'b0, out5[14], dataB[4]) ;
  MUX2to1 level5_15( out4[15], 1'b0, out5[15], dataB[4]) ;
  MUX2to1 level5_16( out4[16], out4[0], out5[16], dataB[4]) ;
  MUX2to1 level5_17( out4[17], out4[1], out5[17], dataB[4]) ;
  MUX2to1 level5_18( out4[18], out4[2], out5[18], dataB[4]) ;
  MUX2to1 level5_19( out4[19], out4[3], out5[19], dataB[4]) ;
  MUX2to1 level5_20( out4[20], out4[4], out5[20], dataB[4]) ;
  MUX2to1 level5_21( out4[21], out4[5], out5[21], dataB[4]) ;
  MUX2to1 level5_22( out4[22], out4[6], out5[22], dataB[4]) ;
  MUX2to1 level5_23( out4[23], out4[7], out5[23], dataB[4]) ;
  MUX2to1 level5_24( out4[24], out4[8], out5[24], dataB[4]) ;
  MUX2to1 level5_25( out4[25], out4[9], out5[25], dataB[4]) ;
  MUX2to1 level5_26( out4[26], out4[10], out5[26], dataB[4]) ;
  MUX2to1 level5_27( out4[27], out4[11], out5[27], dataB[4]) ;
  MUX2to1 level5_28( out4[28], out4[12], out5[28], dataB[4]) ;
  MUX2to1 level5_29( out4[29], out4[13], out5[29], dataB[4]) ;
  MUX2to1 level5_30( out4[30], out4[14], out5[30], dataB[4]) ;
  MUX2to1 level5_31( out4[31], out4[15], out5[31], dataB[4]) ;

  
  // assign dataOut = out5 ;
  assign dataOut = ( dataB >= 32'd32 ) ? 32'b0 : out5 ;
  
endmodule
