import registr_param::*;

module registr(DATA_OUT,A,B,C,clk);
parameter WIDTH_OUT=17;
input wire [7:0] A;
input wire [7:0] B;
input wire [7:0] C;
input clk;
output reg  [WIDTH_OUT-1:0] DATA_OUT;
initial
begin
    DATA_OUT[WIDTH_OUT-1:0]=0;
end
always@(posedge clk)
DATA_OUT[WIDTH_OUT-1:0]=A[7:0]*B[7:0]+C[7:0];
endmodule 