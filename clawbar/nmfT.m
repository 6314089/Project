% Read audio
[y, fs] = audioread('Riff2.wav');
% Convert to mono
y = (y(:, 1) + y(:, 2)) / 2;

% stft
width = 4096;
step = 2048;
[stfted, f, t] = stft(y, @hann, step, width, fs);
%  Absolute value and Phase
Y = abs(stfted);
phase = angle(stfted);

% NMF
k = 5;  % Only 5 pitchs are used in sample audio
[W, H] = nnmf(Y, k);
[W, H] = nnmf(Y, k, 'algorithm', 'mult', 'w0', W, 'h0', H);

% stft
width = 8192;
step = 4096;
[stfted2, f2, t2] = stft(y, @hann, step, width, fs);
%  Absolute value and Phase
Y2 = abs(stfted2);
phase2 = angle(stfted2);

% NMF
k = 5;  % Only 5 pitchs are used in sample audio
[W2, H2] = nnmf(Y2, k);
[W2, H2] = nnmf(Y2, k, 'algorithm', 'mult', 'w0', W2, 'h0', H2);
