function [I,k1,k2] = maxKurtosis(data)
    % data == k * n; k channels;
    tmp = zeros(360,1);
    k1 = zeros(360,1);
    k2 = zeros(360,1);
    for angle = 1:360
        U = TRolling(angle);
        Y = U * data;
        t1 = kurtosis(Y(1,:));
        t2 = kurtosis(Y(2,:));
        tmp(angle,1) = t1 + t2;
        k1(angle,1) = t1;
        k2(angle,1) = t2;
    end
    [~,I] = max(tmp);
return 