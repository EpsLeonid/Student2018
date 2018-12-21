module trigg (d,clc,q);

input d;
input clc;
output q;
reg q;
  
always @(d or clc)
begin
if (clc)
q<=d;
end

endmodule
