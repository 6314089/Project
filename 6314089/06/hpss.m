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
function [H, P] = hpss(Y, gamma, w, u, num)
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
for i = 1:num
    for n = 1:N
        for k = 1:Nyquist %1����i�C�L�X�g���܂�
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
            c = u * theta(k, n) * (YY(k, n))^2;
            H(k, n) = (b + sqrt(b^2 +a*c)) / a;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % P(k, n)�̍X�V��
            a = 4 + u/w;
            if k == 1
                b = P(k+1, n);
            else
                b = (P(k-1, n) + P(k+1, n));
            end
            c = u/w * (1 - theta(k, n)) * (YY(k, n))^2;
            P(k, n) = (b + sqrt(b^2 +a*c)) / a;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % theta(k, n)�̍X�V��
            theta(k, n) = H(k, n)^2 / (H(k, n)^2 + P(k, n)^2);
        end
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �X�y�N�g���O�����𕜌�����
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
% �i�C�L�X�g���ȍ~������Ώ̂ɂ���
for i = (Nyquist + 1):K
    H(i, :) = conj(H(mod(K-i+1,K)+1, :));
    P(i, :) = conj(P(mod(K-i+1,K)+1, :));
end