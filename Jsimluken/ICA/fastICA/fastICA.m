function Y = fastICA(X)
    %X is n*k matrix. k is channel.
    V = getWhitener(X);
    Z = V * X';
    U = getUnitary(Z);
    Y = U * Z;
return 