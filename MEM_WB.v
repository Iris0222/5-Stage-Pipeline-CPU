/*
	            , .RegWrite(mem_RegWrite), .MemtoReg(mem_MemtoReg), .wn(mem_rfile_wn)
				, .O_RegWrite(RegWrite), .O_MemtoReg(MemtoReg), .O_wn(rfile_wn)) ;
*/

module MEM_WB ( clk, RDIn, ALUIn, RDOut, ALUOut
                , wn, RegWrite, MemtoReg
				, O_wn, O_RegWrite, O_MemtoReg ) ;
								  
    input clk ;
    input[31:0]	RDIn, ALUIn;
	input[4:0] wn ; 
	input RegDst, RegWrite, MemtoReg ;
	
    output reg[31:0] RDOut, ALUOut;  
	output reg O_RegDst, O_RegWrite, O_MemtoReg ;
    output reg[4:0] O_wn ; 
   	/* 
	WB 	RegWrite, MemtoReg 
	
	MEM MemRead, MemWrite
	
	EX 	RegDst
	*/ 	
	
    always @( posedge clk ) 
	begin
		RDOut <= RDIn ;
		ALUOut <= ALUIn ; 
		
		O_wn <= wn ; 
		O_RegDst <= RegDst;
		O_RegWrite <= RegWrite;
		O_MemtoReg <= MemtoReg;

    end
	
endmodule