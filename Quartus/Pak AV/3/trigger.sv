module trigger(a,b,c,rst,clc,A,B,C,data_out,clcd,d,q);
// �������
import parametr::*;
input rst;
input clc;

input [size-1:0] A;
input [size-1:0] B;
input [size-1:0] C;

output[outsize-1:0] data_out;
reg [outsize-1:0] data_out;
reg [outsize-1:0] data_mult;
reg [outsize-1:0] data_summ;

// ���������
input a;
input b;
output c;

assign c=a*b;

// D �������
input d;
input clcd;
output q;
reg q;

// D �������  
always @(d or clcd)
begin
if (clcd)
q<=d;
end

// �������
always @(clc or rst)
begin 
	if (clc)
	begin
	data_mult<=A*B;
	data_summ<=C;
	data_out<=data_mult+data_summ;	
	end
	else
	begin
	data_out<=0;
	end	
end
endmodule
