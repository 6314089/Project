window = 4096;
step = 2048;
audio = '../ModelAudio/all.wav';
num = 30;


[data, Fs] = audioread(audio);

%X = stft(mono(data), window, step);
X = stft_no_window_func(mono(data), window, step);

[H, P] = hpss(X, 0.3, 1, 1, num);

%Y = istft(X, window, step);
Y = istft_no_window_func(X, window, step);
audiowrite('all.wav', Y, Fs);

%Yh = istft(H, window, step);
Yh = istft_no_window_func(H, window, step);
audiowrite('H_all.wav', Yh, Fs);

%Yp = istft(P, window, step);
Yp = istft_no_window_func(P, window, step);
audiowrite('P_all.wav', Yp, Fs);