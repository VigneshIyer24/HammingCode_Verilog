module hammingdec(clk,r,s,c,d,e);
input clk;
assign a=7'b1111111; // to be used later to eliminate error
output [6:0]c;
input [6:0]r;  // Port Assignments r--> received sequence c--> error free and actual encoded codeword sequence
output reg [6:0]e;   // error matrix [](1X7)
output reg [3:0]d;   // d--> actual data sequence d=[](1X3) without parity bits, here four
output reg [2:0]s; 
always@(posedge clk) // clk--> clock
	begin
		s[2]=r[6]^r[2]^r[3]^r[4]; // Syndrome Matrix Value Computation S= [](1X3)
		s[1]=r[6]^r[1]^r[3]^r[5]; 
		s[0]=r[0]^r[4]^r[5]^r[6]; 
end
always@(posedge clk)
	begin
		case(s)                   // Maximum Likelihood Error Detection
			0 : e= 7'b0000000;        // No error if Syndrome Matrix is a null matrix i.e., [000]
			1 : e= 7'b0000001;          
			2 : e= 7'b0000010;
			3 : e= 7'b0100000;
			4 : e= 7'b0000100;      
			5 : e= 7'b0010000;
			6 : e= 7'b0001000;
			7 : e= 7'b1000000;
			default: e=7'bzzzzzzz; 
endcase
end
xor a1(c[0],e[0],r[0]); // xor of error matrix and a 7-bit unity sequence to eliminate errors, actually only one error.
xor a2(c[1],e[1],r[1]);
xor a3(c[2],e[2],r[2]);
xor a4(c[3],e[3],r[3]);
xor a5(c[4],e[4],r[4]);
xor a6(c[5],e[5],r[5]);
xor a7(c[6],e[6],r[6]);
always@(c)
begin
	d[0]=c[3];
	d[1]=c[4];  // [3:0]d is the actual transmitted data using hamming code
	d[2]=c[5];
	d[3]=c[6];
end
endmodule