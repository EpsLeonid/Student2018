function [ s ] = Filter( v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
k=8
l=5
M=16

d = []
p = [0]
r = [0]
s = [0]

for i=1:length(v)
    disp(i)
       if (i>1)
        d(i) = v(i)
       end
       
    if (i>l)
        d(i) = v(i)-v(i-l)
    end
    
     if (i>k)
       d(i) = v(i)-v(i-k)-v(i-l)
     end
    
    if (i>k+l)
    d(i) = v(i)-v(i-k)-v(i-l)+v(i-k-l)
    end 

  if (i>1)
     p(i)=d(i)+p(i-1)
     r(i)=p(i)+M*d(i)
     s(i)=r(i)+s(i-1)
  end
    
    if(i==1)
        d(i) = v(i)
        p(i)=d(i) 
        r(i)=p(i)+M*d(i)
        s(i)=r(i)
    end
end
    end
