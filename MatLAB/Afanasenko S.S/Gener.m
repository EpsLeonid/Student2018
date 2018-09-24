function [ Data, t ] = Gener( A,B,t1,t2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Data = []
t = []
for i = A:B
if (i<0)
    y=0
else 
    y=1*(exp(-i/t1)-exp(-i/t2))
end
Data (i-A+1) = y
t (i-A+1) = i
end
end

