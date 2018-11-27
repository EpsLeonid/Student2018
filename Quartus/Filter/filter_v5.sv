module filter_v5(clk,reset,input_data,output_data); 
import parameters_v5::*;
output reg [SIZE_ADC_DATA*2+2:0] output_data; 
input wire [SIZE_ADC_DATA*2+2:0] input_data; 
input clk; 
input reset; 
reg signed [SIZE_ADC_DATA*2+2:0] inMem [0:11]; 
reg signed [SIZE_ADC_DATA*2+2:0] d [0:1]; 
reg signed [SIZE_ADC_DATA*2+2:0] p [0:1]; 
reg signed [SIZE_ADC_DATA*2+2:0] r [0:1]; 
reg signed [SIZE_ADC_DATA*2+2:0] s [0:1]; 
reg signed [SIZE_ADC_DATA*2+2:0] BUF1; 
reg signed [SIZE_ADC_DATA*2+2:0] BUF2; 
reg signed [SIZE_ADC_DATA*2+2:0] BUFMult; 
integer index; 
integer n; 



initial 
begin 
n=0; 
output_data<=0; 
for(index=0;index<12;index=index+1) 
begin 
inMem[index]<=0; 
end 
d[0]<=0; 
d[1]<=0; 
p[0]<=0; 
p[1]<=0; 
r[0]<=0; 
r[1]<=0; 
s[0]<=0; 
s[1]<=0; 
end 



always@(posedge clk) 
begin 
if(reset!=1) 
begin 
n<=0; 
output_data<=0; 
for(index=0;index<12;index=index+1) 
begin 
inMem[index]<=0; 
end 
d[0]<=0; 
d[1]<=0; 
p[0]<=0; 
p[1]<=0; 
r[0]<=0; 
r[1]<=0; 
s[0]<=0; 
s[1]<=0; 
end 
else 
begin 
for(index=11;index>0;index=index-1) 
begin 
inMem[index]<=inMem[index-1]; 
end 
p[1]<=p[0]; 
d[1]<=d[0]; 
s[1]<=s[0]; 
inMem[0]<=input_data; 
BUF1<=inMem[0]-inMem[5];
BUF2<=inMem[5]-inMem[11];
BUFMult<=16*d[1];
d[0]<=BUF1-BUF2; 

p[0]<=p[1]+d[0]; 
r[0]<=p[0]+BUFMult; 
s[0]<=s[1]+r[0]; 

output_data<=s[0]<<<7; 

end 
end

endmodule