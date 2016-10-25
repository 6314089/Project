%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y : 入力スペクトログラム
%     （K*N行列，K: 周波数の分割数，N: 曲の長さ）
% gamma : スペクトログラムの冪指数
% w : P の滑らかさに対する重さ
% u : Y と H+P の一致度に対する重さ
% num : 更新回数
%
% H : 調波成分のスペクトログラム（K*N行列）
% P : 打楽器成分のスペクトログラム（K*N行列）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [H, P] = hpss(Y, gamma, w, u, num)
[K, N] = size(Y);
Nyquist = ceil(K/2);
YY = abs(Y).^gamma;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 初期値
H = YY;
P = YY;
theta = zeros(Nyquist, N);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 更新式をnum回繰り返す
for i = 1:num
    for n = 1:N
        for k = 1:Nyquist %1からナイキスト数まで
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
            c = u * theta(k, n) * (YY(k, n))^2;
            H(k, n) = (b + sqrt(b^2 +a*c)) / a;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % P(k, n)の更新式
            a = 4 + u/w;
            if k == 1
                b = P(k+1, n);
            else
                b = (P(k-1, n) + P(k+1, n));
            end
            c = u/w * (1 - theta(k, n)) * (YY(k, n))^2;
            P(k, n) = (b + sqrt(b^2 +a*c)) / a;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % theta(k, n)の更新式
            theta(k, n) = H(k, n)^2 / (H(k, n)^2 + P(k, n)^2);
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% スペクトログラムを復元する
for n = 1:N
    for k = 1:Nyquist
        H(k, n) = H(k, n) .^ (1/gamma);
        P(k, n) = P(k, n) .^ (1/gamma);
        
        r = angle(Y(k, n));
        H(k, n) = complex(H(k, n) * cos(r), H(k, n) * sin(r));
        P(k, n) = complex(P(k, n) * cos(r), P(k, n) * sin(r));
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ナイキスト数以降を共役対称にする
for i = (Nyquist + 1):K
    H(i, :) = conj(H(mod(K-i+1,K)+1, :));
    P(i, :) = conj(P(mod(K-i+1,K)+1, :));
end