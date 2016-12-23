%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y : ���̓X�y�N�g���O����
%     �iK*N�s��CK: ���g���̕������CN: �Ȃ̒����j
% gamma : �X�y�N�g���O�����̙p�w��
% w : P �̊��炩���ɑ΂���d��
% u : Y �� H+P �̈�v�x�ɑ΂���d��
% num : �X�V��
%
% H : ���g�����̃X�y�N�g���O�����iK*N�s��j
% P : �Ŋy�퐬���̃X�y�N�g���O�����iK*N�s��j
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [H, P] = hpss_core2(Y, gamma, w, u, num)
[K, N] = size(Y);
Nyquist = ceil(K/2);
YY = abs(Y).^gamma;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �����l
H = YY;
P = YY;
theta = zeros(Nyquist, N);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �X�V����num��J��Ԃ�

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
% �X�y�N�g���O�����𕜌�����

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
% �i�C�L�X�g���ȍ~������Ώ̂ɂ���

disp('hpss_conj');
tic
H(K - Nyquist + 1:K, :) = (flipud(conj(H(K - 2 * (Nyquist - 1):K - Nyquist + 1, :))));
P(K - Nyquist + 1:K, :) = (flipud(conj(P(K - 2 * (Nyquist - 1):K - Nyquist + 1, :))));
disp('hpss_conjed');
toc