module trigger(rst,clc,A,B,C,data_out);

import parametr::*;
input rst;
input clc;

input [size-1:0] A;
input [size-1:0] B;
input [size-1:0] C;

output[outsize-1:0] data_out;
reg[outsize-1:0] data_out;


always @(clc or rst)
begin 
	if (rst)
		begin
		data_out<=0;
	end
	else
		begin
		data_out<=A*B+C;	
	end	
end
endmodule
