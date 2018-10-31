import registr_param::*;

module registr(DATA_OUT,A,B,C,clk);
input wire [7:0] A;
input wire [7:0] B;
input wire [7:0] C;
input clk;
reg [WIDTH_OUT-1:0] sum;
output reg  [WIDTH_OUT-1:0] DATA_OUT;
initial
begin
	sum<=0;
    DATA_OUT<=0;
end
always@(posedge clk)
begin
	sum<=#2C;
	DATA_OUT<=A*B+sum;
end
endmodule 

