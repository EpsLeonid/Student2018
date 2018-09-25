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
    A=n-1
    W=n-l
    D=n-k
    H=n-k-l
    if (W<=0 && D<=0 && H<=0 && A<=0)%filtering n<1
    d(n)=y(n);
    p(n)=d(n);
    r(n)=p(n)+M*d(n);
    s(n)=r(n);
    end
    if (W<=0 && D<=0 && H<=0 && A>0)
    d(n)=y(n);
    p(n)=p(A)+d(n);
    r(n)=p(n)+M*d(n);
    s(n)=s(A)+r(n);
    end
    if (D<=0 && H<=0 && W>0 && A>0)
    d(n)=y(n)-y(W);
    p(n)=p(A)+d(n);
    r(n)=p(n)+M*d(n);
    s(n)=s(A)+r(n);
    end
    if (H<=0 && W>0 && D>0 && A>0)
    d(n)=y(n)-y(D)-y(W);
    p(n)=p(A)+d(n);
    r(n)=p(n)+M*d(n);
    s(n)=s(A)+r(n);
    end
    if (H>0 && W>0 && D>0 && A>1)
    d(n)=y(n)-y(D)-y(W)+y(H);
    p(n)=p(A)+d(n);
    r(n)=p(n)+M*d(n);
    s(n)=s(A)+r(n);
    end
end
end

%generated
