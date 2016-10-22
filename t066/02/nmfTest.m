% Read audio
[y, fs] = audioread('../Audio/Riff2.wav');
% mono
y = y(:, 1);

% stft
width = 4096;
step = 2048;
[stfted, f, t] = stft(y, @hann, step, width, fs);
%  Absolute value and Phase
Y = abs(stfted);
phase = angle(stfted);

%surf(t, f, log(Y), 'edgecolor', 'none');
%axis tight;
%view(0, 90);
%set(gca, 'Yscale', 'log');

% NMF
k = 5;  % Only 5 pitchs are used in sample audio
[W, H] = nnmf(Y, k);
[W, H] = nnmf(Y, k, 'algorithm', 'mult', 'w0', W, 'h0', H);

% Write into parts
for i = 1:k
    ty = istft(W(:, i) * H(i, :) .* exp(1j * phase), @hann, step, width);
    ty = abs(ty) .* cos(angle(ty));
    audiowrite(strcat('temp', num2str(i), '.m4a'), ty, fs);
end

% Write Mixed one
ty = istft(W * H .* exp(1j * phase), @hann, step, width);
ty = abs(ty) .* cos(angle(ty));
audiowrite(strcat('temp1to4mixed.m4a'), ty, fs);