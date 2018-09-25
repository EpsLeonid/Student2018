%file function generate massiv chisel dlia grafika po formule nije
function [ Data, t ] = Gener( A,B,t1,t2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%zadanie massivov
Data = []
t = []
%predeli iz hidera
for i = A:B
if (i<0)
    y=0
else
    %function iz zadania
    y=1*(exp(-i/t1)-exp(-i/t2))
end
%zapolnenie massivov(vihodnie dannie), i-A+1 ltkftn massiv ot 0, a ne ot
%-10
Data (i-A+1) = y
t (i-A+1) = i
end
end

