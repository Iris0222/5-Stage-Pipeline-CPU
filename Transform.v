module Transform ( in, out ) ;

	input[3:0] in ; 
	
	output reg [5:0] out ;
	
	parameter AND = 6'b100100;
	parameter OR  = 6'b100101;
	parameter ADD = 6'b100000;
	parameter SUB = 6'b100010;
	parameter SLL = 6'b000000;
	parameter SLT = 6'b101010;
	parameter DIVU= 6'b011011;
	parameter MFHI= 6'b010000;
	parameter MFLO= 6'b010010;

	
	always @( in ) 
		begin 
			if( in == 4'd0 ) begin //AND
				out = AND ; 
			end 
			else if ( in == 4'd1 ) begin //OR
				out = OR ;
			end 
			else if ( in == 4'd2 ) begin //ADD
				out = ADD ;
			end 
			else if ( in == 4'd3 ) begin //DIVU
				out = DIVU ;
			end 
			else if ( in == 4'd4 ) begin //MFHI
				out = MFHI ;
			end 
			else if ( in == 4'd5 ) begin //MFLO
				out = MFLO ;
			end 
			else if ( in == 4'd6 ) begin //SUB
				out = SUB ;
			end 
			else if ( in == 4'd7 ) begin //SLT
				out = SLT ;
			end 
			else if ( in == 4'd8 ) begin //SLL
				out = SLL ;
			end 
		end 

endmodule 