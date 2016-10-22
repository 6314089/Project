function D = diff_p(v)
    D = zeros(length(v) - 1);
    
    for k = 1:(length(D))
        diff = v(k) - v(k + 1);
        if diff >=0
            D(k) = diff;
        else
            D(k) = 0;
        end
    end