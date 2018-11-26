module registr(DATA_OUT,A,B,C,clk);
import param_registr::*;
output reg [WIDTH_OUT-1:0] DATA_OUT;
reg [WIDTH_OUT-1:0] BUFMult; 
reg [WIDTH_OUT-1:0] BUF;
reg [WIDTH_OUT-1:0] BUF2;
input wire [7:0] A;
input wire [7:0] B;
input wire [7:0] C;
input wire clk;

initial
begin
	BUF<=0;
	BUF2<=0;
	BUFMult<=0;
	DATA_OUT<=0;
end

always @(posedge clk)
begin
	BUFMult<=A*B;
	BUF<=C;
	BUF2<=BUF;
	DATA_OUT<=BUFMult+BUF2;
end
endmodule
