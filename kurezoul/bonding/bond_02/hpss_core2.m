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
function [H, P] = hpss_core2(Y, gamma, w, u, num)
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

disp('hpss_update');
tic
hH = H(1:Nyquist, :);
hP = P(1:Nyquist, :);

YYpow2 = YY(1:Nyquist, :) .^ 2;
zeroCol = zeros(size(hH, 1), 1);
row = size(hH, 2);
ufo = u + 4;
Yufou = u * ufo * YYpow2;
avoidZero = 1e-10;
avoidUfo = ufo + avoidZero;

ufoudw = 4 + u / w;
Yufoudw = u * ufoudw * YYpow2;
avoidUfoudw = ufoudw + avoidZero;
zeroRow = zeros(1, size(hP, 2));
nyqRow = P(Nyquist + 1, :);
col = size(hP, 1);

for i = 1:num
    % Update for H
    Hext = [zeroCol, hH, zeroCol];
    B = Hext(:, 3:row + 2) + Hext(:, 1:row);
    hH = (B + sqrt((B .* B) + (Yufou .* theta))) / avoidUfo;
    % Update for B
    Pext = [zeroRow; hP; nyqRow];
    B = Pext(3:col + 2, :) + Pext(1:col, :);
    hP = (B + sqrt((B .* B) + (Yufoudw .* (1 - theta)) / w)) / avoidUfoudw;
    % Update for Theta
    Hpow2 = hH .* hH;
    Ppow2 = hP .* hP;
    theta(1:Nyquist, :) = Hpow2 ./ (Hpow2 + Ppow2 + avoidZero);
end

H(1:Nyquist, :) = hH;
P(1:Nyquist, :) = hP;
disp('hpss_updated');
toc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% スペクトログラムを復元する

disp('hpss_reconstruct');
tic
gammaInv = 1/gamma;
Yang = angle(Y(1:Nyquist, :));
CosYang = cos(Yang);
SinYang = sin(Yang);

hH = H(1:Nyquist, :);
hP = P(1:Nyquist, :);
hH = hH .^ gammaInv;
hP = hP .^ gammaInv;
H(1:Nyquist, :) = complex(hH .* CosYang, hH .* SinYang);
P(1:Nyquist, :) = complex(hP .* CosYang, hP .* SinYang);
disp('hpss_reconstructed');
toc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ナイキスト数以降を共役対称にする

disp('hpss_conj');
tic
H(K - Nyquist + 1:K, :) = (flipud(conj(H(K - 2 * (Nyquist - 1):K - Nyquist + 1, :))));
P(K - Nyquist + 1:K, :) = (flipud(conj(P(K - 2 * (Nyquist - 1):K - Nyquist + 1, :))));
disp('hpss_conjed');
toc