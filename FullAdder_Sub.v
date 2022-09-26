`timescale 1ns/1ns

// Full Adder + Subtractor
module Full_Adder_Sub( a, b, c, cout, sum, Signal ) ;

    input a, b, c ;
	input [5:0] Signal ;
    output cout, sum ;
	
	parameter ADD = 6'b100000;
	parameter SUB = 6'b100010;
	parameter SLT = 6'b101010;
	
	wire B ;
	assign B = ( Signal == ADD ) ? b : ~b ; 
	
    wire  w1, w2, w3, w4, w5 ;
	
// 	sum = a xor b xor c 
    xor(w1, a, B) ; // a xor b
    xor(sum, w1, c); 
	
// 	cout = a&b | a&c | b&c
    and( w2, a, B ) ; // a & b
	and( w3, a, c ) ; // a & c
	and( w4, B, c ) ; // b & c
	or( w5, w2, w3 ) ;  // a & b | a & c
	or( cout, w4, w5 ) ; 

endmodule
