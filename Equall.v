module Equall( clk, a, b, equall ) ;

	input[31:0] a, b ; 
	input clk ;
	output equall ; 
	 
	assign equall = ( a == b ) ? 1'b1 : 1'b0;
	
	/*initial 
	begin 
		equall = 1'b0 ; 
	end 
	
	always @( posedge clk  )
	begin 
		if ( a == b ) 
			equall = 1'b1 ; 
		else 
			equall = 1'b0 ; 
	end */
	
	
endmodule 