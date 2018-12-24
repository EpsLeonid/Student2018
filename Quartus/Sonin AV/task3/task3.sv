module task3 (A, B, C, clk, data_out);

import parameters::*;

input 						clk;
input 	[input_size - 1:0] 	A;
input 	[input_size - 1:0] 	B;
input 	[input_size - 1:0] 	C;
output  [output_size - 1:0] data_out;
reg 	[output_size - 1:0] data_mult;
reg 	[output_size - 1:0] data_sum;

always @(clk)
begin
		data_mult <= A * B;
		data_sum  <= C;
		data_out  <= data_mult + data_sum;	
end
endmodule
