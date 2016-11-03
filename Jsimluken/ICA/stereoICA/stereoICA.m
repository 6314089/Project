function y = stereoICA(X)
    %[data,~] = audioread(filename);
    V = getWhitener(X);
    Z = V * X';
    angle = maxKurtosis(Z);
    U = TRolling(angle);
    y = U * Z;
return