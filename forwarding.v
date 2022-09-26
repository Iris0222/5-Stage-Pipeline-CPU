module ForwardingUnit( clk, IdExRs, IdExRt, 
	                   ExMemWn, MemRbWn, 
					   ExMemRegwrite, MemRbRegWrite,
					   ForwardA, ForwardB ) ;	
	input [4:0] IdExRs, IdExRt, ExMemWn, MemRbWn ;
	input clk ; 
	input ExMemRegwrite, MemRbRegWrite ; 
					   
	output reg [1:0] ForwardA, ForwardB ; 
	
	initial 
	begin 
		ForwardA = 2'b00 ; 
		ForwardB = 2'b00 ; 
	end 
	
	always @( clk ) 
	begin
	    //$display( "%d, ExMemRegwrite : %d, ExMemWn : %d ", $time/10, ExMemRegwrite, ExMemWn );
		//$display( "%d, MemRbRegWrite : %d, MemRbWn : %d ", $time/10, MemRbRegWrite, MemRbWn );
		//$display( "%d, IdExRs : %d, IdExRt : %d ", $time/10, IdExRs, IdExRt );
		// $display( "%d, ForwardA : %b, ForwardB : %b ", $time/10-1 , ForwardA, ForwardB );
		
		if ( ExMemRegwrite == 1'b1 && ( ExMemWn != 5'd0 ) && ( ExMemWn == IdExRs) ) begin
			ForwardA = 2'b10 ;
			
			end
		else if ( MemRbRegWrite == 1'b1 && ( MemRbWn != 5'd0 ) 
		          && !( ExMemRegwrite == 1'b1 && ( ExMemWn != 5'd0 ) && ( ExMemWn == IdExRs) ) 
				  && ( MemRbWn == IdExRs) )begin 
			
			ForwardA = 2'b01 ;
			
			end
		else begin 
			
			ForwardA = 2'b00 ; 
			end
			
		if ( ExMemRegwrite == 1'b1 && ( ExMemWn != 5'd0 ) && ( ExMemWn == IdExRt)  ) begin 
			
			ForwardB = 2'b10 ; 
			end
		else if ( MemRbRegWrite == 1'b1 && ( MemRbWn != 5'd0 ) 
				  && !( ExMemRegwrite && ( ExMemWn != 5'd0 ) && ( ExMemWn == IdExRt) )
				  && ( MemRbWn == IdExRt ) ) begin 
			
			ForwardB = 2'b01 ; 
			end
		else begin 
			
			ForwardB = 2'b00 ; 
			end
			
		//$display( "%d, ForwardA : %b, ForwardB : %b ", $time/10, ForwardA, ForwardB );
	end // always s				
					   
endmodule 