module dtrigger (d,clc,q);

input d;
input clc;
output q;
reg q;
  
always @(d or clc)
begin
if (clc==1)
q<=d;
end

endmodule
