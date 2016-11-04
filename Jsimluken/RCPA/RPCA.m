function [L,S] = RPCA(X,lambda)
    Y = X/max([norm(X),lambda^(-1)*norm(X,inf)]);
    [m,n] = size(X);
    S = zeros(m,n);
    L = eye(m,n);
    mu = 1.25/norm(X);
    rho = 1.5;
    %disp(m)
    %notConverged = ture;
    for i = 1:15
        [U,SIGMA,V] = svd(X-S+mu^(-1)*Y);
        % U == m*m
        % SIGMA == m*n
        % V = n*n
        %disp(size(SIGMA));
        %disp(size(V))
        L = U * F(SIGMA,mu-1)*V';
        S = F(X-L+mu^(-1)*Y,lambda*mu-1);
        Y = Y + mu*(X-L-S);
        mu = rho*mu;
    end
return