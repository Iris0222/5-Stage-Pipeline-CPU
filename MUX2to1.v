`timescale 1ns/1ns

module MUX2to1( input1, input2, out, signal ) ;
    input input1, input2 ;
	input signal ;
	output out ;
    assign out = ( signal == 1'b0 ) ? input1 : input2 ;

endmodule