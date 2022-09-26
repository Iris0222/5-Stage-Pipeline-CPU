
module IF_ID( clk, rst, en, PCIn, PCOut, InstrIN, InstrOUT );

    input clk, rst;
	input en, eq ; 
    input[31:0]	PCIn, InstrIN;
    output reg[31:0] PCOut, InstrOUT;
	
	wire enable ;
   
    always @( posedge clk )
	begin
    
		if( rst )
			InstrOUT <= 32'b0;
        else if( en ) begin 
			PCOut <= PCIn ;
			InstrOUT <= InstrIN;
			end 
    end

endmodule