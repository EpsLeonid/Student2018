function [s] = cusp_likeFilter(V)

    % constants init
    l = 6;
    k = 13;
    m1 = 16;
    m2 = 1;

    % arrays preallocation
    dk = zeros(1, length(V));
    d1 = zeros(1, length(V));
    p = zeros(1, length(V));
    q = zeros(1, length(V));
    s = zeros(1, length(V));

    % calculating d's
    for n = 1:length(V)
        if (n - k) <= 0
            dk(n) = V(n);
        else
            dk(n) = V(n) - V(n - k);
        end
        if (n - 1) <= 0
            d1(n) = V(n);
        else
            d1(n) = V(n) - V(n - 1);
        end
    end
    
    % calculating p, q and s
    for n = 2:length(V)
        if (n - l) <= 0
            p(n) = p(n - 1) + dk(n);
        else
            p(n) = p(n - 1) + dk(n) - k * d1(n - l);
        end
        q(n) = q(n - 1) + m2 * p(n);
        s(n) = s(n - 1) + q(n) + m1 * p(n);
    end  
end