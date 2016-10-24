function V = getWhitener(data)
    R = cov(data);
    [E,D] = eig(R);
    V = D^(-1/2) * E';
end