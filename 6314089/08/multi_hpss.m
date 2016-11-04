function [H1, H2, P2] = multi_hpss (...
path, ...
frame1, step1, gamma1, w1, u1, n1, ...
frame2, step2, gamma2, w2, u2, n2 ...
)

[X, Fs] = audioread(path);

Y = stft(mono(X), @hann, step1, frame1, Fs);
[H1, P1] = hpss_core(Y, gamma1, w1, u1, n1);

Xp1 = istft(P1, @hann, step1, frame1);

Yp1 = stft(Xp1, @hann, step2, frame2, Fs);
[H2, P2] = hpss_core(Yp1, gamma2, w2, u2, n2);