/*
Author: Spence Johnston
Module: BCD to seven-segment driver
Purpose: driver for multi-number seven-segment display. input a number, outputs up to 5 BCD digits.
*/

module bcd_to_seven_driver (
	input [15:0] numb,
	output reg [3:0] ones, tens, hundreds, thousands, ten_thous
);

always @ ( * )
begin

	ones = numb % 10; 

	if ( numb > 9 )
	begin
		tens = ( numb / 16'd10 ) % 16'd10;		
		if ( numb > 16'd99 )
		begin
			hundreds = ( numb / 16'd100 ) % 16'd10;		
			if ( numb > 16'd999 )
			begin
				thousands = ( numb / 16'd1000 ) % 16'd10;
					if ( numb > 16'd9999 )
						ten_thous = ( numb / 16'd10000 ) % 16'd10;
					else
						ten_thous = 4'd0;			
			end			
			else
			begin
				thousands = 4'd0;
				ten_thous = 4'd0;
			end
		end
		else
		begin
			hundreds = 4'd0;
			thousands = 4'd0;
			ten_thous = 4'd0;
		end		
		end
	else
	begin
		tens = 4'd0;
		hundreds = 4'd0;
		thousands = 4'd0;
		ten_thous = 4'd0;
	end
	
end

endmodule
