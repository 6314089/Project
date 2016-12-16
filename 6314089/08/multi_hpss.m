%%[argin]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% path    : オーディオファイルのパス
%
% 以下1段回目のHPSSのパラメータ
% frame1  : スペクトログラム作成時の短時間フーリエ解析の窓の幅
% step1   : スペクトログラム作成時の短時間フーリエ解析のステップ幅
% gammma1 : スペクトログラムへの冪指数
% w1      : 最適化時の P の滑らかさに対する重さ
% u1      : 最適化時の Y と H+P の一致度合いに対する重さ
% n1      : 更新回数
%
% 以下2段回目のHPSSのパラメータ
% frame2  : スペクトログラム作成時の短時間フーリエ解析の窓の幅
% step2   : スペクトログラム作成時の短時間フーリエ解析のステップ幅
% gammma2 : スペクトログラムへの冪指数
% w2      : 最適化時の P の滑らかさに対する重さ
% u2      : 最適化時の Y と H+P の一致度合いに対する重さ
% n2      : 更新回数
%
% audio   : 結果をオーディオファイルに書き出すかどうか
%           trueもしくはfalse
%
%%[argout]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% H1      : ビブラート音，打楽器音以外のスペクトログラム
% H2      : ビブラートのかかった音のスペクトログラム
% P2      : 打楽器の音のスペクトログラム
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