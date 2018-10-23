module abc(a,b,c,data,clk);
input wire [7:0] a;
input wire [7:0] b;
input wire [7:0] c;
input clk;
output reg  [WIDTH-1:0] data;
initial
begin
    data[WIDTH-1:0]=0;
end
always@(posedge clk)
data[WIDTH-1:0]=a[7:0]*b[7:0]+c[7:0];
endmodule 
