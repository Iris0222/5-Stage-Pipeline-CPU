/*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: 控制alu是要用+還是-或是其他指令
		2. Funct: 如果是其他指令則用這邊6碼判斷
	Output Port
		1. ALUOperation: 最後解碼完成之指令
*/

module alu_ctl(ALUOp, Funct, ALUOperation);
    input [2:0] ALUOp;
    input [5:0] Funct;
    output [3:0] ALUOperation;
    reg    [3:0] ALUOperation;

    // symbolic constants for instruction function code
    parameter F_add = 6'd32;
    parameter F_sub = 6'd34;
    parameter F_and = 6'd36;
    parameter F_or  = 6'd37;
    parameter F_slt = 6'd42;
	parameter F_SLL = 6'b000000; // d0 
	parameter F_DIVU= 6'b011011; // d27
	parameter F_MFHI= 6'b010000; // d16
	parameter F_MFLO= 6'b010010; // d18 

    // symbolic constants for ALU Operations
    parameter ALU_add = 4'b0010; // 2
    parameter ALU_sub = 4'b0110; // 6 
    parameter ALU_and = 4'b0000; // 0 
    parameter ALU_or  = 4'b0001; // 1 
    parameter ALU_slt = 4'b0111; // 7 
	parameter ALU_sll = 4'b1000; // 8 
	parameter ALU_divu = 4'b0011; // 3
	parameter ALU_mfhi = 4'b0100; // 4
	parameter ALU_mflo = 4'b0101; // 5
	
    always @( ALUOp or Funct )
    begin
        case ( ALUOp ) 
            3'b000 : ALUOperation = ALU_add; // 0
            3'b001 : ALUOperation = ALU_sub; // 1 
			3'b011 : ALUOperation = ALU_or ; // ORI 3
            3'b010 : case (Funct) // R-type 2
                        F_add : ALUOperation = ALU_add;
                        F_sub : ALUOperation = ALU_sub;
                        F_and : ALUOperation = ALU_and;
                        F_or  : ALUOperation = ALU_or ;
                        F_slt : ALUOperation = ALU_slt;
						F_SLL : ALUOperation = ALU_sll;
						F_DIVU: ALUOperation = ALU_divu ; // DIVU 4
						F_MFHI: ALUOperation = ALU_mfhi ; // MFHI 5 
						F_MFLO: ALUOperation = ALU_mflo ; // MFLO 6 
                        default ALUOperation = 3'bxxx ;
                    endcase
            default ALUOperation = 3'bxxx;
        endcase
    end
	

endmodule

