module dtrig(output reg out,input clk,input d);
always@(posedge clk)
out=d;
endmodule 