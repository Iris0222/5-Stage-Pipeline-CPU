//	Title: MIPS Single-Cycle Processor
//	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
// 
module mips_single( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;
	wire[31:0] instr2;
	// break out important fields from instruction
	wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt, shamt_O, rt_out, rd_out, ex_rfile_wn, mem_rfile_wn, IdExRs;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	
	// datapath signals
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, pc_incr2, dmem_rdata, jump_addr, branch_addr, ex_b_tgt, ex_alu_out, ex_rfile_rd2,
				pc_incr_1, rfile_rd1_1, rfile_rd2_1, extend_immed_1, mem_dmem_rdata, mem_alu_out ;
	
	// control signals
    wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump, ex_Zero;
    wire [2:0] id_ALUOp;
    wire [2:0] ALUOp;
	wire [3:0] Operation;
	
    assign opcode = instr[31:26];
    assign rs = instr[25:21] ;
    assign rt = instr[20:16] ;
    assign rd = instr[15:11] ;
    assign shamt = instr[10:6];
    assign funct = extend_immed[5:0] ; // instr[5:0];
    assign immed = instr[15:0];
    assign jumpoffset = instr2[25:0];
	
	// branch offset shifter
    assign b_offset = extend_immed_1 << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { instr2[31:28], jumpoffset <<2 };

	// module instantiations
	
	and ( enn, ~if_Branch, pcwrite ) ; 
	assign if_Branch = ( instr2[31:26] == 6'b000100 || instr2[31:26] == 6'b000101 ) ? 1'b1 : 1'b0 ; 
	
	wire[31:0] pc_out ;
	reg32 PC( .clk(clk), .rst(rst), .signal(), .en_reg(enn), .d_in(pc_next), .d_out(pc) );
	
	// sign-extender
	sign_extend SignExt( .immed_in(immed), .ext_immed_out(extend_immed_1) );
	
	add32 PCADD( .a(pc), .b(32'd4), .result(pc_incr2) );

    add32 BRADD( .a(pc_incr_1), .b(b_offset), .result(b_tgt) );

    control_single CTL( .clk( clk ), .opcode(opcode), .sel( sel )
					  , .RegDst(id_RegDst), .ALUSrc(id_ALUSrc), .ALUOp(id_ALUOp) // V
					  , .MemtoReg(id_MemtoReg), .RegWrite(id_RegWrite)           // 
					  , .MemRead(id_MemRead), .MemWrite(id_MemWrite), .Branch(id_Branch)
					  , .Jump());

	alu_ctl ALUCTL( .ALUOp(ALUOp), .Funct(funct), .ALUOperation(Operation) );
	
	wire[5:0] Signal ; 
	
	parameter ALU_divu = 4'b0011; // 3
	
	assign IdExEn = ( instr2 == 0 && Operation == ALU_divu ) ? 1'b0 : 1'b1 ;  // nop 
	
	Transform OperationTOSignal( .in( Operation ), .out( Signal ) ) ;  
	
	TotalALU totalalu( .clk(clk), .dataA( rd1 ), .dataB( rd2 ), .Signal( Signal ), .Output( ex_alu_out ), .reset(rst) );
    //alu ALU( .ctl(Operation), .a(rd1), .b(rd2), .result(ex_alu_out), .zero(ex_Zero) );
	
	assign Branch = ( opcode == 6'b000100 || opcode == 6'b000101 ) ? 1'b1 : 1'b0 ; 
	
	Equall eq( .clk(clk), .a( rfile_rd1_1 ), .b( rfile_rd2_1 ), .equall( equall ) ) ;  

    assign PCSrc = ( Branch && equall && instr[31:26] == 6'b000100 ) ? 1'b1 : 
				   ( Branch && !equall && instr[31:26] == 6'b000101 ) ? 1'b1 : 1'b0 ;

    mux2 #(5) RFMUX( .sel(RegDst), .a(rt_out), .b(rd_out), .y(ex_rfile_wn) );

    mux2 #(32) PCMUX( .sel(PCSrc), .a(pc_incr2), .b(b_tgt), .y(branch_addr) ); 
	
	wire[31:0] mem_if_instr; 
	mux2 #(32) BRMUX( .sel(Branch), .a( mem_if_instr ), .b( 32'd0 ), .y(instr2) ); // Branch MUX
	
	parameter J = 6'd2; 
	assign Jump = ( instr2[31:26] == J )? 1'b1 : 1'b0 ; 
	
	mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) );
	// mux2 #(32) JMUX( .sel(Jump), .a(branch_addr), .b(jump_addr), .y(pc_next) );
	
	wire [31:0] alu_mux ; 
    mux2 #(32) ALUMUX( .sel(ALUSrc), .a(alu_b), .b(extend_immed), .y(alu_mux) );

    mux2 #(32) WRMUX( .sel(MemtoReg), .a(alu_out), .b(dmem_rdata), .y(rfile_wd) );
	
	wire[31:0] shamt_32 ; 
	assign shamt_32 = { 27'd0, shamt_O } ; 
	parameter ALU_sll = 4'b1000;
	assign SLL = ( Operation == ALU_sll ) ? 1'b1 : 1'b0 ; 
	
	mux2 #(32) SLLMUX_rd2( .sel(SLL), .a( alu_mux ), .b(shamt_32), .y(rd2) );
	mux2 #(32) SLLMUX_rd1( .sel(SLL), .a( rd1_in ), .b(ex_rfile_rd2), .y(rd1) );
	
	
	reg_file RegFile( .clk(clk), .RegWrite(RegWrite), .RN1(rs), .RN2(rt), .WN(rfile_wn), 
					  .WD(rfile_wd), .RD1(rfile_rd1_1), .RD2(rfile_rd2_1) );

	memory InstrMem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(mem_if_instr) );

	memory DatMem( .clk(clk), .MemRead(MemRead), .MemWrite(MemWrite), .wd(rfile_rd2), 
				   .addr(mem_alu_out), .rd(mem_dmem_rdata) );			   
	//module IF_ID( clk, rst, PCIn, PCOut, InstrIN, InstrOUT )		   
	IF_ID IFID( .clk(clk), .rst(rst), .en(ifidwrite), .PCIn(pc_incr2), .PCOut(pc_incr_1), .InstrIN(instr2), .InstrOUT(instr) ) ;
	
	// module ID_EX( clk, PCIn, RD1In, RD2In, signExtendIn, PCOut, RD1Out, RD2Out, signExtendOut, rd, rt, rdOut, rtOut,
                   //RegDst, ALUSrc, ALUOp, MemRead, MemWrite, RegWrite, MemtoReg, branch,
                   // O_RegDst, O_ALUSrc, O_ALUOp, O_MemRead, O_MemWrite, O_RegWrite, O_MemtoReg, O_branch )
				   
	ID_EX IDEX( .clk(clk), .en( IdExEn )
				, .PCIn(pc_incr_1), .RD1In(rfile_rd1_1), .RD2In(rfile_rd2_1), .signExtendIn(extend_immed_1), .rd(rd), .rt(rt)
	            , .PCOut(pc_incr) , .RD1Out(rfile_rd1), .RD2Out(ex_rfile_rd2), .signExtendOut(extend_immed), .rdOut(rd_out), .rtOut(rt_out)
                
				, .RegDst(id_RegDst), .ALUSrc(id_ALUSrc), .ALUOp(id_ALUOp) // 會被傳進 id/ex
				, .O_RegDst(RegDst), .O_ALUSrc(ALUSrc), .O_ALUOp(ALUOp)         
				
				, .MemRead(id_MemRead), .MemWrite(id_MemWrite) // 會被傳進 id/ex, ex/mem
				, .O_MemRead(ex_MemRead), .O_MemWrite(ex_MemWrite) 
				
				, .RegWrite(id_RegWrite), .MemtoReg(id_MemtoReg) // 會被傳進 id/ex, ex/mem, mem/wb
				, .O_RegWrite(ex_RegWrite), .O_MemtoReg(ex_MemtoReg)   
				
				, .rs( rs )  // hazard detect -> forwarding 
				, .O_rs( IdExRs ) 
				
				, .shamt( shamt )
				, .O_shamt( shamt_O )
			  ) ;                   
				

	// module EX_MEM( clk, PCIn, zeroIn, ALUIn, RD2In, PCOut, zeroOut, ALUOut, RD2Out,
               // RegDst, MemRead, MemWrite, RegWrite, MemtoReg, branch,
			   // O_RegDst, O_MemRead, O_MemWrite, O_RegWrite, O_MemtoReg, O_branch ) ;
	EX_MEM EXMEM( .clk(clk), .zeroIn(ex_Zero), .ALUIn(ex_alu_out), .RD2In(ex_rfile_rd2)
	                       , .zeroOut(Zero), .ALUOut(mem_alu_out), .RD2Out(rfile_rd2)
                
				, .MemRead( ex_MemRead ), .MemWrite( ex_MemWrite )
				, .O_MemRead(MemRead), .O_MemWrite(MemWrite)
				
				, .RegWrite(ex_RegWrite), .MemtoReg(ex_MemtoReg), .wn(ex_rfile_wn)
				, .O_RegWrite(mem_RegWrite), .O_MemtoReg(mem_MemtoReg), .O_wn(mem_rfile_wn) ) ;
	
	// module MEM_WB ( clk, RDIn, ALUIn, RDOut, ALUOut,
                // RegDst, RegWrite, MemtoReg, O_RegDst, O_RegWrite, O_MemtoReg ) ;
	MEM_WB MEMWB( .clk(clk), .RDIn(mem_dmem_rdata), .ALUIn(mem_alu_out), .RDOut(dmem_rdata), .ALUOut(alu_out) 
	            , .RegWrite(mem_RegWrite), .MemtoReg(mem_MemtoReg), .wn(mem_rfile_wn)
				, .O_RegWrite(RegWrite), .O_MemtoReg(MemtoReg), .O_wn(rfile_wn)) ;
	
	
	// 1. RD1: rs暫存器所讀取的資料
	// 2. RD2: rt暫存器所讀取的資料
	wire[1:0] forwardA, forwardB ; 
	ForwardingUnit FU( .clk(clk), .IdExRs( IdExRs ), .IdExRt( rt_out ), 
	                   .ExMemWn( mem_rfile_wn ), .MemRbWn( rfile_wn ), 
					   .ExMemRegwrite( mem_RegWrite ), .MemRbRegWrite( RegWrite ), 
					   .ForwardA( forwardA ), .ForwardB( forwardB ) ) ;
	
	
	
	// a( ori )
	// b(下一個指令產生hazard) 要把資料更新成MEM階段的 alu_out
	// c(下下一個指令產生hazard) 要把資料更新成WB階段的 rfile_wd 
	// rs 相同 --> 更新 rd1  
	// rt 相同 --> 更新 rd2 
	wire [31:0] rd1, rd2, rd1_in; 
	mux3 #(32)alu_input_a( .sel( forwardA ), .a( rfile_rd1 ), .b( mem_alu_out ), .c( rfile_wd ), .out(rd1_in) ) ; // out{ a:00, b:10, c:01 } 
	mux3 #(32)alu_input_b( .sel( forwardB ), .a( ex_rfile_rd2 ), .b( mem_alu_out ), .c( rfile_wd ), .out(alu_b) ) ;// out{ a:00, b:10, c:01 } 


	// hazard detect 
	hazardDetection hd( .clk(clk), .IdExMemRead( id_MemRead ), .IdExRt( rt ), .instr2(instr2), 
	                    .PcWrite( pcwrite ), .IFIDWrite( ifidwrite ), .sel( sel ) ) ; 
						
	
endmodule
