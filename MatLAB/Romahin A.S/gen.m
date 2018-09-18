%Function for generated data
function [x,y] = gen(start,finish,A,t1,t2)
%Init arrays
x=[]
y=[]
%run circle from start to finish
for t=start:finish
    x(t-start+1)=t %we start from t-start+1 becouse we have left bound = 0 for iterator t]
    if(t<0)
        y(t-start+1)=0 
    end
    if(t>-1)
        y(t-start+1)=A*(exp(-t/t1)-exp(-t/t2)) %
    end
end
figure % create new window for plot
plot(x,y) %  draw data
end

