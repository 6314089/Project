function I = maxKurtosis(data)
    tmp = zeros(360,1);
    for angle = 1:360
        U = TRolling(angle);
        Y = U * data;
        tmp(angle,1) = kurtosis(Y(1,:),Y(2,:));
    end
    [~,I] = max(tmp);
return 