function y=mass(A,t,t1,t2)
lgt=length(t);
y=zeros(1,lgt);
for i=1:lgt
    if t(i)<0
        y(i)=0;
    else
        y(i)=A*(exp(-t(i)/t1)-exp(-t(i)/t2));%Вычисление функции
    end
end
