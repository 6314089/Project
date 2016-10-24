function ret = cost_S_time(H, N, K)
ret = 0;
for n = 1:N-1
    for k = 1:K
        ret = ret + (H(n+1, k) - H(n, k)) .^ 2;
    end
end