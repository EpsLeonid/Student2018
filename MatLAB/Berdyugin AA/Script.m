%Start all functions
[masx,masy]=generat(-10,100,1,16,5) % generate
figure %first plot
plot(masx,masy) 
filterData=untitled7(masy) % filtering
figure %second plot
plot(masx,filterData)