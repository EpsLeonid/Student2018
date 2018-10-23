
module p2018(clk,reset,in,out);
input wire[15:0]				in;
output reg[15:0]         		out;
//
reg[15:0]       				yy[0:9];
reg[15:0]       				d[0:1];
reg[15:0]       				p[0:1];
reg[15:0]       				r[0:1];
reg[15:0]       				s[0:1];
//
input wire            			reset;
input wire               		clk;
//
integer y;
integer n;
//


//zadanie 3: filter
initial
begin
n=0;
out=0;
for(y=0;y<10;y=y+1)
	begin
	yy[y]=0;
	end
d[0]=0;
d[1]=0;
p[0]=0;
p[1]=0;
r[0]=0;
r[1]=0;
s[0]=0;
s[1]=0; 
end

always@(posedge clk)
begin
if(reset==1)

begin
n=0;
out=0;
for(y=0;y<10;y=y+1)
	begin
		yy[y]=0;
	end
d[0]=0;
d[1]=0;
p[0]=0;
p[1]=0;
r[0]=0;
r[1]=0;
s[0]=0;
s[1]=0; 
end
else
begin
	for(y=9;y>0;y=y-1)
	begin
		yy[y]=yy[y-1];
	end 
	yy[0]=in;
	if(n>9)
	begin
        d[0]=yy[0]-yy[4]-yy[4]+yy[9];
    end
    if(n>4 & n<=9)
    begin
        d[0]=yy[0]-yy[4]-yy[4];
    end
    if(n<=4)
    begin
        d[0]=yy[0];
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
    out=s[0];
	n=n+1;
end
end

endmodule
     