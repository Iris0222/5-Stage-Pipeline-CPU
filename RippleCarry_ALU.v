`timescale 1ns/1ns

module RippleCarry_ALU( dataA, dataB, Signal, dataOut, reset ) ; 

  input [31:0] dataA, dataB ;
  input [5:0] Signal ;
  input reset ;
  output [31:0] dataOut ;
  wire [32:0] dataC ; // cin
  wire [31:0] sum ; 
  parameter ADD = 6'b100000;
  parameter SUB = 6'b100010;
  parameter SLT = 6'b101010;
  
  
  assign dataC[0] = ( Signal == SUB || Signal == SLT ) ? 1'b1 : 1'b0 ;
  
  // module ALU( dataA, dataB, dataC, Signal, dataOut, cout, reset )
  
  ALU alu0( dataA[0], dataB[0], dataC[0], Signal, sum[0], dataC[1], reset ) ;
  ALU alu1( dataA[1], dataB[1], dataC[1], Signal, sum[1], dataC[2], reset ) ;
  ALU alu2( dataA[2], dataB[2], dataC[2], Signal, sum[2], dataC[3], reset ) ;
  ALU alu3( dataA[3], dataB[3], dataC[3], Signal, sum[3], dataC[4], reset ) ;
  ALU alu4( dataA[4], dataB[4], dataC[4], Signal, sum[4], dataC[5], reset ) ;
  ALU alu5( dataA[5], dataB[5], dataC[5], Signal, sum[5], dataC[6], reset ) ;
  ALU alu6( dataA[6], dataB[6], dataC[6], Signal, sum[6], dataC[7], reset ) ;
  ALU alu7( dataA[7], dataB[7], dataC[7], Signal, sum[7], dataC[8], reset ) ;
  ALU alu8( dataA[8], dataB[8], dataC[8], Signal, sum[8], dataC[9], reset ) ;
  ALU alu9( dataA[9], dataB[9], dataC[9], Signal, sum[9], dataC[10], reset ) ;
  ALU alu10( dataA[10], dataB[10], dataC[10], Signal, sum[10], dataC[11], reset ) ;
  ALU alu11( dataA[11], dataB[11], dataC[11], Signal, sum[11], dataC[12], reset ) ;
  ALU alu12( dataA[12], dataB[12], dataC[12], Signal, sum[12], dataC[13], reset ) ;
  ALU alu13( dataA[13], dataB[13], dataC[13], Signal, sum[13], dataC[14], reset ) ;
  ALU alu14( dataA[14], dataB[14], dataC[14], Signal, sum[14], dataC[15], reset ) ;
  ALU alu15( dataA[15], dataB[15], dataC[15], Signal, sum[15], dataC[16], reset ) ;
  ALU alu16( dataA[16], dataB[16], dataC[16], Signal, sum[16], dataC[17], reset ) ;
  ALU alu17( dataA[17], dataB[17], dataC[17], Signal, sum[17], dataC[18], reset ) ;
  ALU alu18( dataA[18], dataB[18], dataC[18], Signal, sum[18], dataC[19], reset ) ;  
  ALU alu19( dataA[19], dataB[19], dataC[19], Signal, sum[19], dataC[20], reset ) ;
  ALU alu20( dataA[20], dataB[20], dataC[20], Signal, sum[20], dataC[21], reset ) ;
  ALU alu21( dataA[21], dataB[21], dataC[21], Signal, sum[21], dataC[22], reset ) ;
  ALU alu22( dataA[22], dataB[22], dataC[22], Signal, sum[22], dataC[23], reset ) ;
  ALU alu23( dataA[23], dataB[23], dataC[23], Signal, sum[23], dataC[24], reset ) ;
  ALU alu24( dataA[24], dataB[24], dataC[24], Signal, sum[24], dataC[25], reset ) ;
  ALU alu25( dataA[25], dataB[25], dataC[25], Signal, sum[25], dataC[26], reset ) ;
  ALU alu26( dataA[26], dataB[26], dataC[26], Signal, sum[26], dataC[27], reset ) ;
  ALU alu27( dataA[27], dataB[27], dataC[27], Signal, sum[27], dataC[28], reset ) ;
  ALU alu28( dataA[28], dataB[28], dataC[28], Signal, sum[28], dataC[29], reset ) ;
  ALU alu29( dataA[29], dataB[29], dataC[29], Signal, sum[29], dataC[30], reset ) ;
  ALU alu30( dataA[30], dataB[30], dataC[30], Signal, sum[30], dataC[31], reset ) ;
  ALU alu31( dataA[31], dataB[31], dataC[31], Signal, sum[31], dataC[32], reset ) ; 
  
  wire [31:0] slt_out ;
  assign slt_out =  ( sum[31] == 1'b1 ) ? 32'd1 : 32'd0 ;
  assign dataOut = ( Signal == SLT ) ? slt_out : sum ;

  
endmodule
  
  
