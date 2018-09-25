%v gener otprav vhodnie dannie
%masy/x to chto budem stroit
[masy,masx] = Gener(-10,100,16,5) 
figure 
plot(masx,masy)
%filtr znacheniy function
filterData = Filter(masy)
figure 
plot(masx,filterData)
%plot - postroenie grafikov