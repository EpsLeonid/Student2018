`include "registr.h"
module registr(A,B,C,clk,DATA_OUT);
//
input wire[7:0] A;
input wire[7:0] B;
input wire[7:0] C;
reg[7:0] BUF;
input clk;
//
output reg[WIDTH-1:0] DATA_OUT;
//
initial

begin

    DATA_OUT[WIDTH-1:0]=0;
    
end

always@(posedge clk)
begin
BUF<=C;
DATA_OUT<=A*B+BUF;
end
endmodule 