function [H, P] = hpss(Y, w, u, num)
[K, N] = size(Y);
H = Y;
P = Y;
theta = zeros(K, N);

for i = 1:num
    for n = 1:N
        for k = 1:K
            a = 4 + u;
            b = (H(k, n-1) + H(k, n+1));
            c = u * theta(k, n) * (Y(n, k))^2;
            H(k, n) = (b + sqrt(b^2 +a*c)) / a;
            
            a = 4 + u/w;
            b = (P(k-1, n) + P(k+1, n));
            c = u/w * (1 - theta(k, n)) * (Y(n, k))^2;
            H(k, n) = (b + sqrt(b^2 +a*c)) / a;
            P(k, n)
            
            theta(k, n) = H(k, n).^2 / (H(k, n).^2 + P(k, n).^2);
        end
    end
end