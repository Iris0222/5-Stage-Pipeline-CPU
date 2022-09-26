/*
	Title: MIPS Single-Cycle Control Unit
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. opcode: ��J�����O�N���A�ڦ����͹���������T��
	Input Port
		1. RegDst: ����RFMUX
		2. ALUSrc: ����ALUMUX
		3. MemtoReg: ����WRMUX
		4. RegWrite: ����Ȧs���O�_�i�g�J
		5. MemRead:  ����O����O�_�iŪ�X
		6. MemWrite: ����O����O�_�i�g�J
		7. Branch: �PALU��X��zero�T����AND�B�ⱱ��PCMUX
		8. ALUOp: ��X��ALU Control
*/
module control_single( clk, opcode, sel, RegDst, ALUSrc, MemtoReg, RegWrite, 
					   MemRead, MemWrite, Branch, Jump, ALUOp);
    input[5:0] opcode;
	input sel, clk ; 
    output RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
    output[2:0] ALUOp;
    reg RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump;
    reg[2:0] ALUOp;

    parameter R_FORMAT = 6'd0;
    parameter LW = 6'd35;
    parameter SW = 6'd43;
    parameter BEQ = 6'd4;
	parameter BNE = 6'd5;
	parameter J = 6'd2; 
	parameter ORI = 6'd13 ; 
	parameter DIVU = 6'd27 ;
	parameter MFHI = 6'd16 ;
	parameter MFLO = 6'd18 ;
	always @( posedge clk ) begin 
	
		if ( sel == 1'b0 ) 
		begin 
			RegDst = 1'b0; ALUSrc = 1'b0; MemtoReg = 1'b0; RegWrite = 1'b0; MemRead = 1'b0; 
			MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 3'b000;
		end
	end // always 
	
    always @( opcode or posedge clk ) begin
			
			if( sel == 1'b1 ) 
			begin 
				case ( opcode )
				  R_FORMAT : 
				  begin
						//$display("%d,CTL R-type %d", $time/10 -1 , opcode);
						RegDst = 1'b1; ALUSrc = 1'b0; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0; 
						MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 3'b010;
				  end
				  LW :
				  begin
						//$display("%d,CTL LW %d", $time/10 -1 , opcode);
						RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b1; RegWrite = 1'b1; MemRead = 1'b1; 
						MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 3'b000;
				  end
				  SW :
				  begin
						//$display("%d,CTL SW %d", $time/10 -1 , opcode);
						RegDst = 1'bx; ALUSrc = 1'b1; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
						MemWrite = 1'b1; Branch = 1'b0; Jump = 1'b0; ALUOp = 3'b000;
				  end 
				  J :
				  begin
						RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
						MemWrite = 1'b0; Branch = 1'b0;  ALUOp = 3'b001;
				  end
				  BEQ :
				  begin
						RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
						MemWrite = 1'b0; Branch = 1'b1;  ALUOp = 3'b001;
				  end
				  BNE :
				  begin
						RegDst = 1'bx; ALUSrc = 1'b0; MemtoReg = 1'bx; RegWrite = 1'b0; MemRead = 1'b0; 
						MemWrite = 1'b0; Branch = 1'b1;  ALUOp = 3'b001;
				  end
				  ORI : // rt_out, OR 
				  begin
						RegDst = 1'b0; ALUSrc = 1'b1; MemtoReg = 1'b0; RegWrite = 1'b1; MemRead = 1'b0; 
						MemWrite = 1'b0; Branch = 1'b0; Jump = 1'b0; ALUOp = 3'b011;
				  end
				  default
				  begin
						$display("%d, control_single unimplemented opcode %d", $time/10 -1 , opcode);
						RegDst=1'bx; ALUSrc=1'bx; MemtoReg=1'bx; RegWrite=1'bx; MemRead=1'bx; 
						MemWrite=1'bx; Branch=1'bx; Jump = 1'bx; ALUOp = 2'bxx;
				  end

				endcase
			end 
    end // always 
endmodule

