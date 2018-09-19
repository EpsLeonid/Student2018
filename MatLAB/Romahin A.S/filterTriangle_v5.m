%This function filtered data
function [s] = filterTriangle_v5(input)
% init arrays
d=[]
p=[0]
r=[0]
s=[0]
% we skeep input, if n-k or n-l or n-k-l <1 and if n==1 we init first value
% with zero
for n = 1:length(input)
    if(n>12)
        d(n)=input(n)-input(n-6)-input(n-6)+input(n-12)
    end
    if(n>6 & n<=12)
        d(n)=input(n)-input(n-6)-input(n-6)
    end
    if(n<=6)
        d(n)=input(n)
    end
    if(n>1)
        p(n)=p(n-1)+d(n)
        r(n)=p(n)+16*d(n-1)
        s(n)=s(n-1)+r(n)
    end
    if(n==1)
        p(n)=d(n)
        r(n)=p(n)
        s(n)=r(n)
    end
        
    
    
end
end

