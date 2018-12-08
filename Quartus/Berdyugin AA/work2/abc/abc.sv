`include "abc.h"
module abc(a,b,c,data,clk,Re);
input wire [7:0] a;
input wire [7:0] b;
input wire [7:0] c;
input clk;
reg Re;
output reg  [WIDTH-1:0] data;
initial
begin
    data=0;
end
always@(posedge clk)
	Re	=a*b;
	data	<=Re+c;
endmodule 
