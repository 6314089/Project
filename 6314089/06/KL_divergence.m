function DKL = KL_divergence(X, Z)
[K, N] = size(X);
DKL = 0;
for n = 1:N
    for k = 1:K
        DKL = DKL + X(k, n) * log(X(k, n) / Z(k, n)) - X(k, n) + Z(k, n);
    end
end