module trigger(input d,input clk,output reg out);
//
always@(posedge clk)
out=d;

endmodule 