function V = getWhitener(data)
    % data = n*k, k channels
    % R = k * k
    R = cov(data);
    [E,D] = eig(R);
    V = D^(-1/2) * E';
    % V * R * V' == eye(k)
end