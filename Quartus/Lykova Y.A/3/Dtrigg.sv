module Dtrigg(rst,clc,A,B,C,data_out);

import parametr::*;
input rst;
input clc;

input [size-1:0] A;
input [size-1:0] B;
input [size-1:0] C;

output[outsize-1:0] data_out;
reg [outsize-1:0] data_out;
reg [outsize-1:0] umn;
reg [outsize-1:0] sum;

always @(clc or rst)
begin 
	if (clc)
	begin
	umn<=A*B;
	sum<=C;
	data_out<=umn+sum;	
	end
	else
	begin
	data_out<=0;
	end	
end
endmodule
