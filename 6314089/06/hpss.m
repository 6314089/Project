%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% path : オーディオファイルのパス
% window : 短時間フーリエ解析の窓の幅
% step : 短時間フーリエ解析のステップ幅
% gamma : スペクトログラムの冪指数
% w : 最適化時の P の滑らかさに対する重さ
% u : 最適化時の Y と H+P の一致度合いに対する重さ
% num : 更新回数
%
% H : 調波成分のスペクトログラム
%     （K*N行列，K: 周波数の分割数，N: 曲の長さ）
% P : 打楽器成分のスペクトログラム
%     （K*N行列）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [H, P] = hpss(path, window, step, gamma, w, u, num)
[data, Fs] = audioread(path);
X = stft(mono(data), window, step);

[H, P] = hpss_core(X, gamma, w, u, num);

Yh = istft_no_window_func(H, window, step);
audiowrite('H.wav', Yh, Fs);

Yp = istft_no_window_func(P, window, step);
audiowrite('P.wav', Yp, Fs);