/*
Author: Spence Johnston
Module: BCD to seven-segment decoder
Purpose: BCD decoder for seven-segment display
*/

module bcd_decoder ( 
input [3:0] D,
output reg [6:0] out
);

always @ (D) 
begin
	case (D) 
		4'b0000 : out = 7'b1000000; 	//0
		4'b0001 : out = 7'b1111001;	//1
		4'b0010 : out = 7'b0100100;	//2
		4'b0011 : out = 7'b0110000;	//3
		4'b0100 : out = 7'b0011001;	//4
		4'b0101 : out = 7'b0010010;	//5
		4'b0110 : out = 7'b0000010;	//6
		4'b0111 : out = 7'b1111000;	//7
		4'b1000 : out = 7'b0000000;	//8
		4'b1001 : out = 7'b0010000;	//9
		
		default : out = 7'b1111111;	//blank
		
	endcase
end

endmodule 