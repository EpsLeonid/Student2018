module registr(DATA_OUT,A,B,C,clk);
import param_registr::*;
output reg [WIDTH_OUT-1:0] DATA_OUT;
reg [WIDTH_OUT-1:0] BUF;
input wire [7:0] A;
input wire [7:0] B;
input wire [7:0] C;
input wire clk;

initial
begin
	BUF<=0;
	DATA_OUT<=0;
end

always @(posedge clk)
begin
	BUF<=#10C;
	DATA_OUT<=(A*B+BUF);
end
endmodule
