module dtrigger(d, clk, out);

input d;
input clk;
output reg out;

always@(posedge clk)
out=d;

endmodule 