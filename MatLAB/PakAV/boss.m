function y=boss(tau_1, tau_2, A)
% tau_1 = 16; %znachenie tau odin
% tau_2 = 5; %znachenie tau dva
% A = 1; %amplituda
for t = -14:1:100 %cikl generiruyushchuyu massiv chisel
i = t+15; %sdvig dlya indeksov massiva
if t >= 0 %uslovie dlya argumenta t<0 i t>=0
y(i) = A*(exp(-t./tau_1)-exp(-t./tau_2));
else
y(i) = 0;
end
end
figure('Name','Primary') %nazvanie grafika
plot(-14:1:100,y) %funkciya dlya izobrazheniya grafika 
axis([-10 100 -0.01 0.45]) %nastrojka osej
% inferior(y); %funkciya kotoraya preobrazuet massiv chisel
end

