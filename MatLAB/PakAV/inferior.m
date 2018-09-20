function s = inferior(y)
% parametry k,l,M dlya trapeceidal'nogo fil'tra 
k = 9;
l = 5;
M = 16;
%pustye massivy dlya promezhutochnyh vychislenij
p = zeros(1,115);
s = zeros(1,115);
for n = 15:1:115 %cikl dlya preobrazovaniya generiruemogo massiva
%preobrazovaniya funkcii, dlya predotvrashcheniya oshibki svyazannoj s otricatel'nymi indeksami, 
%bylo sdelano smeshchenie vpravo na 15 znachenij. Nulevoe znachenie argumenta funkcii nachinaetsya s 15 indeksa.
d(n) = y(n)-y(n-k)-y(n-l)+y(n-k-l);
p(n) = p(n-1)+d(n);
r(n) = p(n)+M*d(n);
s(n) = s(n-1)+r(n);
end  
figure('Name','Secondary') %nazvanie grafika
plot(-14:1:100,s) %funkciya dlya izobrazheniya grafika
axis([-10 100 -1 45]) %nastrojka osej
end

