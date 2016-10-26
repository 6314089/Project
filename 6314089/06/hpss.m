function [H, P] = hpss(audio, window, step, w, u, gamma, num)
[data, Fs] = audioread(audio);
X = stft(mono(data), window, step);

[H, P] = hpss_core(X, gamma, w, u, num);

Yh = istft_no_window_func(H, window, step);
audiowrite('H_all.wav', Yh, Fs);

Yp = istft_no_window_func(P, window, step);
audiowrite('P_all.wav', Yp, Fs);