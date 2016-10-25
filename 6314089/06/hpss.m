%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y : 入力スペクトログラム
%     （K*N行列，K: ナイキスト数，N: 曲の長さ）
% w : P の滑らかさに対する重さ
% u : Y と H+P の一致度に対する重さ
% num : 更新回数
%
% H : 調波成分のスペクトログラム（K*N行列）
% P : 打楽器成分のスペクトログラム（K*N行列）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [H, P] = hpss(Y, w, u, num)
[K, N] = size(Y);
H = Y;
P = Y;
theta = zeros(K, N);

for i = 1:num
    for n = 1:N
        for k = 1:K
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % H(k, n)の更新式
            a = 4 + u;
            if n == 1
                b = H(k, n+1);
            elseif n == N
                b = H(k, n-1);
            else
                b = (H(k, n-1) + H(k, n+1));
            end
            c = u * theta(k, n) * (Y(n, k))^2;
            H(k, n) = (b + sqrt(b^2 +a*c)) / a;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % P(k, n)の更新式
            a = 4 + u/w;
            if k == 1
                b = P(k+1, n);
            elseif k == K
                b = P(k-1, n);
            else
                b = (P(k-1, n) + P(k+1, n));
            end
            c = u/w * (1 - theta(k, n)) * (Y(n, k))^2;
            P(k, n) = (b + sqrt(b^2 +a*c)) / a;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % theta(k, n)の更新式
            theta(k, n) = H(k, n)^2 / (H(k, n)^2 + P(k, n)^2);
        end
    end
end