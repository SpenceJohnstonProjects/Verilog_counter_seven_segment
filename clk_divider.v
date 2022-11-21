/*
Author: Spence Johnston
Module: clock divider 
Purpose: divides system clock to desired frequency.
*/

//default output frequency when input is 50MHz = 9600Hz
module clk_divider 
#(
	parameter WIDTH = 12,	//number of bits to hold N
	parameter N = 2604	//frequency * 1/(2*N) = out clk 
 ) (
	input clk,
	output out
);

reg [WIDTH-1:0] r_reg;
wire [WIDTH-1:0] r_nxt;
reg clk_tracker;

always @ (posedge clk)
begin
	if( r_nxt == N)
	begin
		r_reg <=0;
		clk_tracker <= ~clk_tracker;
	end
	else
		r_reg <= r_nxt;
end

assign r_nxt = r_reg + 1;
assign out = clk_tracker;

endmodule
