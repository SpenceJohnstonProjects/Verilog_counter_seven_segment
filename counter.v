/*
Author: Spence Johnston
Module: Counter
Purpose: Counts up and outputs the current count.

Notes: Default bits to count with is 16.
*/

module counter
#(	
	parameter N = 16	//number of bits the counter counts to
) (
	input clk, en, reset,
	output reg [N-1:0] out
);

initial out = 0;

always @ ( posedge clk or posedge reset)
begin
	if(reset)
		out = 0;
	else
	if (en)
		out = out + 1'd1;
	else
		out = out;
end

endmodule
