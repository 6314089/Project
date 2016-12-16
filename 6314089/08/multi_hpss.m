%%[argin]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% path    : �I�[�f�B�I�t�@�C���̃p�X
%
% �ȉ�1�i��ڂ�HPSS�̃p�����[�^
% frame1  : �X�y�N�g���O�����쐬���̒Z���ԃt�[���G��͂̑��̕�
% step1   : �X�y�N�g���O�����쐬���̒Z���ԃt�[���G��͂̃X�e�b�v��
% gammma1 : �X�y�N�g���O�����ւ̙p�w��
% w1      : �œK������ P �̊��炩���ɑ΂���d��
% u1      : �œK������ Y �� H+P �̈�v�x�����ɑ΂���d��
% n1      : �X�V��
%
% �ȉ�2�i��ڂ�HPSS�̃p�����[�^
% frame2  : �X�y�N�g���O�����쐬���̒Z���ԃt�[���G��͂̑��̕�
% step2   : �X�y�N�g���O�����쐬���̒Z���ԃt�[���G��͂̃X�e�b�v��
% gammma2 : �X�y�N�g���O�����ւ̙p�w��
% w2      : �œK������ P �̊��炩���ɑ΂���d��
% u2      : �œK������ Y �� H+P �̈�v�x�����ɑ΂���d��
% n2      : �X�V��
%
% audio   : ���ʂ��I�[�f�B�I�t�@�C���ɏ����o�����ǂ���
%           true��������false
%
%%[argout]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% H1      : �r�u���[�g���C�Ŋy�퉹�ȊO�̃X�y�N�g���O����
% H2      : �r�u���[�g�̂����������̃X�y�N�g���O����
% P2      : �Ŋy��̉��̃X�y�N�g���O����
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [H1, H2, P2] = multi_hpss (...
path, ...
frame1, step1, gamma1, w1, u1, n1, ...
frame2, step2, gamma2, w2, u2, n2, ...
audio ...
)

[X, Fs] = audioread(path);

Y = stft(mono(X), @hann, step1, frame1, Fs);
[H1, P1] = hpss_core(Y, gamma1, w1, u1, n1);

Xp1 = istft(P1, @hann, step1, frame1);

Yp1 = stft(Xp1, @hann, step2, frame2, Fs);
[H2, P2] = hpss_core(Yp1, gamma2, w2, u2, n2);


if audio
    Yh1 = istft(H1, @hann, step1, frame1);
    audiowrite('H1.wav', Yh1, Fs);
    
    Yp2 = istft(P2, @hann, step2, frame2);
    audiowrite('P2.wav', Yp2, Fs);
    
    Yh2 = istft(H2, @hann, step2, frame2);
    audiowrite('H2.wav', Yh2, Fs); 
end