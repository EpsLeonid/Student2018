module trig(rst,clc,A,B,C,D,data_out);

import parametr::*;
input wire rst;
input wire clc;

input wire [size-1:0] A;
input wire [size-1:0] B;
input wire [size-1:0] C;
input wire [size-1:0] D;

output wire[outsize-1:0] data_out;
//reg [outsize-1:0] data_out;
reg [outsize-1:0] data_mult;
reg [outsize-1:0] data_summ;
reg [outsize-1:0] data_promm;

always @(posedge clc or negedge rst)
begin 
	if (!rst)
	begin
		data_mult<=0;
		data_summ<=0;
		data_out<=0;
		data_promm<=0;	
	end
	else
	begin
	  data_promm<=C;
	  data_summ<=data_promm;
//		data_summ<=C*D;
		data_mult<=A*B;
		
		
		data_out<=data_mult+data_summ;	
	end	
end

endmodule
