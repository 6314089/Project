%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% path : �I�[�f�B�I�t�@�C���̃p�X
% window : �Z���ԃt�[���G��͂̑��̕�
% step : �Z���ԃt�[���G��͂̃X�e�b�v��
% gamma : �X�y�N�g���O�����̙p�w��
% w : �œK������ P �̊��炩���ɑ΂���d��
% u : �œK������ Y �� H+P �̈�v�x�����ɑ΂���d��
% num : �X�V��
%
% H : ���g�����̃X�y�N�g���O����
%     �iK*N�s��CK: ���g���̕������CN: �Ȃ̒����j
% P : �Ŋy�퐬���̃X�y�N�g���O����
%     �iK*N�s��j
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [H, P] = hpss(path, window, step, gamma, w, u, num)
[data, Fs] = audioread(path);
X = stft(mono(data), window, step);

[H, P] = hpss_core(X, gamma, w, u, num);

Yh = istft_no_window_func(H, window, step);
audiowrite('H.wav', Yh, Fs);

Yp = istft_no_window_func(P, window, step);
audiowrite('P.wav', Yp, Fs);