%Script for start all function
[masx,masy]=gen(-10,100,1,16,5) % generate data
figure % create new window for plot
plot(masx,masy) %  draw data
filterData=filterTriangle_v5(masy) % do filter dara
figure % Create new window for plot
plot(masx,filterData) % draw data