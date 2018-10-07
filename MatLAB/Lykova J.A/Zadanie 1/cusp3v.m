function [n,s] = cusp3v(t1,t2,A)
l=5;
k=11;
n=0:1e2;
m1=16;
m2=1;
M=m1/m2;
p(1)=0;
q(1)=0;
s(1)=0;
dk(1)=mass(A,n(1),t1,t2)-mass(A,n(1)-k,t1,t2);
dl(1)=mass(A,n(1),t1,t2)-mass(A,n(1)-l,t1,t2);
for i=2:length(n)
    dk(i)=mass(A,n(i),t1,t2)-mass(A,n(i)-k,t1,t2);
    dl(i)=mass(A,n(i),t1,t2)-mass(A,n(i)-l,t1,t2);
    if i-l<1
    p(i)=p(i-1)+dk(i)-k*0;
    q(i)=q(i-1)+m2*p(i);
    s(i)=s(i-1)+q(i)+m1*p(i);
    else
    p(i)=p(i-1)+dk(i)-k*dl(i-l);
    q(i)=q(i-1)+m2*p(i);
    s(i)=s(i-1)+q(i)+m1*p(i);
    end
end
end

