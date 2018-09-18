%This function filtered data
function [out] = filterTriangle_v5(input)
% init arrays
d=[]
p=[0]
r=[0]
s=[0]
% we start from n=n-12, because we need start in array from 1, not from 12.
for n = 13:length(input)
    d(n-12)=input(n)-input(n-6)-input(n-6)+input(n-12)
    p(n-11)=p(n-12)+d(n-12)
    r(n-11)=p(n-11)+16*d(n-12)
    s(n-11)=s(n-12)+r(n-11)
end
out=s % out of function
end

