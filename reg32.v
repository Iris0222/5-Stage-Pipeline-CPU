/*
	Title: 32-Bit Register with Synchronous Reset
	Editor: Selene (Computer System and Architecture Lab, ICE, CYCU)
	
	Input Port
		1. clk
		2. rst: ���m�T��
		3. en_reg: ����Ȧs���O�_�i�g�J
		4. d_in: ���g�J���Ȧs�����
	Output Port
		1. d_out: ��Ū�����Ȧs�����
*/
module reg32 ( clk, rst, signal, en_reg, d_in, d_out );
    input clk, rst, en_reg, signal ;
    input[31:0]	d_in;
    output[31:0] d_out;
    reg [31:0] d_out;
   
    always @( posedge clk ) begin
        if ( rst )
			d_out <= 32'b0;
        else if ( en_reg )
			d_out <= d_in;
    end
	
	always @( negedge clk ) begin
        if ( rst )
			d_out <= 32'b0;
        else if ( signal )
			d_out <= d_in;
    end

endmodule
	
