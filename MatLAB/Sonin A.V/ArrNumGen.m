function [X_arr,Y_arr] = ArrNumGen(A, t_start, t_end, tau1, tau2)

% arrays preallocation (MATLAB recommendation)
X_arr = zeros(1, t_end - t_start);
Y_arr = zeros(1, t_end - t_start);

% calculating arr_offset required for proper indexing
if (t_start <= 0)
    arr_offset = abs(t_start) + 1;
end

% data generation
    for t = t_start:1:t_end
        if (t < 0)
            Y_arr(t + arr_offset) = 0;
        else
            Y_arr(t + arr_offset) = (A*(exp(-t/tau1) - exp(-t/tau2)));
        end
        X_arr(t + arr_offset) = t;
    end
end