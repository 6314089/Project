[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_all.wav');

X = stft(mono(data), 1024, 512);
X = X(1:100, :);

figure;
im = imagesc([0, length(data)/Fs], [0, 100 * Fs / 1024], abs(X).^(0.3));
im.Parent.YDir = 'normal';
colorbar;
xlabel('t[s]')
ylabel('abs(data) .^ 0.3')
title('all part')


[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_strings.wav');

X = stft(mono(data), 1024, 512);
X = X(1:100, :);

figure;
im = imagesc([0, length(data)/Fs], [0, 100 * Fs / 1024], abs(X).^(0.3));
im.Parent.YDir = 'normal';
colorbar;
xlabel('t[s]')
ylabel('abs(data) .^ 0.3')
title('strings')


[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_drums.wav');

X = stft(mono(data), 1024, 512);
X = X(1:100, :);

figure;
im = imagesc([0, length(data)/Fs], [0, 100 * Fs / 1024], abs(X).^(0.3));
im.Parent.YDir = 'normal';
colorbar;
xlabel('t[s]')
ylabel('abs(data) .^ 0.3')
title('drums')


[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_piano.wav');

X = stft(mono(data), 1024, 512);
X = X(1:100, :);

figure;
im = imagesc([0, length(data)/Fs], [0, 100 * Fs / 1024], abs(X).^(0.3));
im.Parent.YDir = 'normal';
colorbar;
xlabel('t[s]')
ylabel('abs(data) .^ 0.3')
title('piano')