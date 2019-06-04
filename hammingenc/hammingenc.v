module hammingenc(clk,d,C);
output reg [6:0]C;		//Code digits 
input [3:0]d;				//Data digits
input clk;
always@(posedge clk)
begin
	C[6]<=d[3];
	C[5]<=d[2];
	C[4]<=d[1];
	C[3]<=d[0];
	C[2]<=d[0]^d[1]^d[3];		//Parity bits
	C[1]<=d[0]^d[2]^d[3];		//Parity bits
	C[0]<=d[1]^d[2]^d[3];		//Parity bits
end
endmodule
