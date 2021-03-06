% cleaning workplace variables
clear

% constant definition
A = 1;
tau1 = 16;
tau2 = 5;
t_start = -10;
t_end = 100;

[X_data, Y_data] = ArrNumGen(A, t_start, t_end, tau1, tau2);
figure();
plot(X_data, Y_data);

[cusp_likeFilter_data] = cusp_likeFilter(Y_data);
figure();
plot(X_data, cusp_likeFilter_data);