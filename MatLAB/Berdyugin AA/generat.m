function [x,y] = gen(start,finish,A,t1,t2)
%head function, the task!
start=-10
finish=100
t1=16
t2=5
x=start:finish
y=[]

for t=start:finish %starting generation
   A=1;
   if(t<0) 
      y(t-start+1)=0;
   end
   if (t>=0)
      y(t-start+1)=A*(exp(-t/t1)-exp(-t/t2))
      
   end
%massive
end

