[masy,masx] = Gener(-10,100,16,5) 
figure 
plot(masx,masy) 
filterData = Filter(masy)
%disp(filterData)
figure 
plot(masx,filterData) 