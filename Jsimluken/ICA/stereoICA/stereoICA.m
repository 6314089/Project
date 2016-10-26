function y = stereoICA(filename)
    [data,~] = audioread(filename);
    V = getWhitener(data);
    X_ = V * data';
    angle = maxKurtosis(X_);
    U = TRolling(angle);
    y = U * X_;
    
return