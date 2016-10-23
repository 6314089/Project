%[data, Fs] = audioread('../Audio/drums_120bpm.wav');
%[data, Fs] = audioread('../Audio/A4_sin_F4_saw.wav');
[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_all.wav');
%[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_string.wav');
%[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_drums.wav');
%[data, Fs] = audioread('../Audio/Twinkle_Twinkle_Little_Star_piano.wav');

X = stft(mono(data), 4096, 1000);
Y = istft(X, 4096, 1000);

sound(Y, Fs);