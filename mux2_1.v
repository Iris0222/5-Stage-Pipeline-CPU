module mux2_1( sel, a, b, y, signal );
    parameter bitwidth=32;
    input sel;
    input  [bitwidth-1:0] a, b;
    output [bitwidth-1:0] y;
	
	output reg signal ;

    assign y = sel ? b : a;
	
	initial signal = 1'b0 ; 
	
	always @( sel ) 
	begin 
		signal = ~signal ; 
	end 
	
endmodule