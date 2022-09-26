`timescale 1ns/1ns
module Divider( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;
output [63:0] dataOut ;

//   Signal ( 6-bits)?
//   DIVU  : 27

reg [63:0] temp ;
reg [6:0] counter ;
parameter DIVU = 6'b011011;
parameter OUT = 6'b111111;

always@ ( Signal ) 
begin 
	if ( Signal == DIVU ) 
	begin 
	temp[63:32] = 32'b0 ; 
	temp[31:0] = dataA ;
	temp = temp << 1'b1 ; 
	counter = 6'd0 ;
	end 
end


always@( posedge clk or reset )
begin
	if ( reset )
        begin
                temp = 64'b0 ;
        end  
	
	else 
        begin
			case ( Signal )
				DIVU:
				begin
					temp[63:32] = temp[63:32] - dataB ;
					if( temp[63] == 0 ) // REM >=0
					begin
						temp = temp << 1'b1 ; 
						temp[0] = 1'b1 ;
					
					end
					
					else
					begin
						temp[63:32] = temp[63:32] + dataB ;
						temp = temp << 1'b1 ; 
						temp[0] = 1'b0 ;
					
					end	
					counter = counter + 1 ;
					if( counter == 6'd32 )
					    temp[63:32] = temp[63:32] >> 1'b1 ; 

				end

		
			endcase
        end

end
assign dataOut = temp ;

endmodule