function Y = fastICA(X)
    %X is n*k matrix. k is channel.
    V = getWhitener(X);
    Z = V * X';
    U = getUnitary(Z);
    Y = U * Z;
    M = max(Y');
    Y = Y/max(M);
return 