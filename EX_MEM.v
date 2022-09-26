
/*
				, .MemRead( ex_MemRead ), .MemWrite( ex_MemWrite ), .branch(ex_Branch)
				, .O_MemRead(MemRead), .O_MemWrite(MemWrite), .O_branch(Branch)
				
				, .RegWrite(ex_RegWrite), .MemtoReg(ex_MemtoReg), .wn(ex_rfile_wn)
				, .O_RegWrite(mem_RegWrite), .O_MemtoReg(mem_MemtoReg), .O_wn(mem_rfile_wn) ) ;
*/		
module EX_MEM( clk, PCIn, zeroIn, ALUIn, RD2In, PCOut, zeroOut, ALUOut, RD2Out
			   , MemRead, MemWrite, branch
			   , O_MemRead, O_MemWrite, O_branch
			   , RegWrite, MemtoReg, wn 
			   , O_RegWrite, O_MemtoReg, O_wn ) ;
						  
	
	input clk ;
    input[31:0]	PCIn, ALUIn, RD2In ;
	input[4:0] wn;
	input MemRead, MemWrite, RegWrite, MemtoReg, branch, zeroIn ;
    output reg[31:0] PCOut, ALUOut, RD2Out ; 
	output reg[4:0] O_wn ;
	output reg O_MemRead, O_MemWrite, O_RegWrite, O_MemtoReg, O_branch, zeroOut ;
	/* 
	WB 	RegWrite, MemtoReg 
	
	MEM MemRead, MemWrite
	
	EX 	RegDst
	*/ 	
	always @( posedge clk ) 
	begin   
	    O_wn <= wn ; 
		PCOut <= PCIn ;
		zeroOut <= zeroIn ; 
		ALUOut <= ALUIn ;
		RD2Out <= RD2In;
		
		O_MemRead <= MemRead;
		O_MemWrite <= MemWrite;
		O_RegWrite <= RegWrite;
		O_MemtoReg <= MemtoReg;
		O_branch <= branch;
 
	end // ALWAYS 
	
endmodule
