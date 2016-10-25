%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Y : ���̓X�y�N�g���O����
%     �iK*N�s��CK: �i�C�L�X�g���CN: �Ȃ̒����j
% w : P �̊��炩���ɑ΂���d��
% u : Y �� H+P �̈�v�x�ɑ΂���d��
% num : �X�V��
%
% H : ���g�����̃X�y�N�g���O�����iK*N�s��j
% P : �Ŋy�퐬���̃X�y�N�g���O�����iK*N�s��j
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
            % H(k, n)�̍X�V��
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
            % P(k, n)�̍X�V��
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
            % theta(k, n)�̍X�V��
            theta(k, n) = H(k, n)^2 / (H(k, n)^2 + P(k, n)^2);
        end
    end
end