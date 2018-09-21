function[s]=untitled7(y)
d=[]
p=[]
r=[]
s=[]
k=5;%values will be used
l=5;
M=16;
%filter's data
for n=1:111
    W=n-1
    D=n-k
    H=n-k-l  
    if (W<=0 && D<=0 && H<=0)%filtering n<1
    d(n)=y(n);
    p(n)=d(n);
    r(n)=p(n)+M*d(n);
    s(n)=r(n);
    end
    if (D<=0 && H<=0 && W>0)
    d(n)=y(n)-y(W);
    p(n)=p(W)+d(n);
    r(n)=p(n)+M*d(n);
    s(n)=s(W)+r(n);
    end
    if (H<=0 && W>0 && D>0)
    d(n)=y(n)-y(D)-y(W);
    p(n)=p(W)+d(n);
    r(n)=p(n)+M*d(n);
    s(n)=s(W)+r(n);
    end
    if (H>0 && W>0 && D>0)
    d(n)=y(n)-y(D)-y(W)+y(H);
    p(n)=p(W)+d(n);
    r(n)=p(n)+M*d(n);
    s(n)=s(W)+r(n);
    end
end
end

%generated
