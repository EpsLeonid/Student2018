clc;
clear;
A=1;
t1=16;
t2=5;
t=-10:1:100;
y=mass(A,t,t1,t2);%������ ������� ������ 1
figure,plot(t,y),grid;
%%%%%%%%%%%%%%%%%%%%%������� 3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% 3 %%%%%%%%%%%%
[n,s]=cusp3v(t1,t2,A);
figure,plot(n,s),grid;