function [y] = cusp3v1(x)
l=5;
k=11;
m1=16;
m2=1;
lgx=length(x);
dk=zeros(1,lgx);
d=zeros(1,lgx);
p=zeros(1,lgx);
q=zeros(1,lgx);
y=zeros(1,lgx);
for n=1:lgx %schitaem massiv dk
    if (n-k)<=0
        ddk=x(n);
    else
        ddk=x(n)-x(n-k);
    end
    dk(n)=ddk;
end
for n=1:lgx %schitaem massiv d1
    if (n-1)<=0
        dd=x(n);
    else
        dd=x(n)-x(n-1);
    end
    d(n)=dd;
end
for n=2:lgx %shitaem p
    if (n-l)<=0
        pp=p(n-1)+dk(n);
    else
        pp=p(n-1)+dk(n)-k.*d(n-l);
    end
    p(n)=pp;
end
for n=2:lgx %shitaem p
    q(n)=q(n-1)+m2*p(n);
end
for n=2:lgx %shitaem p
    y(n)=y(n-1)+q(n)+m1*p(n);
end
end
    