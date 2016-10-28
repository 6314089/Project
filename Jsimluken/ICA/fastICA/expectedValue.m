function res = expectedValue(gy,y)
    % gy is 1 * n matrix. functioned.
    % y is 1 * n matrix
    n = size(gy);
    n = n(2);
    res = 0;
    for index = 1:n
        res = res + P(y(1,index)) * gy(1,index);
    end
return 