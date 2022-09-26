`timescale 1ns/1ns
module ALU( dataA, dataB, dataC, Signal, dataOut, cout, reset );
input reset ;
input dataA ;
input dataB ;
input dataC ; // cin
input [5:0] Signal ;
output dataOut ;
output cout ;

//   Signal ( 6-bits)?
//   AND  : 36
//   OR   : 37
//   ADD  : 32
//   SUB  : 34
//   SLT  : 42


parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;
parameter SLL = 6'b000000;
wire sum ;

Full_Adder_Sub AddAndSub( dataA, dataB, dataC, cout, sum, Signal ) ;



assign dataOut = ( Signal == AND ) ? dataA & dataB :// AND
				 ( Signal == OR  ) ? dataA | dataB :// OR
				 ( Signal == ADD ) ? sum : 			// ADD
				 ( Signal == SUB ) ? sum : 			// SUB
				 ( Signal == SLT ) ? sum : 1'b0 ;   // SLT


endmodule
