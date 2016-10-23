%[data, Fs] = audioread('../Audio/drums_120bpm.wav');
%[data, Fs] = audioread('../Audio/A4_sin_F4_saw.wav');
[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_all.wav');
%[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_string.wav');
%[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_drums.wav');
%[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_piano.wav');

X = stft(mono(data), 4096, 1000);
%X = X(1:512, :);
X = X(1:100, 1:400);
im = imagesc([0, length(data)/44100], [0, 22050], abs(X.^2));
im.Parent.YDir = 'normal';
colorbar;