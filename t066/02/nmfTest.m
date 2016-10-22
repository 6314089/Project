% Read audio
[y, fs] = audioread('test10k.wav');
% mono
y = y(:, 1);

% stft
[stfted, f, t] = spectrogram(y, hann(512), 256, 512, fs);
%  ABS and RAD
Y = abs(stfted);
rad = angle(stfted);

%surf(t, f, log(Y), 'edgecolor', 'none');
%axis tight;
%view(0, 90);
%set(gca, 'Yscale', 'log');

% NMF
k = 4;
[W, H] = nnmf(Y, k);

hold on;
for i = 1:k
    plot(W(:, i));
end