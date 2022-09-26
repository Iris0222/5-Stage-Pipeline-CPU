
module ID_EX( clk, en, PCIn, RD1In, RD2In, signExtendIn, PCOut, RD1Out, RD2Out, signExtendOut, rd, rt, rdOut, rtOut
			, RegDst, ALUSrc, ALUOp
			, O_RegDst, O_ALUSrc, O_ALUOp
			
			, MemRead, MemWrite, branch
			, O_MemRead, O_MemWrite, O_branch 
			
			, RegWrite, MemtoReg
            , O_RegWrite, O_MemtoReg
			, rs  // hazard detect -> forwarding 
			, O_rs
			
			, shamt
			, O_shamt
			) ;
	
	input clk, en ;
	input[31:0] PCIn, RD1In, RD2In, signExtendIn ; 
	input[4:0] rd, rt, rs, shamt  ; 
	input RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg, branch ;
	input[2:0]  ALUOp ;
	
	output reg[2:0]  O_ALUOp ;
	output reg[31:0] PCOut, RD1Out, RD2Out, signExtendOut ; 
	output reg[4:0] rdOut, rtOut, O_rs, O_shamt ; 
	output reg O_RegDst, O_ALUSrc, O_MemRead, O_MemWrite, O_RegWrite, O_MemtoReg, O_branch ;
	/* 
	WB 	RegWrite, MemtoReg 
	
	MEM MemRead, MemWrite
	
	EX 	RegDst, ALUSrc, ALUOp
	*/ 
	
	always @( posedge clk ) 
	begin
		if ( en ) begin 
		rdOut <= rd ;
		rtOut <= rt ;
		PCOut <= PCIn;
		RD1Out <= RD1In;
		RD2Out <= RD2In ;
		signExtendOut <= signExtendIn ;
		O_RegDst <= RegDst;
		O_ALUSrc <= ALUSrc;
		O_ALUOp <= ALUOp;
		O_MemRead <= MemRead;
		O_MemWrite <= MemWrite;
		O_RegWrite <= RegWrite;
		O_MemtoReg <= MemtoReg;
		O_branch <= branch;
		O_rs <= rs ; 
		O_shamt <= shamt ; 
		end // if 
			
    end 
	
endmodule
