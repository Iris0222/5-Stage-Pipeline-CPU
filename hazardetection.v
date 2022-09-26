module hazardDetection( clk, IdExMemRead, IdExRt, instr2,   
	                    PcWrite, IFIDWrite, sel) ;
						   
	input IdExMemRead, clk ; 
	input [4:0]  IdExRt ; 
	input[31:0] instr2 ; 
	
	wire[4:0] rs, rt ; 
	wire[5:0] opcode; 
	assign rs = instr2[25:21] ; 
	assign rt = instr2[20:16] ; 
	assign opcode = instr2[31:26] ;
	output reg PcWrite, IFIDWrite, sel ;  
	
	initial begin
		PcWrite = 1'b1 ; 
		IFIDWrite = 1'b1 ; 
		sel = 1'b1 ; 
	end 
	
	always @( negedge clk  )
	begin 
		if( IdExMemRead == 1'b1 && IdExRt == rs  )
		begin
			PcWrite = 1'b0 ; 
			IFIDWrite = 1'b0 ; 
			sel = 1'b0 ; 
			$display( "%d, Hazard", $time/10-1 ) ; 
		end 
		if( IdExMemRead == 1'b1 && IdExRt == rt  )
		begin
			PcWrite = 1'b0 ; 
			IFIDWrite = 1'b0 ; 
			sel = 1'b0 ; 
			$display( "%d, Hazard", $time/10-1 ) ; 
		end 
		else 
		begin
			PcWrite = 1'b1 ; 
			IFIDWrite = 1'b1 ; 
			sel = 1'b1 ; 
		end 
		
	end
endmodule 