function ret = cost_S_freq(P, N, K)
ret = 0;
for n = 1:N
    for k = 1:K-1
        ret = ret + (P(n, k+1) - P(n, k)) .^ 2;
    end
end