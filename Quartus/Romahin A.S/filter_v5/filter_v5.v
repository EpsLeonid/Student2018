module filter_v5(OUT,IN,clk);

output reg [7:0] OUT;
input wire [7:0] IN;
input clk;
reg [7:0] inMem [0:11];
reg [7:0] d [0:1];
reg [7:0] p [0:1];
reg [7:0] r [0:1];
reg [7:0] s [0:1];
integer n;
integer index;



initial
begin
n=1;
end



always@(posedge clk)
begin
	for(index=11;index>0;index=index-1)
	begin
		inMem[index]=inMem[index-1];
	end 
	inMem[0]=IN;
	if(n>11)
	begin
        d[0]=inMem[0]-inMem[5]-inMem[5]+inMem[11];
    end
    if(n>5 & n<=11)
    begin
        d[0]=inMem[0]-inMem[5]-inMem[5];
    end
    if(n<=5)
    begin
        d[0]=inMem[0];
    end
    if(n>0)
    begin
		p[1]=p[0];
		d[1]=d[0];
		s[1]=s[0];
        p[0]=p[1]+d[0];
        r[0]=p[0]+16*d[1];
        s[0]=s[1]+r[0];
    end
    if(n==0)
    begin
        p[0]=d[0];
        r[0]=p[0]+16*d[0];
        s[0]=r[0];
    end
    OUT=s[0];
	n=n+1;
end

endmodule
